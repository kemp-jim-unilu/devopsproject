#!/usr/bin/env ruby

user = User.where(id: 1).first
user.password = 'r00tr00t'
user.password_confirmation = 'r00tr00t'
user.save!
