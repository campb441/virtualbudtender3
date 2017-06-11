class Like < ApplicationRecord
  belongs_to :user, :required => false
belongs_to :photo
belongs_to :budtender, :required => false
end
