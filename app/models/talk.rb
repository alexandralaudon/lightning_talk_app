class Talk < ActiveRecord::Base
  validates :presenter, :topic, presence:true
end
