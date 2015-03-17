#
# Cookbook Name:: gor
# Attributes:: default
#
# Author:: Wouter de Vos <wouter@springest.com>, Peter de Ruijter <edge@springest.com>
# Modified By:: Matt Williams <matt@williams-tech.net>
#
# Copyright 2012-2013, Wouter de Vos
#

include_recipe "golang::default"

git "/usr/local/src/gor" do
  repository node['gor']['distribution']['repository']
  reference node['gor']['distribution']['revision']
  action :sync
  notifies :run, 'execute[compile-gor-source]', :immediately
  not_if do ::File.exists?("/usr/local/bin/gor") end
end

execute "compile-gor-source" do
  cwd "/usr/local/src/gor"
  command "go build gor.go"
  action :nothing
  notifies :run, 'execute[move-bin-to-folder]', :immediately
end

execute "move-bin-to-folder" do
  cwd "/usr/local/src/gor"
  command "mv ./gor /usr/local/bin/gor"
  action :nothing
end

