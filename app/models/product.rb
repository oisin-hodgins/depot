class Product < ApplicationRecord
  validates :title, :description, :image_url, presence: true
  validates :title, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :image_url, allow_blank: true, format: {
  with: %r{\.(gif|jpg|jpeg|png)\Z}i,
  message: 'must be a URL for GIF, JPG, JPEG or PNG image.'
  }
  has_many :line_items
  has_many :orders, through: :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
end

private

# ensure that there are no line items referencing this product
def ensure_not_referenced_by_any_line_item
  unless line_items.empty?
    errors.add(:base, 'Line Items present')
    throw :abort
  end
end
