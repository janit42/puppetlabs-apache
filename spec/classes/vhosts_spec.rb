# frozen_string_literal: true

require 'spec_helper'

describe 'apache::vhosts', type: :class do
  context 'on all OSes' do
    include_examples 'RedHat 8'

    context 'with custom vhosts parameter' do
      let :params do
        {
          vhosts: {
            'custom_vhost_1' => {
              'docroot' => '/var/www/custom_vhost_1',
              'port' => 81
            },
            'custom_vhost_2' => {
              'docroot' => '/var/www/custom_vhost_2',
              'port' => 82
            }
          }
        }
        {
          vhosts_defaults: {
            'access_log_format' => 'noip',
          }
        }
      end

      it { is_expected.to contain_apache__vhost('custom_vhost_1') }
      it { is_expected.to contain_apache__vhost('custom_vhost_2') }
    end
  end
end
