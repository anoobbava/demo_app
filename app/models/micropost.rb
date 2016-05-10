# micro post class
class Micropost < ActiveRecord::Base
  #attr_accessible :content, :user_id
  validates :content, length: { maximum: 140 }
  validates :user_id, :numericality => {:allow_blank => true}
  belongs_to :user
end
