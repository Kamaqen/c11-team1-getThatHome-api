# frozen_string_literal: true

class PropertiesController < ApplicationController
  skip_before_action :authorize, only: %i[show index]
  def index
    properties = Property.order(created_at: :desc)
    render json: properties, status: 200
  end

  def show
    property = Property.find_by(id: params[:id])
    if property
      render json: property, status: 200
    else
      render json: {
        error: 'Property Not Found'
      }
    end
  end

  def create
    property = Property.new(prop_params)
    property.urls = parse_url_data(params[:urls])
    property.user = current_user

    if property.save
      render json: property, status: 200
    else
      render json: {
        errors: property.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def update
    property = Property.find_by(id: params[:id])
    if property
      property.update(
        rent_value: params[:rent_value],
        bedrooms: params[:bedrooms],
        bathrooms: params[:bathrooms],
        property_type: params[:property_type],
        operation_type: params[:operation_type],
        urls: params[:urls],
        description: params[:description],
        address: params[:address],
        pet_friendly: params[:pet_friendly],
        area: params[:area],
        property_price: params[:property_price],
        maintenance_price: params[:maintenance_price],
        user_id: params[:user_id],
        is_active: params[:is_active],
        longitude: params[:longitude],
        latitude: params[:latitude]
      )
      render json: property
    else
      render json: {
        error: 'Property Not Found'
      }
    end
  end

  def destroy
    property = Property.find_by(id: params[:id])
    return unless property

    property.destroy
    render json: 'Property Has Been Deleted'
  end

  private

  def parse_url_data(url_data_param)
    # Convertir el objeto ActionController::Parameters a JSON y asignarlo a url_data_param
    json_string = url_data_param.to_json

    # Verificar si url_data_param es un String JSON válido
    begin
      JSON.parse(json_string)
    rescue JSON::ParserError => e
      Rails.logger.error("Error parsing JSON for url_data: #{e.message}")
      {}
    end
  end

  def prop_params
    params.permit(%i[
                    rent_value
                    bedrooms
                    bathrooms
                    property_type
                    operation_type
                    urls
                    description
                    address
                    pet_friendly
                    area
                    property_price
                    maintenance_price
                    user_id
                    is_active
                    longitude
                    latitude
                  ])
  end
end
