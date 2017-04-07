class Permission < ApplicationRecord
  #Relacionships
  has_and_belongs_to_many :roles
  belongs_to :section

  #Validations
  validates_presence_of :level, :module
  validates :module, uniqueness: true

end
