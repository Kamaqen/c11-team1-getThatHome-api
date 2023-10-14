class UserPropertiesController < ApplicationController
  # GET /user_properties/saved
  def index_saved
    saved_properties = current_user.user_properties.where(saved: true).map(&:property)
    render json: saved_properties
  end

  # GET /user_properties/contacted
  def index_contacted
    contacted_properties = current_user.user_properties.where(contacted: true).map(&:property)
    render json: contacted_properties
  end

  # POST /user_properties/saved
  def create_saved
    user_property = current_user.user_properties.new(property_id: params[:property_id], saved: true)
    if user_property.save
      render json: user_property, status: :created
    else
      render json: user_property.errors, status: :unprocessable_entity
    end
  end

  # POST /user_properties/contacted
  def create_contacted
    user_property = current_user.user_properties.new(property_id: params[:property_id], contacted: true)
    if user_property.save
      render json: user_property, status: :created
    else
      render json: user_property.errors, status: :unprocessable_entity
    end
  end

end

