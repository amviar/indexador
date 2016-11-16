# Update the keyring
execute 'sudo apt-key update' do
  ignore_failure true
  timeout 60
end

# Update info on packages
execute 'sudo apt-get update' do
  ignore_failure true
  timeout 60
end

# Install updated versions of packages
execute 'sudo apt-get -y dist-upgrade' do
  ignore_failure true
end

package 'libxslt-dev'
package 'libxml2-dev'
package 'build-essential'
package 'libpq-dev'
package 'libsqlite3-dev'

# required for asset pipeline
package 'nodejs'

package 'git'
ssh_known_hosts_entry 'github.com'

package 'screen'