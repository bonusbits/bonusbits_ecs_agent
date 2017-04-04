# Base Setup
include_recipe 'bonusbits_base'

# CloudWatch Logs Config
include_recipe 'bonusbits_ecs_cluster::cloudwatch_logs' if node['bonusbits_ecs_cluster']['cloudwatch_logs']['configure']

# Install Base Packages
include_recipe 'bonusbits_ecs_cluster::ecs_agent'
