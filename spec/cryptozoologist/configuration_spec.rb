require_relative '../spec_helper'

describe Cryptozoologist::Configuration do
  before do
    Cryptozoologist.reset
  end

  context 'without configuration block' do
    it 'returns an empty Configuration' do
      expect(Cryptozoologist.configuration).to be_instance_of(Cryptozoologist::Configuration)
      expect(Cryptozoologist.configuration.exclude).to eq([])
    end
  end

  context 'configuration collision' do
    it 'does not happen' do
      Cryptozoologist.configure do |config|
        config.delimiter = "_"
      end

      expect(Cryptozoologist.configuration.delimiter).to eq("_")
      expect(Cryptozoologist.configuration.include_quantity?).to be false

      Cryptozoologist.configure do |config|
        config.include = [:quantity]
      end      

      expect(Cryptozoologist.configuration.delimiter).to_not eq("_")
      expect(Cryptozoologist.configuration.include_quantity?).to be true
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

  context 'inclusions' do
    it 'filters out invalid inclusions' do
      Cryptozoologist.configure do |config|
        config.include = [:tacos]
      end

      expect(Cryptozoologist.configuration.include).to eq([])
    end

    it 'requires an array' do
      expect {
        Cryptozoologist.configure do |config|
          config.include = 1
        end
      }.to raise_error(Cryptozoologist::Errors::Configuration)
    end

    it 'sets valid inclusions' do
      Cryptozoologist.configure do |config|
        config.include = [:quantity]
      end

      expect(Cryptozoologist.configuration.include).to eq([:quantity])
    end

    it 'sets valid inclusions' do
      Cryptozoologist.configure do |config|
        config.include = [:quantity]
      end

      expect(Cryptozoologist.configuration.include_quantity?).to be true
    end
  end

  context '#delimiter' do
    it 'defaults to "-"' do
      expect(Cryptozoologist.random.match('-')).to be_instance_of(MatchData)
    end

    it 'requires a string' do
      expect {
        Cryptozoologist.configure do |config|
          config.delimiter = 1
        end
      }.to raise_error(Cryptozoologist::Errors::Configuration)
    end

    it 'changes the delimiter when provided' do
      Cryptozoologist.configure do |config|
        config.delimiter ='$'
      end

      expect(Cryptozoologist.random.match('$')).to be_instance_of(MatchData)
    end
  end

  context '#order' do
    it 'defaults to colors, animals, clothing' do
      expect(Cryptozoologist.configuration.order).to eq([:colors, :animals, :clothing])
    end

    it 'rejects everything if anything invalid is passed' do
      expect {
        Cryptozoologist.configure do |config|
          config.order = [:colors, :animals, :tacos]
        end
      }.to raise_error(Cryptozoologist::Errors::Configuration)
    end

    it 'rejects everything if fewer than 3 keys are passed' do
      expect {
        Cryptozoologist.configure do |config|
          config.order = [:colors, :animals]
        end
      }.to raise_error(Cryptozoologist::Errors::Configuration)
    end

    it 'rejects everything if more than 3 keys are passed' do
      expect {
        Cryptozoologist.configure do |config|
          config.order = [:colors, :animals, :clothing, :tacos]
        end
      }.to raise_error(Cryptozoologist::Errors::Configuration)
    end

    it 'requires an array' do
      expect {
        Cryptozoologist.configure do |config|
          config.order = 1
        end
      }.to raise_error(Cryptozoologist::Errors::Configuration)
    end

    it 'changes the order of keys' do
      Cryptozoologist.configure do |config|
        config.order = [:clothing, :colors, :animals]
      end
      expect(Cryptozoologist.configuration.order).to eq([:clothing, :colors, :animals])
    end
  end
end