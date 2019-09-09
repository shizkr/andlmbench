#!/bin/bash

MAX_SIZE=512 # It means KB and MB size will be up to 1024
NUMJOBS=4
RUNTIME=240
DIRECT=1

# Output: array of Input, divide by 2 until it gets 512
split_mem_test_size() {
	size=(`echo "$1" | sed 's/M//g'`)
	size=`expr $size`
	index=0
	while (( $size >= $2 ))
	do
		sizearray[$index]=$size
		size=`expr $size \/ 2`
		index=`expr $index + 1`
	done
	count=0
	while (( $index > 0 ))
	do
		index=`expr $index - 1`
		alignedarray[$count]=${sizearray[$index]}
		count=`expr $count + 1`
	done
	echo ${alignedarray[@]}
}

convert_M2K() {
	if [[ $1 =~ "KiB/s" ]];then
		echo $1 | sed 's/KiB/\tKiB/g'
	fi
	if [[ $1 =~ "MiB/s" ]];then
		size=$(echo $1 | sed 's/MiB\/s//g')
		size=$(echo "$size*1024" | bc -l)
		echo $size"	KiB/s"
	fi
}

# Test function
funcs=("read" "write" "randread" "randwrite")
# Units
units=("K" "M")

table=$(split_mem_test_size $MAX_SIZE 4)
for func in ${funcs[@]}
do
echo $func
for unit in ${units[@]}
do
for size in ${table[@]}
do
	CUT=5
	func_parse="  READ:"
	if [[ "$func" =~ "write" ]]; then
		CUT=4
		func_parse="  WRITE:"
	fi
	SIZE=$size$unit
	CMD="fio --name=$func --ioengine=libaio --iodepth=1 --rw=$func --bs=4k --direct=$DIRECT --size=$SIZE --numjobs=$NUMJOBS --runtime=$RUNTIME --group_reporting" 
	if [[ $unit =~ "K" && $size == 4 ]]; then
		echo $CMD
	fi
	out=`$CMD | grep $func_parse | cut -d' ' -f $CUT | cut -d '=' -f 2`
	out=$(convert_M2K $out)
	echo "$SIZE	$out"
done
done
echo "==========="
done
