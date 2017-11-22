#!/bin/bash

DEFAULT_DIR="$HOME"
NUCLEUS_DIR="$DEFAULT_DIR/Nucleus"

NLS_BIN="$NUCLEUS_DIR/bin"
NLS_DATA="$NUCLEUS_DIR/data"
NLS_VENV="$NUCLEUS_DIR/venv"
NLS_CACHE="$NUCLEUS_DIR/cache"
NLS_HISTORY="$NUCLEUS_DIR/history"

function _make_venv () {
    if [ -d $NLS_VENV ]; then
        echo "[ERRR] ... Didnt expect recreating venv"
        exit 1
    else
        virtualenv $NLS_VENV
    fi
}

function make_nucleus () {
    if [ -d $NUCLEUS_DIR ]; then
        echo "[ERRR] ... Nucleus Main directory already exists"
        exit 1
    fi
    mkdir $NUCLEUS_DIR
    _make_venv
    mkdir $NLS_DATA
    mkdir $NLS_CACHE
    mkdir $NLS_HISTORY
}

function copy_artefacts () {
    cp $PWD/src/nlst.sh $NUCLEUS_DIR
    cp $PWD/src/.nls_rc $HOME
}

function boost_bash_profile () {
    echo "echo \"[IP] ... Sourcing nucleus .rc files\"" >> $HOME/.bash_profile
    echo "[ -f .nls_rc ] && source .nls_rc" >> $HOME/.bash_profile
}

function setup_nucleus () {
    make_nucleus
    copy_artefacts
    boost_bash_profile
}

function drop_nucleus () {
    #NOTE: .bash_profile doesnt change after this
    if [ "$1" = "--keep-content" ]; then
        rm -rf $HOME/.nls_rc
    else
        rm -rf $NUCLEUS_DIR
        rm -rf $HOME/.nls_rc
    fi
}

if [ $1 = "setup" ]; then
    setup_nucleus
elif [ "$1" = "drop" ]; then
    if [ "$2" = "--keep-content" ]; then
        drop_nucleus --keep-content
    else
        drop_nucleus
    fi
fi
