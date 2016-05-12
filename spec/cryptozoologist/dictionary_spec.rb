require_relative '../spec_helper'

describe Cryptozoologist::Dictionary do
  before do
    @dictionary = Cryptozoologist::Dictionary.new
  end

  lists = [:animals, :colors, :clothing, :quantity]

  context 'word lists' do
    lists.each do |list|
      it "has #{list}" do
        expect(@dictionary.send(list).length).to be > 1
      end
    end
  end
end
