#
# Cookbook:: test2
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

file 'c:/test.txt' do
  content 'This is from test2 cookbook'
  action :create
end
