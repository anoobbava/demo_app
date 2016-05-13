require 'rails_helper'
require 'spec_helper'

describe Micropost do
  before(:all) do
    @post1 = FactoryGirl.build(:micro_length)
    @post2 = FactoryGirl.build(:micro2)
    @error_post = FactoryGirl.build(:micro_error)
  end

  it 'content greater than 140 leads error' do
    expect(@post1).to be_invalid
  end

  it 'content less than 140 leads valid' do
    expect(@post2).to be_valid
  end

  it 'user_id should be numeric' do
    expect(@post2).to be_valid
  end

  it 'user_id is not numeric leads to error' do
    expect(@error_post).to be_invalid
  end

end
