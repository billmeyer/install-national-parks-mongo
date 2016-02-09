#
# Cookbook Name:: mongodb
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

baseurl = "https://repo.mongodb.org/yum/redhat/7Server/mongodb-org/3.2/x86_64/"

log "Welcome to Chef, #{node['platform']} #{node['platform_version']}!" do
  level :info
end

# Check to make sure we are running on RHEL 7 at a minimum
return if platform_family?('rhel') && node['platform_version'].to_i < 7

# Add the MongoDB community repo to the list of available repos to install from
template "/etc/yum.repos.d/mongodb.repo" do
	variables(
		:baseurl => baseurl
	)
end

# Install the mongodb-org package
package 'mongodb-org' do
	action :install
end

# Create a directory to hold the mongod pid file at runtime
directory '/var/run/mongodb' do
	owner 'root'
	group 'root'
	mode '0755'
	action :create
end

# Add our mongod config file to the /etc/sysconfig collection
template "/etc/sysconfig/mongod" do
	action :create
end

# Add our custom mongod.service file to the available systemctl services
template "/lib/systemd/system/mongod.service" do
	action :create
end

# Enable mongod to start at boot up
service 'mongod' do
	action [ :enable ]
end

# Start it up as part of this recipe
service 'mongod' do
	action [ :start ]
end

# Copy our seed data to the node for installation into mongo
cookbook_file '/tmp/national_park_service.json' do
	source 'national_park_service.json'
	owner 'root'
	group 'root'
	mode '0600'
end

cookbook_file '/tmp/check-nationalparks-data.sh' do
        source 'check-nationalparks-data.sh'
        owner 'root'
        group 'root'
        mode '0700'
end

# Load the seed data into mongo
execute 'seed-nationalpark-data' do
	command "mongoimport --drop -d demo -c nationalparks --type json --jsonArray --file /tmp/national_park_service.json"
	not_if '/tmp/check-nationalparks-data.sh'
	action :run
end

