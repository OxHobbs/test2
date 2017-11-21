#
# Cookbook:: build_cookbook
# Recipe:: smoke
#
# Copyright:: 2017, The Authors, All Rights Reserved.
include_recipe 'delivery-truck::smoke'

search_query = "recipes:#{node['delivery']['change']['project']}* AND " \
"chef_environment:#{delivery_environment}"
nodes = delivery_chef_server_search(:node, search_query.to_s)

nodes.each do |i_node|
  delivery_inspec "inspec_#{node['delivery']['change']['project']}" do
    infra_node i_node['ipaddress']
    os i_node['os']
    inspec_test_path '/test/smoke'
  end
end