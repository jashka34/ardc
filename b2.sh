docker build --build-arg ROOT_PASSWORD=12345      \
             --build-arg RUSTUSER_PASSWORD=rust1  \
             -t nvim_sshd -f ./Dockerfile_sshd .



