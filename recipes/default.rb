#
# Cookbook:: zabbix-agent
# Recipe:: default
#
# Copyright:: 2018, Mark Liu, All Rights Reserved.

include_recipe 'zabbix1::release'
include_recipe 'zabbix1::firewall'

package 'zabbix-agent'

template '/etc/zabbix/zabbix_agentd.conf' do
  source 'agent.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service:[zabbix-agent]'
end

service 'zabbix-agent' do
  supports restart: true, status: true, reload: true
  action [:enable, :start]
end
