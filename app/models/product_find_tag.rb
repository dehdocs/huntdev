class ProductFindTag < ApplicationRecord
  belongs_to :tag
  belongs_to :product_find
end
