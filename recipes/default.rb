#
# Cookbook:: zabbix-agent
# Recipe:: default
#
# Copyright:: 2018, Mark Liu, All Rights Reserved.

include_recipe 'zabbix1::release'
include_recipe 'zabbix1::firewall'

package 'zabbix-agent'do

template '/etc/zabbix/zabbix_agentd.conf' do
  source 'agent.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

service 'zabbix-agent' do
  action [:enable, :start]
end
