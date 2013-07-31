require 'spec_helper'

describe 'keepalived::vrrp::sync_group', :type => :define do
  let (:facts) { debian_facts }
  let (:pre_condition) { '$concat_basedir = "/tmp"' }

  describe 'without parameters', :type => :define do
    let (:facts) { debian_facts }
    let (:title) { '_TITLE_' }

    it do
      expect { should create_class('keepalived') }.to raise_error(Puppet::Error)
    end
  end

  describe 'with single instance' do
    let (:title) { '_TITLE_' }
    let (:params) {
      {
        :instances => '_VALUE_',
      }
    }

    it { should create_keepalived__vrrp__sync_group('_TITLE_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_sync_group__TITLE_').with(
          'content' => "vrrp_sync_group _TITLE_ \{\n  _VALUE_\n\}\n"
      )
    }
  end

  describe 'with two instances' do
    let (:title) { '_TITLE_' }
    let (:params) {
      {
        :instances => ['_VALUE1_', '_VALUE2_']
      }
    }

    it { should create_keepalived__vrrp__sync_group('_TITLE_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_sync_group__TITLE_').with(
          'content' => "vrrp_sync_group _TITLE_ \{\n  _VALUE1_\n  _VALUE2_\n\}\n"
      )
    }
  end

  describe 'with notify_master' do
    let (:title) { '_TITLE_' }
    let (:params) {
      {
        :instances     => '_VALUE_',
        :notify_master => '_NOTIFY_MASTER_'
      }
    }

    it { should create_keepalived__vrrp__sync_group('_TITLE_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_sync_group__TITLE_').with(
          'content' => /\s+notify_master\s+\"_NOTIFY_MASTER_"/
      )
    }
  end

  describe 'with notify_backup' do
    let (:title) { '_TITLE_' }
    let (:params) {
      {
        :instances     => '_VALUE_',
        :notify_backup => '_NOTIFY_BACKUP_'
      }
    }

    it { should create_keepalived__vrrp__sync_group('_TITLE_') }
    it {
      should \
        contain_concat__fragment('keepalived.conf_vrrp_sync_group__TITLE_').with(
          'content' => /\s+notify_backup\s+\"_NOTIFY_BACKUP_"/
      )
    }
  end

end
