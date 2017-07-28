#Install PHP 7.0 

package 'python-software-properties' do
  action :install
end

apt_repository "ondrej-php" do
  uri 'ppa:ondrej/php'
  distribution node['lsb']['codename']
end

package 'php7.0' do
  action :install
end


#Install Composer
bash 'composer install' do
  code <<-EOH
   curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
  EOH
end


#Install MySQL 5.6
package 'mysql-server-5.6'do
  action :install
end

#Install Git
package 'git' do
  action :install
end

#Install Apache 2
package 'apache2'do
  action :install
end

#Configure Apache 2 for PHP
file '/var/www/html/index.html' do
  content '<?php phpinfo(); ?>'
end

#Start Apache Service
service 'apache2' do
  action [ :enable, :start ]
end

#Ubuntu Security Updates

bash 'security updates' do
  code <<-EOH
   sudo apt-get install unattended-upgrades
  EOH
end

#Change mode of /opt directory
directory '/opt/Bash-Snippets' do
  mode 0755
end

#Git Clone
git 'clone a Bash-Snippets repository' do
  user 'root'
  destination '/opt/Bash-Snippets'
  repository "https://github.com/alexanderepstein/Bash-Snippets"
  reference "master"
  action :checkout
end


