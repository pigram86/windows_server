#
# Cookbook Name:: windows_server
# Recipe:: rdsh_w2012
#
# Copyright (C) 2013-2015 Todd Pigram
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
%w{ Xps-Foundation-Xps-Viewer Remote-Desktop-Services ServerMediaFoundation AppServer InkAndHandwritingServices DesktopExperience }.each do |feature|
  windows_feature feature do
    action :install
    not_if {reboot_pending?}
  end
end

windows_reboot 30 do
  reason 'A System Restart has been requested. Rebooting now..'
  only_if {reboot_pending?}
end