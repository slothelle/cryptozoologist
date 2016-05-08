require_relative '../spec_helper'

describe Cryptozoologist::Configuration do
  context 'without configuration block' do
    it 'returns an empty Configuration' do
      expect(Cryptozoologist.configuration).to be_instance_of(Cryptozoologist::Configuration)
      expect(Cryptozoologist.configuration.exclude).to eq([])
    end
  end

  context 'exclusions' do
    it 'filters out invalid exclusions' do
      Cryptozoologist.configure do |config|
        config.exclude = [:common, :tacos]
      end

      expect(Cryptozoologist.configuration.exclude).to eq([:common])
    end

    it 'requires an array' do
      expect {
        Cryptozoologist.configure do |config|
          config.exclude = 1
        end
      }.to raise_error(Cryptozoologist::Errors::Configuration)
    end
  end
end