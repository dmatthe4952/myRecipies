class Review < ActiveRecord::Base
  belongs_to :chef
  belongs_to :recipe
  
  validates :body, presence: true, length: { minimum: 5, maximum: 150}
  validates_uniqueness_of :chef, scope: :recipe
end