#!/bin/bash -xe

readonly HOST=$1

vagrant up $HOST --provider=digital_ocean

bundle exec rake itamae:$HOST -l debug
bundle exec rake spec:$HOST
