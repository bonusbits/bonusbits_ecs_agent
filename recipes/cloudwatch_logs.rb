case node['os']
when 'linux'
  # Deploy AWS CloudWatch Logs Config
  template '/etc/awslogs/awslogs.conf' do
    source 'awslogs.conf.erb'
    owner 'root'
    group 'root'
    mode '0644'
    notifies :restart, 'service[awslogs]', :delayed
    only_if { node['bonusbits_ecs_cluster']['aws']['inside'] } # Ohai EC2 Plugin Used
  end

  # Define Service for Notifications
  service 'awslogs' do
    service_name 'awslogs'
    action [:enable, :start]
    # only_if { node['bonusbits_ecs_cluster']['aws']['inside'] }
  end
else
  return
end
