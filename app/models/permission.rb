class Permission < ApplicationRecord
  #Relacionships
  belongs_to :role
  belongs_to :section

  #Validations
  validates_presence_of :level

end
