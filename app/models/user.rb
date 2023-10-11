class User < ApplicationRecord
  has_secure_password
  has_secure_token

  has_many :properties, dependent: :destroy
  has_and_belongs_to_many :properties,
    join_table: 'users_properties',
    class_name: 'Property',
    foreign_key: 'user_id',
    association_foreign_key: 'property_id'
  validates :email, uniqueness: true, presence: true, 
    format: { with: URI::MailTo::EMAIL_REGEXP, message: "is invalid" }
  enum role: { landlord: 0, home_seeker: 1 }

  validates :name, :phone_number, :role, presence: true 

  def invalidate_token
    update(token: nil)
  end
end



