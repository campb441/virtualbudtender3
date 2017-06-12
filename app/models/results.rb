class Results < ApplicationRecord
  belongs_to :user, :required => false
belongs_to :product_recommendations
belongs_to :budtender, :required => false
end
