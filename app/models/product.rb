class Product < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :categories

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :img_url, presence: true, format: { with: %r{\Ahttps://i.pinimg.com/\d+x/.+\.(gif|jpg|png)\z}, message: "должен быть URL изображения формата GIF, JPG или PNG из pinterest"  }


  def self.ransackable_attributes(auth_object = nil)
    ["body", "created_at", "id", "img_url", "price", "quantity", "title", "updated_at"]
  end
  
end
