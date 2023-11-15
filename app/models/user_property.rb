# frozen_string_literal: true

class UserProperty < ApplicationRecord
  belongs_to :user
  belongs_to :property
end
