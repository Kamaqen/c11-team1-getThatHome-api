# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_secure_token

  # Associations
  has_many :properties, dependent: :destroy
  has_many :user_properties
  has_many :saved_properties, -> { where(saved: true) }, through: :user_properties, source: :property
  has_many :contacted_properties, -> { where(contacted: true) }, through: :user_properties, source: :property

  # Validations
  validates :email, uniqueness: true, presence: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: 'is invalid' }
  enum role: { landlord: 0, home_seeker: 1 }

  validates :name, :phone_number, :role, presence: true
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }, on: :create
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:password] }

  def invalidate_token
    update(token: nil)
  end
end
