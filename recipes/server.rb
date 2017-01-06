#
# Cookbook Name:: masala_openvpn
# Recipe:: server
#
# Copyright (C) 2017 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# Not tested on non-centos+epel yet

include_recipe 'masala_base::default'

package 'perl-LDAP'
template [node['openvpn']['fs_prefix'], '/etc/openvpn/auth-ldap.pl'].join do
  source 'auth-ldap.pl.erb'
  owner 'root'
  group node['openvpn']['root_group']
  mode  '0755'
  notifies :restart, 'service[openvpn]'
end

# we disable the local self-sign and setup our own keys
key_dir  = node['openvpn']['key_dir']
directory key_dir do
  owner 'root'
  group node['openvpn']['root_group']
  recursive true
  mode  '0700'
end

include_recipe 'openvpn::server'

