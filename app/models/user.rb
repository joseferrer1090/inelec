class User < ApplicationRecord
  # encrypt password
  has_secure_password

  do_not_validate_attachment_file_type :avatar
  has_attached_file :avatar, styles: { medium: "300x300#", thumb: "100x100#" }, default_url: "/image/anon_user.png"
  # Model associations
  has_many :phones
  has_and_belongs_to_many :roles
  # Validations
  validates_presence_of :name, :email, :password_digest
  validates :email, uniqueness: true

end
