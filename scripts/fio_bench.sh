#!/bin/bash

MAX_SIZE=1024 # It means KB and MB size will be up to 1024

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

echo "Sequential Read"
table=$(split_mem_test_size $MAX_SIZE 4)
for size in ${table[@]}
do
	SIZE=$size"K"
	out=`fio --name=sequentialread --ioengine=libaio --iodepth=1 --rw=read --bs=4k --direct=0 --size=$SIZE --numjobs=1 --runtime=240 --group_reporting | grep "  READ:" | cut -d' ' -f 5 | cut -d '=' -f 2`
	out=$(convert_M2K $out)
	echo "$SIZE:	$out"
done
table=$(split_mem_test_size $MAX_SIZE 4)
for size in ${table[@]}
do
	SIZE=$size"M"
	out=`fio --name=sequentialread --ioengine=libaio --iodepth=1 --rw=read --bs=4k --direct=0 --size=$SIZE --numjobs=1 --runtime=240 --group_reporting | grep "  READ:" | cut -d' ' -f 5 | cut -d '=' -f 2`
	out=$(convert_M2K $out)
	echo "$SIZE:	$out"
done

echo "Sequential Write"
table=$(split_mem_test_size $MAX_SIZE 4)
for size in ${table[@]}
do
	SIZE=$size"K"
	out=`fio --name=sequentialwrite --ioengine=libaio --iodepth=1 --rw=write --bs=4k --direct=0 --size=$SIZE --numjobs=1 --runtime=240 --group_reporting | grep "  WRITE:" | cut -d' ' -f 4 | cut -d '=' -f 2`
	out=$(convert_M2K $out)
	echo "$SIZE:	$out"
done
table=$(split_mem_test_size $MAX_SIZE 4)
for size in ${table[@]}
do
	SIZE=$size"M"
	out=`fio --name=sequentialwrite --ioengine=libaio --iodepth=1 --rw=write --bs=4k --direct=0 --size=$SIZE --numjobs=1 --runtime=240 --group_reporting | grep "  WRITE:" | cut -d' ' -f 4 | cut -d '=' -f 2`
	out=$(convert_M2K $out)
	echo "$SIZE:	$out"
done

echo "Random Read"
table=$(split_mem_test_size $MAX_SIZE 4)
for size in ${table[@]}
do
	SIZE=$size"K"
	out=`fio --name=randomread --ioengine=libaio --iodepth=1 --rw=randread --bs=4k --direct=0 --size=$SIZE --numjobs=1 --runtime=240 --group_reporting | grep "  READ:" | cut -d' ' -f 5 | cut -d '=' -f 2`
	out=$(convert_M2K $out)
	echo "$SIZE:	$out"
done
table=$(split_mem_test_size $MAX_SIZE 4)
for size in ${table[@]}
do
	SIZE=$size"M"
	out=`fio --name=randomread --ioengine=libaio --iodepth=1 --rw=randread --bs=4k --direct=0 --size=$SIZE --numjobs=1 --runtime=240 --group_reporting | grep "  READ:" | cut -d' ' -f 5 | cut -d '=' -f 2`
	out=$(convert_M2K $out)
	echo "$SIZE:	$out"
done

echo "Random Write"
table=$(split_mem_test_size $MAX_SIZE 4)
for size in ${table[@]}
do
	SIZE=$size"K"
	out=`fio --name=randomwrite --ioengine=libaio --iodepth=1 --rw=randwrite --bs=4k --direct=0 --size=$SIZE --numjobs=1 --runtime=240 --group_reporting | grep "  WRITE:" | cut -d' ' -f 4 | cut -d '=' -f 2`
	out=$(convert_M2K $out)
	echo "$SIZE:	$out"
done
table=$(split_mem_test_size $MAX_SIZE 4)
for size in ${table[@]}
do
	SIZE=$size"M"
	out=`fio --name=randomwrite --ioengine=libaio --iodepth=1 --rw=randwrite --bs=4k --direct=0 --size=$SIZE --numjobs=1 --runtime=240 --group_reporting | grep "  WRITE:" | cut -d' ' -f 4 | cut -d '=' -f 2`
	out=$(convert_M2K $out)
	echo "$SIZE:	$out"
done
