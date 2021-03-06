#
# Cookbook Name:: windows_server
# Recipe:: rdsl_default
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
# Set RDSH Liscense Server in registry
registry_key node['rds']['key'] do
  values [{:name => "LicenseServers", :type => :string, :data => "<rdslicensing_server>"},
          {:name => "LicensingMode", :type => :dword, :data => "4"}
         ] 
  recursive true
  action :create
end