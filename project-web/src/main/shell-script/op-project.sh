#!/bin/bash

project=$1
operation=$2

if [ "$project" == "" ]; then
    echo "未输入应用名"
    exit 1
fi

if [ "$operation" == "" ]; then
    echo "未输入操作名称, {start|stop|restart|status}"
    exit 1
fi

function start(){
    count=`ps -ef |grep java|grep $project|grep -v grep|wc -l`
    if [ $count != 0 ]; then
        echo "$project is running..."
    else
        nohup java -jar $project > /dev/null 2>&1 &
        echo "Start $project success..."
    fi
}

function stop(){
    echo "Stop $project"
    boot_id=`ps -ef |grep java|grep $project|grep -v grep|awk '{print $2}'`
    count=`ps -ef |grep java|grep $project|grep -v grep|wc -l`

    if [ $count != 0 ]; then
        kill -9 $boot_id
    fi
}

function restart(){
    stop
    sleep 5
    start
}

function status(){
    count=`ps -ef |grep java|grep $project|grep -v grep|wc -l`
    if [ $count != 0 ];then
        echo "$project is running..."
    else
        echo "$project is not running..."
    fi
}

case $2 in
    start)
    start;;
    stop)
    stop;;
    restart)
    restart;;
    status)
    status;;
    *)
esac
