class Recipe < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :chef
  validates :title, presence: true,
                    length: { minimum: 5 }
end
