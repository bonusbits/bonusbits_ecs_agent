# Base Setup
include_recipe 'bonusbits_base'

# Install Base Packages
case node['os']
when 'linux'
  # Deploy AWS CloudWatch Logs Config
  template '/etc/awslogs/awslogs.conf' do
    source 'awslogs.conf.erb'
    owner 'root'
    group 'root'
    mode '0644'
    notifies :restart, 'service[awslogs]', :delayed
    only_if { node['bonusbits_base']['aws']['inside'] } # Ohai EC2 Plugin Used
  end

  # Define Service for Notifications
  service 'awslogs' do
    service_name 'awslogs'
    action [:enable, :start]
    only_if { node['bonusbits_base']['aws']['inside'] }
  end

  # Create Config ECS Directory if Missing
  directory '/etc/ecs' do
    owner 'root'
    group 'root'
    mode '0755'
  end

  case node['platform']
  when 'amazon'
    # Install ECS Agent
    package 'ecs-init'

    # Deploy ECS Agent Config
    template '/etc/ecs/ecs.config' do
      source 'ecs.config.erb'
      owner 'root'
      group 'root'
      mode '0600'
      notifies :restart, 'service[ecs]', :delayed
    end

    # Start Docker Service
    service 'docker' do
      action :enable
    end

    # Start Docker Service
    service 'docker' do
      action :start
      only_if { node['bonusbits_base']['aws']['inside'] }
    end

    # Start ECS Agent
    service 'ecs' do
      provider Chef::Provider::Service::Upstart
      action :enable
    end

    # Start ECS Agent
    service 'ecs' do
      provider Chef::Provider::Service::Upstart
      action :start
      only_if { node['bonusbits_base']['aws']['inside'] }
    end
  else
    return
  end
when 'windows'
  return
else
  return
end
