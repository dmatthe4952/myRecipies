class Recipe < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :chef
  validates :name, presence: true,
                    length: { minimum: 5, maximum: 100 }
end
