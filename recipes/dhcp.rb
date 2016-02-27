#
# Cookbook Name:: windows_server
# Recipe:: dhcp
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
  %w{ DHCPServer DHCPServer-Tools }.each do |feature|
    windows_feature feature do
      action :install
      all true
      source "c:\\windows\\winsxs"
      not_if {reboot_pending?}
    end
  end  
else
  powershell_script "default" do
    code <<-EOH
    Import-Module ServerManager
    Add-WindowsFeature DHCPServer
    Add-WindowsFeature DHCPServer-Tools                                            
    Add-WindowsFeature DHCPServer-RSATClient-Tools
    EOH
    not_if {reboot_pending?}
  end
end

windows_reboot 30 do
  reason 'A System Restart has been requested. Rebooting now..'
  only_if {reboot_pending?}
end