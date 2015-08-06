#
# Cookbook Name:: windows_server
# Recipe:: service_chefclient
#
# Copyright (C) 2014-2015 Todd Pigram
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

# configure Chef Client Service recovery options
batch "recovery" do
  code <<-EOH
  sc config "chef-client" start= delayed-auto
  sc failure "chef-client"  actions= restart/60000/restart/60000/restart/60000 reset= 60
  EOH
  not_if {reboot_pending?}
end

service "chef-client" do
  provider Chef::Provider::Service::Windows
  action :start 
  not_if {reboot_pending?}
end