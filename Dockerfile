FROM nvim_rust_analizer:latest

ADD entry.sh /usr/local/bin
ADD create_file_env.sh /etc/profile.d

RUN ls -lah /etc/profile.d

RUN chmod +x /etc/profile.d/create_file_env.sh
RUN /etc/profile.d/create_file_env.sh

EXPOSE 22

ENTRYPOINT ["entry.sh"]
#CMD ["/usr/sbin/sshd","-D"]



