#
# Cookbook:: build_cookbook
# Recipe:: publish
#
# Copyright:: 2017, The Authors, All Rights Reserved.
include_recipe 'delivery-truck::publish'

directory '/home/azure/cookbooks' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

execute "download_cookbook_#{cookbook.name}" do
  command "knife cookbook download #{cookbook.name} #{cookbook.version}"
  cwd '/home/azure/cookbooks'
  action :run
end
