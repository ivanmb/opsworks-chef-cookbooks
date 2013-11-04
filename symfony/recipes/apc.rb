template 'apc.ini' do
  case node[:platform]
  when 'centos','redhat','fedora','amazon'
    path "/etc/php.d/apc.ini"
  when 'debian','ubuntu'
    path "/etc/php5/conf.d/apc.ini"
  end
  source 'apc.ini.erb'
  owner 'root'
  group 'root'
  mode 0644
  notifies :restart, resources(:service => 'apache2')
end