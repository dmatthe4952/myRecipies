class Chef < ActiveRecord::Base
  validates :chefname, :email, presence: true
  has_many :recipies
end
