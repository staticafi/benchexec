#!/bin/sh

set -x
set -e

curl -LRO https://raw.githubusercontent.com/sosy-lab/benchexec/f162c2d14ef486c7f68b78302897f15f0d444c1b/debian/additional_files/lib/systemd/system.conf.d/benchexec-cgroup.conf
curl -LRO https://raw.githubusercontent.com/sosy-lab/benchexec/f162c2d14ef486c7f68b78302897f15f0d444c1b/debian/benchexec-cgroup.service

mkdir -p /etc/systemd/system.conf.d
mv benchexec-cgroup.conf /etc/systemd/system.conf.d

mkdir -p /etc/systemd/system/
mv benchexec-cgroup.service /etc/systemd/system/

python3 -m benchexec.check_cgroups
