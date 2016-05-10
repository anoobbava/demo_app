require 'shoulda/matchers'
require 'spec_helper'
describe Micropost do
  it { should belong_to(:user) }
end
