#!/bin/bash

CUR_DIR=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

ln -sf ${CUR_DIR}/.vimrc ~/.vimrc

ln -sf ${CUR_DIR}/.tmux.conf ~/.tmux.conf
