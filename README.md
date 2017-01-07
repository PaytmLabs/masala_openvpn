# masala_openvpn

This is a component of the [masala toolkit](https://github.com/PaytmLabs/masala).

This is a [wrapper cookbook](http://blog.vialstudios.com/the-environment-cookbook-pattern/#thewrappercookbook) for providing recipes for openvpn server deployment. 

It deploys an LDAP-authenticated OpenVPN server, without client SSL-verfication by default. It also uses fork of the openvpn cookbook that allows disabling the CA init.

The cookbook does NOT perform management of SSL certs, and as such this cookbook requires that prior to deployment, the following files be provisioned to the sytsem already:

- /etc/openvpn/keys/ca.crt
- /etc/openvpn/keys/server.crt
- /etc/openvpn/keys/server.key

## Supported Platforms

The platforms supported are:
- Centos 7.1+

Untested but will take bugs on:
- Centos 6.7+
- Ubuntu 14.04 LTS (And future LTS releases)
- Debioan 8.2+

## Attributes

Please also see the documentation for the cookbooks included by masala_openvpn. (See [metadata.rb](https://github.com/PaytmLabs/masala_openvpn/blob/develop/metadata.rb) file)

This recipe will reference 

default['masala_openvpn']['ldap_uri']                = 'ldap://localhost:389'
default['masala_openvpn']['ldap_require_group']      = true
default['masala_openvpn']['ldap_group_filter']       = '(|(cn=vpnusers)(cn=admin))'

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['masala_openvpn']['ldap_uri']</tt></td>
    <td>String</td>
    <td>A comma seperated list of LDAP servers in the form ldap://hostname:port</td>
    <td><tt>ldap://localhost:389</tt></td>
  </tr>
  <tr>
    <td><tt>['masala_openvpn']['ldap_require_group']</tt></td>
    <td>Boolean</td>
    <td>Boolean indicating if a group test must pass to allow the user.</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['masala_openvpn']['ldap_group_filter']</tt></td>
    <td>String</td>
    <td>A valid ldap search filter fragment. Will be combined with and on memberUid=username to test groups for the user.</td>
    <td><tt>(|(cn=vpnusers)(cn=admin))</tt></td>
  </tr>
</table>

## Usage

### masala_kafka::default

Include `masala_kafka` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[masala_kafka::default]"
  ]
}
```

## License, authors, and how to contribute

See:
- [LICENSE](https://github.com/PaytmLabs/masala_kafka/blob/develop/LICENSE)
- [MAINTAINERS.md](https://github.com/PaytmLabs/masala_kafka/blob/develop/MAINTAINERS.md)
- [CONTRIBUTING.md](https://github.com/PaytmLabs/masala_kafka/blob/develop/CONTRIBUTING.md)

