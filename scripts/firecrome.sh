#!/bin/bash

rm -f /etc/yum.repos.d/centos-7.repo
wget http://172.16.8.62/scripts/Centos-7.repo -P /etc/yum.repos.d/
yum clean all
yum repolist
yum -y install wget http://172.16.8.62/google-chrome-stable_current_x86_64.rpm
yum -y update firefox
