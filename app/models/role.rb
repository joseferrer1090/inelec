class Role < ApplicationRecord

  #Relacionships
  has_and_belongs_to_many :users
  has_many :permissions

  #Validations
  validates_presence_of :name, :slug
  validates :slug, uniqueness: true


end
