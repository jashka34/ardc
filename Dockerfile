FROM alpine:latest

ARG ROOT_PASSWORD
ARG RUSTUSER_PASSWORD

RUN apk update
RUN apk add vim mc git tmux
RUN apk --update add --no-cache openssh

RUN apk add rust      \
 && apk add cargo     \
 && apk add rustup

RUN rm -rf /var/cache/apk/*

RUN sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config
RUN sed -ie 's/#Port 22/Port 22/g' /etc/ssh/sshd_config

RUN echo "root:${ROOT_PASSWORD}" | chpasswd

RUN /usr/bin/ssh-keygen -A
RUN ssh-keygen -t rsa -b 4096 -f  /etc/ssh/ssh_host_key

RUN adduser rustuser --disabled-password

RUN echo "rustuser:${RUSTUSER_PASSWORD}" | chpasswd

COPY .profile /home/rustuser   
COPY .vimrc   /home/rustuser

RUN cd /home/rustuser                 \
 && chown rustuser:rustuser .profile  \
 && chown rustuser:rustuser .vimrc

USER rustuser

RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
RUN vim +PluginInstall +qall


USER root

ADD entry.sh /usr/local/bin

EXPOSE 22

ENTRYPOINT ["entry.sh"]
CMD ["/usr/sbin/sshd","-D"]



