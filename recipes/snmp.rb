#
# Cookbook Name:: windows_server
# Recipe:: snmp
#
# Copyright (C) 2015 Todd Pigram
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


if node[:os_version] >= '6.2'
  %w{ SNMP WMISnmpProvider Server-RSAT-SNMP }.each do |snmp|
  windows_feature snmp do
    action :install
    not_if {reboot_pending?}
    end
  end
else
  # Install RDSH
  powershell 'SNMP' do
    code <<-EOH
    Import-Module ServerManager
    Add-WindowsFeature SNMP-Service
    EOH
    not_if {reboot_pending?}
  end
  powershell 'SNMP' do
    code <<-EOH
    Import-Module ServerManager
    Add-WindowsFeature SNMP-Services
    EOH
    not_if {reboot_pending?}
  end
  powershell 'SNMP' do
    code <<-EOH
    Import-Module ServerManager
    Add-WindowsFeature SNMP-WMI-Provider
    EOH
    not_if {reboot_pending?}
  end
end

registry_key node['snmp']['community'] do
   values [{
    :name => "mcpcro",
    :type => :dword,
    :data => 00000004
    }]
  recursive true
  action :create
  not_if {reboot_pending?}
end

service 'SNMP' do
  supports :status => true, :restart => true, :reload => true
  action [:restart, :enable]
  not_if {reboot_pending?}
end

