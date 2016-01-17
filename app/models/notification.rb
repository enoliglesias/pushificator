class Notification < ActiveRecord::Base
  has_many :sendings
end
