# CHANGE LOG

## 1.0.3 - 04/15/2017 - Levon Becker
* Added CloudWatch Logs /var/log/chef-client.log stream
* CFN: Added Client.rb chef client logging to client.rb **/var/log/chef-client.log**
* CFN: Removed role since just calling the recipe for run list and change chef run to call the recipe instead.

## 1.0.2 - 04/13/2017 - Levon Becker
* Upgraded and test with chefdk 1.3.40 / chef-client 12.19.36

## 1.0.1 - 04/10/2017 - Levon Becker
* Fixed CloudFormation Chef Environment Cluster Attribute name.

## 1.0.0 - 04/09/2017 - Levon Becker
* Initial Release