inside_aws = attribute('inside_aws', default: false, description: 'Inside AWS')

if os[:family] == 'amazon'
  describe 'ECS Agent' do
    it 'ecs agent installed' do
      expect(package('ecs-init')).to be_installed
    end

    it 'ecs agent service' do
      # expect(upstart_service('ecs')).to be_enabled
      expect(upstart_service('ecs')).to be_running if inside_aws
    end

    it 'has /etc/ecs/ecs.config' do
      expect(file('/etc/ecs/ecs.config')).to exist
      expect(file('/etc/ecs/ecs.config')).to be_owned_by('root')
    end

    it 'docker service' do
      expect(service('docker')).to be_enabled
      expect(service('docker')).to be_running if inside_aws
    end
  end
end
