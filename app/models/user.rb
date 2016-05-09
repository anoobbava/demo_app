# user module
class User < ActiveRecord::Base
  #attr_accessble :email, :name
  has_many :microposts
end
