# run a test task
require 'spec_helper_acceptance'

describe 'facter_task task' do
  describe 'puppet facts' do
    it 'get a puppet fact' do
      result = run_puppet_task(task_name: 'facter_task', params: { 'fact' => 'osfamily' })
      expect_multiple_regexes(result: result, regexes: [%r{status : RedHat}, %r{Job completed. 1/1 nodes succeeded}])
      result = run_puppet_task(task_name: 'facter_task', params: { 'fact' => 'operatingsystem' })
      expect_multiple_regexes(result: result, regexes: [%r{status : CentOS}, %r{Job completed. 1/1 nodes succeeded}])
    end
  end
end
