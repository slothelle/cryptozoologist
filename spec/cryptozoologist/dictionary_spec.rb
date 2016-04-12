require './spec_helper'

describe Cryptozoologist::Dictionary do
  it 'is shiny' do
    expect(Cryptozoologist::Dictionary.new).not_to be nil
  end
end
