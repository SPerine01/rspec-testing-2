class Comment < ActiveRecord::Base
  belongs_to :customer
  has_many :comments, dependent: :destroy
end
