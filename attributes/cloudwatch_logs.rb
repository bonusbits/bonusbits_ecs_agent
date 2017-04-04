default['bonusbits_ecs_cluster']['cloudwatch_logs']['configure'] = true
default['bonusbits_ecs_cluster']['cloudwatch_logs']['logs_group_name'] = 'kitchen-bonusbits-ecs-cluster'

# Debug
message_list = [
  '',
  '** CloudWatch Logs **',
  "INFO: Configure             (#{node['bonusbits_ecs_cluster']['cloudwatch_logs']['configure']})",
  "INFO: Logs Group Name       (#{node['bonusbits_ecs_cluster']['cloudwatch_logs']['logs_group_name']})"
]
message_list.each do |message|
  Chef::Log.warn(message)
end
