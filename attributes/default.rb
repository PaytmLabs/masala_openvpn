
default['openvpn']['config']['verb']                  = 3
default['openvpn']['config']['mute']                  = 10
default['openvpn']['config']['cipher']                = 'AES-256-CBC'
default['openvpn']['config']['topology']              = 'subnet'
default['openvpn']['config']['max-clients']           = 200
default['openvpn']['config']['ifconfig-pool-persist'] = [node['openvpn']['fs_prefix'], '/etc/openvpn/ipp.txt'].join
default['openvpn']['config']['status']                = '/var/log/openvpn-status.log'
default['openvpn']['configure_default_ca']            = false
default['openvpn']['config']['crl-verify']            = nil

# for 2.3.x and under (blank string is "true")
default['openvpn']['config']['client-cert-not-required']    = ''
# for 2.4+ much better
#default['openvpn']['config']['verify-client-cert']    = 'none'
default['openvpn']['config']['username-as-common-name']     = ''

default['openvpn']['config']['auth-user-pass-verify'] = '/etc/openvpn/auth-ldap.pl via-file'

default['openvpn']['enable_nat']                     = true

default['masala_openvpn']['ldap_uri']                = 'ldap://localhost:389'
default['masala_openvpn']['ldap_require_group']      = true
default['masala_openvpn']['ldap_group_filter']       = '(|(cn=vpnusers)(cn=admin))'

