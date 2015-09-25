class Chef < ActiveRecord::Base
  has_many :recipes
  validates :chefname, presence: true, length: {minimum: 3, maximum: 40}
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
