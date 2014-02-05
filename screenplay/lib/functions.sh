#!/usr/bin/env bash

# GENERAL ENVIROMENT FUNCTIONS
# AUTHOR: DAVI CRYSTAL / davicrystal@gmail.com / twitter.com/davicrystal

# FUNCTION getFile()
# GET THE FILE NAME FROM THE URL SOURCE

getFile () {

	IFS="/"

		for path in $1; do

		  VAGRANT_TARGZ_FILE="$path"

		done

}

# FUNCTION getPath()
# GET THE PATH AFTER THE DESCOMPRESSION TAR.GZ FILE

getPath () {

	PRE_VAGRANT_TMP_FILE=$1

	VAGRANT_TMP_PATH=${PRE_VAGRANT_TMP_FILE%.tar.gz}
	
} 
