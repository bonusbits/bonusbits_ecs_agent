default['bonusbits_ecs_cluster']['aws']['inside'] = true
default['bonusbits_ecs_cluster']['aws']['region'] =
  if node['bonusbits_ecs_cluster']['aws']['inside']
    node['ec2']['placement_availability_zone'].slice(0..-2)
  else
    'us-west-2'
  end

# Debug
message_list = [
  '',
  '** AWS **',
  "INFO: Inside                (#{node['bonusbits_ecs_cluster']['aws']['inside']})",
  "INFO: Region                (#{node['bonusbits_ecs_cluster']['aws']['region']})"
]
message_list.each do |message|
  Chef::Log.warn(message)
end
