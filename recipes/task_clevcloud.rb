#
# Cookbook Name:: windows_server
# Recipe:: task_clevcloud
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
windows_task 'Chef client' do
  user node['task']['cle']
  password node['cle']['pwd']
  cwd 'C:\chef\bin'
  command 'chef-client -L C:\tmp'
  run_level :highest
  frequency :minute
  frequency_modifier 15
end