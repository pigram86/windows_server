#
# Cookbook Name:: windows_server
# Recipe:: timesync
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

service 'w32time' do
  action :stop
  not_if {reboot_pending?}
end

batch "timesync" do
  code <<-EOH
  w32tm /config /syncfromflags:manual /manualpeerlist:"0.pool.ntp.org, 1.pool.ntp.org, 2.pool.ntp.org"
  w32tm /config /reliable:yes
  EOH
  not_if {reboot_pending?}
end

service 'w32time' do
  action [:start, :enable]
  not_if {reboot_pending?}
end

batch "resync" do 
  code <<-EOH
  w32tm /resync
  EOH
  not_if {reboot_pending?}
end
