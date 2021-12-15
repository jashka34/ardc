docker stop alprust
docker rm alprust
docker rmi nvim_common
docker rmi nvim_sshd 
docker rmi nvim_rust_analizer
docker rmi nvim
docker system prune --force
