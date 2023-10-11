class PropertiesController < ApplicationController
  def index
    properties = Property.all
    render json: properties, status: 200
  end

  def show
    property = Property.find_by(id: params[:id])
    if property
      render json: property, status: 200
    else
      render json: {
        error: "Property Not Found"
      }
    end  
  end

  def create
    Property.transaction do
      @property = Property.new(
      rent_value: prop_params[:rent_value],
      bedrooms: prop_params[:bedrooms],
      bathrooms: prop_params[:bathrooms],
      property_type: prop_params[:property_type],
      operation_type: prop_params[:operation_type],
      image: prop_params[:image],
      description: prop_params[:description],
      address: prop_params[:address],
      pet_friendly: prop_params[:pet_friendly],
      area: prop_params[:area],
      property_price: prop_params[:property_price],
      maintenance_price: prop_params[:maintenance_price],
      user_id: prop_params[:user_id],
      is_active: prop_params[:is_active],
      )
      @property.user = current_user

      if @property.save
        render json: @property, status: 200
      else 
      render json: {
          errors: @property.errors.full_messages
        }, status: :unprocessable_entity
      end
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
        image:  params[:image],
        description: params[:description],
        address: params[:address],
        pet_friendly: params[:pet_friendly],
        area: params[:area],
        property_price:  params[:property_price],
        maintenance_price: params[:maintenance_price],
        user_id: params[:user_id],
        is_active: params[:is_active]
      )
      render json: "Property Record Updated Successfully!"
    else
      render json: {
        error: "Property Not Found"
      }
    end  
  end

  def destroy
    property = Property.find_by(id: params[:id])
    if property
      property.destroy
      render json: "Property Has Been Deleted"

    end
  end

  private
  def prop_params
    params.require(:property).permit([
      :rent_value,
      :bedrooms,
      :bathrooms,
      :property_type,
      :operation_type,
      :image,
      :description,
      :address,
      :pet_friendly,
      :area,
      :property_price,
      :maintenance_price,
      :user_id,
      :is_active
    ])
  end
end
