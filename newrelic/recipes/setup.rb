script "node_setup" do
  interpreter "bash"
  user "root"
  cwd "/"
  code <<-EOH
  	wget -O - https://download.newrelic.com/548C16BF.gpg | sudo apt-key add -
  	echo "deb http://apt.newrelic.com/debian/ newrelic non-free" > /etc/apt/sources.list.d/newrelic.list
	apt-get update
	apt-get install newrelic-php5
  EOH
end