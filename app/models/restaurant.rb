class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  accepts_nested_attributes_for :reviews, allow_destroy: true
  
  @allowed_categories = ["chinese", "italian", "japanese", "french", "belgian"]
  validates :name, :phone_number, :address, :category, presence: true

  validates_inclusion_of :category, in: @allowed_categories

end
