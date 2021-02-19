#!/bin/bash


yum -y install epel-release
yum -y update
yum -y install socat

wget https://github.com/rabbitmq/erlang-rpm/releases/download/v23.2.4/erlang-23.2.4-1.el7.x86_64.rpm

rpm -Uvh erlang-23.2.4-1.el7.x86_64.rpm

wget https://github.com/rabbitmq/rabbitmq-server/releases/download/v3.8.12/rabbitmq-server-3.8.12-1.el7.noarch.rpm

rpm -Uvh rabbitmq-server-3.8.12-1.el7.noarch.rpm

