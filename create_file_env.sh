#!/bin/sh

echo 'export RUSTUP_HOME="'${RUSTUP_HOME}'"' > /etc/profile.d/create_file_env.sh
echo 'export CARGO_HOME="'${CARGO_HOME}'"' >> /etc/profile.d/create_file_env.sh
echo 'export PATH="'${PATH}'"' >> /etc/profile.d/create_file_env.sh



