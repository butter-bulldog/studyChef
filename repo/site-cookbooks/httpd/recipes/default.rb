#
# Cookbook Name:: httpd
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
log "httpd!!"

# install httpd
package 'httpd' do
    action :install
end

# service httpd start
# chkconfig httpd on
service "httpd" do
    action [:enable, :start]
 end
  
 # /etc/httpd/conf/httpd.conf
 template "httpd.conf" do
     path "/etc/httpd/conf/httpd.conf"
     source "httpd.conf.erb"
     notifies :restart, "service[httpd]"
     variables({
         :extra_directory_index => 'index.php',
         :options_indexes => '-Indexes'
         
     })
 end