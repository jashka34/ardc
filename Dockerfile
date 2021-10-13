FROM nvim_rustup:latest

ADD entry.sh /usr/local/bin

EXPOSE 22

ENTRYPOINT ["entry.sh"]
CMD ["/usr/sbin/sshd","-D"]



