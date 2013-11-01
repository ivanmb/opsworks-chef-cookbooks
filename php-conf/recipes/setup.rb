node[:deploy].each do |application, deploy|
  script "config_apc" do
    interpreter "bash"
    user "root"
    code <<-EOH
      echo "extension=apc.so" > /etc/php5/cli/conf.d/apc.ini
      echo "apc.apc.stat = 0" >> /etc/php5/cli/conf.d/apc.ini
      echo "apc.include_once_override = 1" >> /etc/php5/cli/conf.d/apc.ini
      echo "apc.shm_size = 128M" >> /etc/php5/cli/conf.d/apc.ini
      echo "apc.mmap_file_mask=/apc.shm.XXXXXX" >> /etc/php5/cli/conf.d/apc.ini
      echo "apc.write_lock = 1" >> /etc/php5/cli/conf.d/apc.ini
      echo "apc.slam_defense = 0" >> /etc/php5/cli/conf.d/apc.ini
    EOH
  end
end 
