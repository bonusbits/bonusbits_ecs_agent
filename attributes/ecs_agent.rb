if node['bonusbits_ecs_cluster']['role'] == 'ecs_agent'
  default['bonusbits_ecs_cluster']['aws']['ecs_cluster_name'] = 'kitchen-bonusbits-ecs-cluster'

  # Debug
  message_list = [
    '',
    '** ECS Agent **',
    "INFO: ECS Cluster Name        (#{node['bonusbits_ecs_cluster']['aws']['ecs_cluster_name']})"
  ]
  message_list.each do |message|
    Chef::Log.warn(message)
  end
end
