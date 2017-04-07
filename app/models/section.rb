class Section < ApplicationRecord
  # model association
  has_many :permission, dependent: :destroy
end
