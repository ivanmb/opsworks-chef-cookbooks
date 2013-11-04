node[:deploy].each do |application, deploy|

  template "/etc/logrotate.d/symfony" do
    source "logrotate.erb"
    mode 0644
    group "root"

    if platform?("ubuntu")
      owner "deploy"
   elsif platform?("amazon")
      owner "deploy"
    end

    variables(
      :logfolder => ("#{deploy[:deploy_to]}/current/app/logs" rescue nil)
    )
  end
end