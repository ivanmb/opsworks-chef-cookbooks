node[:deploy].each do |application, deploy|

  script "oauth_setup" do
    interpreter "bash"
    user "root"
    cwd "/"
    code <<-EOH
    pecl install oauth 
    EOH
  end

  template 'oauth.ini' do
    case node[:platform]
    when 'centos','redhat','fedora','amazon'
      path "/etc/php.d/oauth.ini"
    when 'debian','ubuntu'
      path "/etc/php5/conf.d/oauth.ini"
    end
    source 'oauth.ini.erb'
    owner 'root'
    group 'root'
    mode 0644
    notifies :restart, resources(:service => 'apache2')
  end

end