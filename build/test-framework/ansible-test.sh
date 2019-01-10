#!/bin/sh
export WATCH_NAMESPACE=${TEST_NAMESPACE}
(/usr/local/bin/entrypoint > /tmp/operator.log 2>&1)&
trap "kill $!" SIGINT SIGTERM EXIT

cd ${HOME}/project
exec molecule test -s test-cluster
