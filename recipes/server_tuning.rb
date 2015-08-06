#
# Cookbook Name:: windows_server
# Recipe:: server_tuning
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

#Server_Tuning
registry_key node['tuning']['run'] do
  recursive true
  action :create
end

registry_key node['tuning']['runonce'] do
  recursive true
  action :create
end

registry_key node['tuning']['run64'] do
  recursive true
  action :create
end

registry_key node['tuning']['runonce64'] do
  recursive true
  action :create
end

registry_key node['tuning']['errormode'] do
  values [{
    :name => "ErrorMode",
    :type => :dword,
    :data => 00000002
    }]
  recursive true
  action :create
end

registry_key node['tuning']['disable'] do
  values [{
    :name => "DisablePagingExecutive",
    :type => :dword,
    :data => 00000001
    }]
  recursive true
  action :create
end

registry_key node['tuning']['desktop'] do
  values [{
    :name => "ScreenSaveActive",
    :type => :dword,
    :data => "0"
    }]
  recursive true
  action :create
end

# Worker Threads
registry_key node['tuning']['worker'] do
  values [{
    :name => "AdditionalCriticalWorkerThreads",
    :type => :dword,
    :data => 64
    }]
  recursive true
  action :create
end
 
registry_key node['tuning']['filesystem'] do
  values [{
    :name => "NTSFDisable8dot3NameCreation",
    :type => :dword,
    :data => 0000001
    }]
  recursive true
  action :create
end

# SMB 1.0 Clinet Optimization 
registry_key node['tuning']['lanmanwork'] do
  values [{
    :name => "MaxCmds",
    :type => :dword,
    :data => 2048
    }]
  recursive true
  action :create
end  

# SMB 1.0 Clinet Optimization 
registry_key node['tuning']['multi'] do
  values [{
    :name => "MultiUserEnabled",
    :type => :dword,
    :data => 00000001
    }]
  recursive true
  action :create
end

# SMB 1.0 Clinet Optimization 
registry_key node['tuning']['explorer'] do
  values [{
    :name => "NoRemoteRecursiveEvents",
    :type => :dword,
    :data => 00000001
    }]
  recursive true
  action :create
end

# SMB 1.0 Clinet Optimization 
registry_key node['tuning']['lanmanserver'] do
  values [{:name => "MaxWorkItems", :type => :dword, :data => 8192},
          {:name => "MaxMpxCt", :type => :dword, :data => 2048},
          {:name => "MaxRawWorkItems", :type => :dword, :data => 512},
          {:name => "MaxFreeConnections", :type => :dword, :data => 100},
          {:name => "MinFreeConnections", :type => :dword, :data => 32}
         ] 
  recursive true
  action :create
end

# SMB 2.x Client Tuning
registry_key node['tuning']['lanmanwork'] do
  values [{:name => "DisableBandwidthThrottling", :type => :dword, :data => 00000001},
          {:name => "DisableLargeMtu", :type => :dword, :data => 00000000}
         ]
  action :create
end

registry_key node['tuning']['config'] do
  values [{
    :name => "RegistryLazyFlushInterval", 
    :type => :dword, 
    :data => 60
    }]
  recursive true       
  action :create  
end

registry_key node['tuning']['disable'] do
  values [{
    :name => "ClearPageFileAtShutdown",
    :type => :dword,
    :data => 00000000
    }]
  recursive true
  action :create
end

registry_key node['tuning']['netcache'] do
  values [{
    :name => "Enabled",
    :type => :dword,
    :data => 00000000
    }]
  recursive true
  action :create
end

registry_key node['tuning']['opt'] do
  values [{
    :name => "EnableAutoLayout",
    :type => :dword,
    :data => 00000000
    }]
  recursive true
  action :create
end

registry_key node['tuning']['bnns'] do
  values [{
    :name => "EnableOffload",
    :type => :dword,
    :data => 00000000
    }]
  recursive true  
  action :create
end   

registry_key node['tuning']['tcpip'] do
  values [{
    :name => "DisableTaskOffload",
    :type => :dword,
    :data => 00000001
    }]
  recursive true  
  action :create
end

registry_key node['tuning']['ctrl'] do
  values [{
    :name => "ServicesPipeTimeout",
    :type => :dword,
    :data => 00060000
    }]
  recursive true
  action :create
end

registry_key node['tuning']['tcpip6'] do
  values [{
    :name => "DisableComponents",
    :type => :dword,
    :data => 0xffffffff
    }]
  recursive true
  action :create
end

registry_key node['tuning']['dfss'] do
  values [{
    :name => "EnableCpuQuota",
    :type => :dword,
    :data => 00000001
    }]
  recursive true
  action :create
end

registry_key node['tuning']['boot'] do
  values [{
    :name => "Enable",
    :type => :dword,
    :data => "N"
    }]
  recursive true  
  action :create
end

# disable Windows Defender
#registry_key node['tuning']['defender'] do
#  values [{
#    :name => "DisableAntiSpyware",
#    :type => :dword,
#    :data => 00000001
#    }]
#  recursive true
#  action :create
#end

# setting Processor scheudling to programs
registry_key node['tuning']['procsched'] do
  values [{
    :name => "Win32PrioritySeparation",
    :type => :dword,
    :data => 0x00000026
    }]
  recursive true
  action :create
end

# Set Power Option to High Performance
registry_key node['tuning']['power'] do
  values [{
    :name => "PreferredPlan",
    :type => :string,
    :data => "8c5e7fda-e8bf-4a96-9ab5-a6e23a8c635c"
    }]
  recursive true
  action :create
end

# disable hibernation
#registry_key node['tuning']['hibernation'] do
#  values [{
#    :name => "Heuristics",
#    :type => :binary,
#    :data => "05 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 3f 42 0f 00"
#    }]
#    recursive true
#    action :create
#end

# disable machine acct password changes
registry_key node['tuning']['netlogon'] do
  values [{
    :name => "DisablePasswordChange", 
    :type => :dword, 
    :data => 1
    }]
    recursive true
    action :create
end

# increase service startup timeout
registry_key node['tuning']['timeout'] do
  values [{
    :name => "ServicePipeTimeout",
    :type => :dword,
    :data => 600000
    }]
    recursive true
    action :create
end

#set windows update to Check only
registry_key node['config']['autoupdate'] do 
  values [{:name => "AUOptions", :type => :dword, :data => 00000002},
          {:name => "IncludeRecommendedUpdates", :type => :dword, :data => 00000000}
         ]
  action :create
end

#disable UAC
registry_key node['tuning']['uac'] do
   values {[
     :name => "ConsentPromptBehaviorAdmin",
     :type => :dword,
     :data => 00000000
     ]}
     recursive true
     action :create
end

windows_reboot 30 do
  reason 'A System Restart has been requested. Rebooting now..'
  only_if {reboot_pending?}
end 