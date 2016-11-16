#
# Cookbook Name:: uday
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# package "httpd" do
#	action :install
#
# service "httpd" do
#	action [:enable, :start]
# 
#
node['uday']['pakage'].each do |sai|
 package sai do
  action :install
 end

end

service "httpd" do 
	action :restart
end

file '/opt/tools/hello.txt' do
  content '<text>This is a sample code.</text>'
  mode '0755'
  owner 'root'
  group 'root'
end


directory '/opt/tools' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

execute 'hello' do
 command 'ls -l /etc >  /tmp/this.txt'
end

git '/var/www/html' do
  repository 'https://github.com/ls457/php_site.git'
  revision 'master'
  action :sync

end
