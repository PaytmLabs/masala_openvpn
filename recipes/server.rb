#
# Cookbook Name:: masala_openvpn
# Recipe:: server
#
# Copyright 2016, Paytm Labs
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Not tested on non-centos+epel yet

include_recipe 'masala_base::default'

primary_if = node['network']['interfaces'][node['system']['primary_interface']]
primary_addrs = primary_if['addresses']
primary_addrs_ipv4 = primary_addrs.select { |_addr, attrs| attrs['family'] == 'inet' }
primary_ip = primary_addrs_ipv4.keys.first

node.default['openvpn']['config']['local'] = primary_ip

# we disable the local self-sign and setup our own keys
key_dir  = node['openvpn']['key_dir']
directory key_dir do
  owner 'root'
  group node['openvpn']['root_group']
  recursive true
  mode  '0700'
end

package 'perl-LDAP'
template [node['openvpn']['fs_prefix'], '/etc/openvpn/auth-ldap.pl'].join do
  source 'auth-ldap.pl.erb'
  owner 'root'
  group node['openvpn']['root_group']
  mode  '0755'
  notifies :restart, 'service[openvpn]'
end

include_recipe 'openvpn::server'

