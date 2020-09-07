class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User", foreign_key: "follower_id"
  belongs_to :following, class_name: "User", foreign_key: "folowing_id"
end
