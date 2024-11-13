#!/bin/bash

vagrant destroy -f integration-server
vagrant destroy -f registry-vm

rm -r .vagrant

vagrant global-status --prune
