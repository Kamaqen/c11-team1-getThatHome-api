class User < ApplicationRecord
  has_secure_password
  has_secure_token

  has_many :properties, dependent: :destroy
  has_and_belongs_to_many :properties

  validates :email, uniqueness: true, 
                    presence: true, 
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "is invalid" }

  validates :name, :phone_number, presence: true

  def invalidate_token
    update(token: nil)
  end
end
