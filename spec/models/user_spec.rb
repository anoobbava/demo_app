require 'spec_helper'
require 'rails_helper'

describe User do

  before(:all) do
    @user1 = FactoryGirl.build(:user1)
    @user2 = FactoryGirl.build(:user_error)
  end

  it 'no mail id not valid' do
    expect(@user2).to be_invalid
  end

end