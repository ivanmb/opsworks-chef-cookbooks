script "node_setup" do
  interpreter "bash"
  user "root"
  cwd "/"
  code <<-EOH
	cd ~/local
    git clone git://github.com/isaacs/npm.git
    cd npm
    sudo make install
  EOH
end
