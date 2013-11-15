script "setup_php_filesize" do
  interpreter "bash"
  case node[:platform]
  when 'centos','redhat','fedora','amazon'
    cwd "/etc/php.d/apache2"
  when 'debian','ubuntu'
    cwd "/etc/php5/apache2"
  end
  user "root"
  code <<-EOH
    cat php.ini | sed 's/upload\_max\_filesize .*/upload\_max\_filesize = 15M/' > php.ini
  EOH
  notifies :restart, resources(:service => 'apache2')
end
