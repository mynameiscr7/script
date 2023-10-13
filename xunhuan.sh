#!/bin/bash
start=`date +%s`
for ((i=1;i<=100;i++))
do
        {
        sleep 1
        curl http://ip.com > /dev/null 2>&1
        }&
done
wait
end=`date +%s`
echo "TIME: `expr $end - $start`"
