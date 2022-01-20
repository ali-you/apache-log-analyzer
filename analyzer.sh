#!/bin/bash

case $1 in
	# switch -u shows count of specific url
	# usage: ./analyzer.sh -u [log file] [url]
	# example: ./analyzer.sh -u apache_logs http://semicomplete.com/presentations/logstash-monitorama-2013/
	-u )
		count=0
		for i in `awk -F\" '{print $4}' $2`; do
			if [ $i = $3 ]
				then
					count=`expr $count + 1`
			fi
		done
		echo count of $3: $count
		;;
		
esac