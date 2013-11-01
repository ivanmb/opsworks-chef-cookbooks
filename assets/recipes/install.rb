node[:deploy].each do |application, deploy|
  script "install_assets" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH
    #bash node_installation.sh
    bash assets.sh
    EOH
  end
end 
