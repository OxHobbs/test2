#
# Cookbook:: build_cookbook
# Recipe:: publish
#
# Copyright:: 2017, The Authors, All Rights Reserved.
include_recipe 'delivery-truck::publish'

changed_cookbooks.each do |cookbook|
  directory '/tmp/cookbooks' do
    owner 'job_runner'
    group 'job_runner'
    mode '0755'
    action :create
  end

  execute "download_cookbook_#{cookbook.name}" do
    command "knife cookbook download #{cookbook.name} #{cookbook.version}"
    cwd '/tmp/cookbooks'
    action :run
  end
end
