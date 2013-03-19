#!/bin/sh
echo "foo foo quux labs foo bar quux" | ./mapper.py | sort -k1,1 | ./reducer.py

hadoop dfs -copyFromLocal test.txt test.txt
hadoop jar /usr/local/hadoop-1.1.2/contrib/streaming/hadoop-*streaming*.jar \
    -file $(pwd)/mapper.py -mapper $(pwd)/mapper.py \
    -file $(pwd)/reducer.py -reducer $(pwd)/reducer.py \
    -input test.txt -output output
