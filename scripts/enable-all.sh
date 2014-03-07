#!/usr/bin/env bash

cd $(dirname "$0")
cd ../conf
for FILE in $(ls available/)
do
	[ ! -L enabled/$FILE ] && ln -s ../available/$FILE enabled/$FILE
done


