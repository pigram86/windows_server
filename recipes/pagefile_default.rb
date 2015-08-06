#
# Cookbook Name:: windows_server
# Recipe:: pagefile_default
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
def memory
  "#{node['kernel']['cs_info']['total_physical_memory']}"
end

# splitting out based on OS vsersion and then the case statement is XenServer(4,6,8,16) then vSphere/vCloud(4,6,8,16)
if node['platform_version'] >= "6.2.9200"
  case memory
  when "4286169088" 
    include_recipe "windows_server::pagefile_4gb"
  when "6433652736" 
    include_recipe "windows_server::pagefile_6gb"
  when "8581136384" 
    include_recipe "windows_server::pagefile_8gb"
  when "8581140480"
    include_recipe "windows_server::pagefile_8gb"
  when "17171070976" 
    include_recipe "windows_server::pagefile_16gb"
  when "4294496256"
    include_recipe "windows_server::pagefile_4gb"
  when "6441979904" 
    include_recipe "windows_server::pagefile_6gb"
  when "8589463552" 
    include_recipe "windows_server::pagefile_8gb"
  when "17179398144" 
    include_recipe "windows_server::pagefile_16gb"
  end
else
  case memory
  when "4290367488"
    include_recipe "windows_server::pagefile_4gb"
  when "6437851136"
    include_recipe "windows_server::pagefile_6gb"
  when "8585334784"
    include_recipe "windows_server::pagefile_8gb"
  when "17175269376"
    include_recipe "windows_server::pagefile_16gb"
  when "4294500352" 
    include_recipe "windows_server::pagefile_4gb"
  when "6441984000"
    include_recipe "windows_server::pagefile_6gb"
  when "8589467648"
    include_recipe "windows_server::pagefile_8gb"
  when "17179402240"
    include_recipe "windows_server::pagefile_16gb"
  end
end