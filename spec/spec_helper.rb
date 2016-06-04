require 'chefspec'
require 'chefspec/berkshelf'
require 'rspec'

module SpecHelper
  @@runner = {} # rubocop:disable Style/ClassVars

  def stub_enc_data_bag(bag, item, contents = {})
    allow(Chef::EncryptedDataBagItem).to receive(:load).with(bag, item).and_return(contents)
  end

  def common_stubs
  end

  def memoized_runner(recipe, context = '', options = {})

    @@runner["#{recipe} #{context}"] ||= begin
      runner = ChefSpec::SoloRunner.new(options)
      yield runner.node if block_given?
      runner.converge recipe
      runner
    end
  end
end

RSpec.configure do |config|
  config.include SpecHelper
  config.before { common_stubs }
end
