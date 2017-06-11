class Photo < ApplicationRecord
  belongs_to :user, :required => false
has_many :likes, :dependent => :destroy
has_many :comments, :dependent => :destroy
belongs_to :budtender, :required => false
end
