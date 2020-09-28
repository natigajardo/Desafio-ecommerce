class Variant < ApplicationRecord
  belongs_to :product
  belongs_to :color
  belongs_to :size

  validates :product_id, uniqueness: { scope: [:color_id, :size_id] }
end
