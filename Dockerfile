FROM alpine:latest

ARG PASSWORD

RUN apk add vim   \
 && apk add mc

RUN apk add git
RUN cd /root/                                        \
 && git clone https://github.com/jashka34/myvim.git  \
 && cp myvim/.vimrc .                                \
 && rm -rf myvim                                     \
 && sed -ie 's/set keymap=russian-jcukenwin/" set keymap=russian-jcukenwin/g' .vimrc


RUN apk add rust      \
 && apk add cargo     \
 && apk add rustup

RUN cd /home/         \
 && mkdir rust        \
 && cd rust           \
 && cargo new hw

RUN apk --update add --no-cache openssh

RUN sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config
RUN sed -ie 's/#Port 22/Port 22/g' /etc/ssh/sshd_config

RUN echo "root:${PASSWORD}" | chpasswd

RUN rm -rf /var/cache/apk/*

RUN /usr/bin/ssh-keygen -A
RUN ssh-keygen -t rsa -b 4096 -f  /etc/ssh/ssh_host_key

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]



