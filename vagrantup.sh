#!/bin/bash

vagrant up

vagrant provision --provision-with ansible
