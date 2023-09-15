# @summary
#   Creates `apache::vhost` defined types.
#
# @note See the `apache::vhost` defined type's reference for a list of all virtual 
# host parameters or Configuring virtual hosts in the README section.
#
# @example To create a [name-based virtual host](https://httpd.apache.org/docs/current/vhosts/name-based.html) `custom_vhost_1`
#   class { 'apache::vhosts':
#     vhosts => {
#       'custom_vhost_1' => {
#         'docroot' => '/var/www/custom_vhost_1',
#         'port'    => 81,
#       },
#     },
#   }
# @example To create a [name-based virtual host](https://httpd.apache.org/docs/current/vhosts/name-based.html) `custom_vhost_1` using vhosts_defaults
#   class { 'apache::vhosts':
#     vhosts_defaults => {
#       'access_log_format' => 'noip',
#       'priority'          => false,
#     },
#     vhosts => {
#       'custom_vhost_1' => {
#         'docroot' => '/var/www/custom_vhost_1',
#         'port'    => 81,
#       },
#     },
#   }
# @param vhosts
#   A hash, where the key represents the name and the value represents a hash of
#   `apache::vhost` defined type's parameters.
# @param vhosts_defaults
#   A hash of `apache::vhost` defined type's parameters used as defaults for one
#   or more vhosts - use this parameter to set vhosts_defaults on nodes with
#   many vhosts or to ensure site-wide vhosts_defaults in Hiera
#
class apache::vhosts (
  Hash $vhosts          = {},
  Hash $vhosts_defaults = {},
) {
  include apache
  create_resources('apache::vhost', $vhosts, $vhosts_defaults)
}
