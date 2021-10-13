docker stop alprust
docker rm alprust
docker rmi nvim_appimage nvim_neovim nvim_sshd nvim_rustup nvim
docker system prune --force
