class UserPropertiesController < ApplicationController
  # GET /user_properties/saved
  def saved
    saved_properties = current_user.user_properties.where(saved: true).map(&:property)
    render json: saved_properties
  end

  # GET /user_properties/contacted
  def contacted
    contacted_properties = current_user.user_properties.where(contacted: true).map(&:property)
    render json: contacted_properties
  end
end

