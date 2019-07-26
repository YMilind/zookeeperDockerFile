#!/bin/bash
echo "Running Clean up ...."
/zookeeper-3.4.10/bin/zkCleanup.sh
echo "starting zookeeper..."
/zookeeper-3.4.10/bin/zkServer.sh start

echo "Checking status..."
/zookeeper-3.4.10/bin/zkServer.sh status

 echo "Starting health check ...use <hostIP> to validate it..."
zookeeper-healthcheck --healthy-modes standalone --port 80
