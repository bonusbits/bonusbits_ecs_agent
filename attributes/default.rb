# Deployment Type
default['bonusbits_ecs_cluster']['deployment_type'] = 'ec2'

# Bonusbits Base
default['bonusbits_base']['aws']['inside'] = true
default['bonusbits_base']['cloudwatch_logs']['deploy_logs_conf'] = false

# Debug
message_list = [
  '',
  '** Default **',
  "INFO: Deployment Type       (#{node['bonusbits_ecs_cluster']['deployment_type']})"
]
message_list.each do |message|
  Chef::Log.warn(message)
end
