require 'chefspec'
require 'chefspec/berkshelf'

module SpecHelper
  @@runner = {} # rubocop:disable Style/ClassVars

  def stub_enc_data_bag(bag, item, contents = {})
    allow(Chef::EncryptedDataBagItem).to receive(:load).with(bag, item).and_return(contents)
  end

  def common_stubs
  end

  def memoized_runner(recipe)
    @@runner[recipe] ||= begin
      runner = ChefSpec::SoloRunner.new
      runner.converge recipe
    end
  end
end

RSpec.configure do |config|
  config.include SpecHelper
end
