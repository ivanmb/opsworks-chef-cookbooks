#
# Cookbook Name:: newrelic
# Attributes:: php-agent
#
# Copyright 2012-2013, Escape Studios
#

default['newrelic']['startup_mode'] = "agent"
default['newrelic']['web_server']['service_name'] = "apache2"
default['php']['ext_conf_dir'] = "/etc/php5/cli/conf.d"
