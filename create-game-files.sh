#!/usr/bin/env bash

# convert utf-16 endianness to create game friendly localization files
# outputs to ./converted for each directory
outdir="./converted"
declare -a dirs=("./nmrih/maps" "./nmrih/resource" "./hl2-base/resource" "./platform/admin" "./platform/resource" "./platform/servers")
for i in "${dirs[@]}"
do
	pushd "$i"
	if [ ! -d "$outdir" ]; then
		mkdir "$outdir"
	fi
	find *.txt -type f -exec bash -c "iconv -f UTF-16BE -t UTF-16LE \"{}\" > ${outdir}/\"{}\"" \;
	popd
done
