require_relative '../spec_helper'

describe Cryptozoologist::Dictionary do
  before do
    @dictionary = Cryptozoologist::Dictionary
  end

  lists = [:animals, :colors, :clothing, :quantity, :first_name, :last_name]

  context 'word lists' do
    lists.each do |list|
      it "has #{list}" do
        expect(@dictionary.send(list).length).to be > 1
      end
    end
  end
end
