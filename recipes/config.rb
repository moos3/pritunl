require 'digest/sha2'
require 'json'

salt = "2511cebca93d028393735637bbc8029207731fcf"

conf = {
  "chef_message" => "This file is managed by chef. DO NOT modify directory, modify pritunl cookbook",
  "log_path"  => "/var/log/pritunl.log",
  "ssl" => node['pritunl']['ssl'] ? true : false,
  "log_debug" => true,
  "port" => node['pritunl']['port'],
  "bind_addr" => node['pritunl']['bind'],
  "password" => Digest::SHA512.hexdigest(node['pritunl']['password'] + salt),
  "debug" => true,
  "www_path" => "/usr/share/pritunl/www",
  "local_address_interface" => "auto",
  "mongodb_uri" => nil,
}

template "Pritunl configuration" do
  path "/etc/pritunl.conf"
  source "pritunl.conf.erb"
  variables :conf => conf.to_json
  notifies :restart, "service[pritunl]", :immediately
end
