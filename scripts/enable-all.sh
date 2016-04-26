#!/usr/bin/env bash

cd "$(dirname "$0")"
echo "Directory changed $(pwd)"
for FILE in $(ls available/)
do
	[ ! -L enabled/$FILE ] && ln -s ../available/$FILE enabled/$FILE
done


