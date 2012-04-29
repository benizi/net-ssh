require 'common'
require 'net/ssh/known_hosts'

class TestKnownHosts < Test::Unit::TestCase
  def test_known_hosts_should_find_hostname
    known_hosts = Net::SSH::KnownHosts.new(known(:hostname))
    assert_equal known_hosts.keys_for('localhost').size, 1
  end

  def test_known_hosts_should_find_hostname_hashed
    known_hosts = Net::SSH::KnownHosts.new(known(:hostname_hashed))
    assert_equal known_hosts.keys_for('localhost').size, 1
  end

  def test_known_hosts_should_find_ip
    known_hosts = Net::SSH::KnownHosts.new(known(:ip))
    assert_equal known_hosts.keys_for('127.0.0.1').size, 1
  end

  def test_known_hosts_should_find_ip_hashed
    known_hosts = Net::SSH::KnownHosts.new(known(:ip_hashed))
    assert_equal known_hosts.keys_for('127.0.0.1').size, 1
  end

  def test_known_hosts_should_find_hostname_with_port
    known_hosts = Net::SSH::KnownHosts.new(known(:hostname_port))
    assert_equal known_hosts.keys_for('[test.example.com]:1234').size, 1
  end

  def test_known_hosts_should_find_hostname_with_port_hashed
    known_hosts = Net::SSH::KnownHosts.new(known(:hostname_port_hashed))
    assert_equal known_hosts.keys_for('[test.example.com]:1234').size, 1
  end

  def test_known_hosts_should_find_ip_with_port
    known_hosts = Net::SSH::KnownHosts.new(known(:ip_port))
    assert_equal known_hosts.keys_for('[127.0.0.1]:1234').size, 1
  end

  def test_known_hosts_should_find_ip_with_port_hashed
    known_hosts = Net::SSH::KnownHosts.new(known(:ip_port_hashed))
    assert_equal known_hosts.keys_for('[127.0.0.1]:1234').size, 1
  end

  private

    def known(name)
      "test/known_hosts/#{name}"
    end
end
