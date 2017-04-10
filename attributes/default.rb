# Bonusbits Base
default['bonusbits_base']['cloudwatch_logs']['configure'] = true
default['bonusbits_base']['cloudwatch_logs']['deploy_logs_conf'] = false
default['bonusbits_base']['cloudwatch_logs']['logs_group_name'] = 'kitchen-bonusbits-ecs-cluster'

default['bonusbits_ecs_cluster']['cluster_name'] = 'kitchen-bonusbits-ecs-cluster'

# Debug
message_list = [
  '',
  '** Default **',
  "ECS Cluster Name              (#{node['bonusbits_ecs_cluster']['cluster_name']})"
]
message_list.each do |message|
  Chef::Log.warn(message)
end
