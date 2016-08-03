#
# Cookbook Name:: gor
# Attributes:: default
#
# Author:: Wouter de Vos <wouter@springest.com>, Peter de Ruijter <edge@springest.com>
# Modified By:: Matt Williams <matt@williams-tech.net>
#
# Copyright 2012-2013, Wouter de Vos
#

package "libpcap0.8-dev"

include_recipe "golang::default"

source_go_profile = "source /etc/profile.d/golang.sh"

bash "build-gor" do
  user "root"
  group "root"
  code <<-EOH
  #{source_go_profile}
  go get github.com/buger/gor
  cd $GOPATH/src/github.com/buger/gor
  go build
  EOH
  notifies :run, 'bash[move-bin-to-folder]', :immediately
  not_if { ::File.exists?("/usr/local/bin/gor") }
end

bash "move-bin-to-folder" do
  code "#{source_go_profile}; mv $GOPATH/src/github.com/buger/gor/gor /usr/local/bin/gor"
  action :nothing
end

