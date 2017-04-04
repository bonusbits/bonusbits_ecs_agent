# Deployment Type
default['bonusbits_ecs_cluster']['deployment_type'] = 'ec2'

# Debug
message_list = [
  '',
  '** Default **',
  "INFO: Deployment Type       (#{node['bonusbits_ecs_cluster']['deployment_type']})"
]
message_list.each do |message|
  Chef::Log.warn(message)
end
