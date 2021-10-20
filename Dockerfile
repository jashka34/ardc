FROM nvim_neovim:latest

ADD entry.sh /usr/local/bin

RUN echo "path 99999_11111: "$PATH


EXPOSE 22

ENTRYPOINT ["entry.sh"]
CMD ["/usr/sbin/sshd","-D"]



