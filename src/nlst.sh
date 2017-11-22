#!/bin/bash


function nls_export () {
    if [ "$1" = "--data" ] || [ "$1" = "-d" ]; then
        cp $2 $NLS_DATA
    elif [ "$1" = "--cache" ] || [ "$1" = "-c" ]; then
        cp $2 $NLS_CACHE
    elif [ "$1" = "--bin" ] || [ "$1" = "-b" ]; then
        cp $2 $NLS_BIN
    elif [ "$1" = "--history" ] || [ "$1" = "-h" ]; then
        cp $2 $NLS_HISTORY
    fi
}

function nls_ls () {
    if [ "$1" = "--data" ] || [ "$1" = "-d" ]; then
        ls $NLS_DATA
    elif [ "$1" = "--cache" ] || [ "$1" = "-c" ]; then
        ls $NLS_CACHE
    elif [ "$1" = "--bin" ] || [ "$1" = "-b" ]; then
        ls $NLS_BIN
    elif [ "$1" = "--history" ] || [ "$1" = "-h" ]; then
        ls $NLS_HISTORY
    fi
}

function nls_clear () {
    if [ "$1" = "--data" ] || [ "$1" = "-d" ]; then
        rm -rf $NLS_DATA/*
    elif [ "$1" = "--cache" ] || [ "$1" = "-c" ]; then
        rm -rf $NLS_CACHE/*
    elif [ "$1" = "--bin" ] || [ "$1" = "-b" ]; then
        rm -rf $NLS_BIN/*
    elif [ "$1" = "--history" ] || [ "$1" = "-h" ]; then
        rm -rf $NLS_HISTORY/*
    fi
}

function nls_copy () {
    if [ "$1" = "--data" ] || [ "$1" = "-d" ]; then
        cp $NLS_DATA/* $2
    elif [ "$1" = "--cache" ] || [ "$1" = "-c" ]; then
        cp $NLS_CACHE/* $2
    elif [ "$1" = "--bin" ] || [ "$1" = "-b" ]; then
        cp $NLS_BIN/* $2
    elif [ "$1" = "--history" ] || [ "$1" = "-h" ]; then
        cp $NLS_HISTORY/* $2
    fi
}

function nenv () {
    source $NLS_VENV/bin/activate
}

function snenv () {
    deactivate
}
