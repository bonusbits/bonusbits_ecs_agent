name 'bonusbits_ecs_cluster'
maintainer 'Levon Becker'
maintainer_email 'levon.becker.github@bonusbits.com'
license 'MIT'
description 'Deploy EC2 Autoscaling Instance, Install and Configure ECS Agent'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.0.3'
chef_version '~> 12.5' if respond_to?(:chef_version)
issues_url 'https://github.com/bonusbits/bonusbits_ecs_cluster/issues'
source_url 'https://github.com/bonusbits/bonusbits_ecs_cluster'

depends 'bonusbits_base'

%w(
  amazon
).each do |os|
  supports os
end
