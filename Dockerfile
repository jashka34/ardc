FROM alpine:latest

ARG ROOT_PASSWORD
ARG RUSTUSER_PASSWORD

RUN apk update
RUN apk add mc git tmux
RUN apk add build-base cmake automake autoconf libtool pkgconf coreutils curl unzip gettext-tiny-dev

RUN git clone https://github.com/neovim/neovim  \
 && cd neovim                                   \ 
 && git checkout v0.5.1                         \
 && make -j4                                    \
 && make install

RUN apk --update add --no-cache openssh

RUN rm -rf /var/cache/apk/*                                                  \
 && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config   \
 && sed -ie 's/#Port 22/Port 22/g' /etc/ssh/sshd_config

RUN echo "root:${ROOT_PASSWORD}" | chpasswd

RUN /usr/bin/ssh-keygen -A                                      \
 && ssh-keygen -t rsa -b 4096 -f  /etc/ssh/ssh_host_key

RUN adduser rustuser --disabled-password                        \
 && echo "rustuser:${RUSTUSER_PASSWORD}" | chpasswd

COPY .profile /home/rustuser   

RUN cd /home/rustuser                 \
 && chown rustuser:rustuser .profile  

ADD entry.sh /usr/local/bin

EXPOSE 22 8080

ENTRYPOINT ["entry.sh"]
CMD ["/usr/sbin/sshd","-D"]



