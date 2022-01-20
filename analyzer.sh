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

	# switch -i shows count of top 10 ip
	# usage: ./analyzer.sh -i [log file]
	# example: ./analyzer.sh -i apache_logs
	-i )
		awk '{ print $1 }' $2 | sort | uniq -c | sort -nr | head -n 10
		;;

	# switch -ag shows count of top 10 user agent
	# usage: ./analyzer.sh -ag [log file]
	# example: ./analyzer.sh -ag apache_logs
	-ag )
		awk -F\" '{ print $6 }' $2 | sort | uniq -c | sort -nr | head -n 10
		;;

	# switch -os shows count of top 10 os
	# usage: ./analyzer.sh -os [log file]
	# example: ./analyzer.sh -os apache_logs
	-os )
		awk '{print $13}' $2 | sort | uniq -c | sort -nr | head -n 10
		;;

	# switch -ur shows count of top 10 urls
	# usage: ./analyzer.sh -ur [log file]
	# example: ./analyzer.sh -ur apache_logs
	-ur )
		awk -F\" '{print $4}' $2 | sort | uniq -c | sort -nr | head -n 10
		;;

esac