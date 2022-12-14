class DeliveriesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :delivery_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity

    # GET /rdeliveries
    def index
        deliveries = Delivery.all
        render json: deliveries
    end

    # GET /deliveries/:id
    def show
        delivery = Delivery.find_by(id: params[:id])
        render json: delivery, status: :ok
    end

    # POST/deliveries
    def create
        delivery = Delivery.create!(delivery_params)
        render json: delivery, status: :created
    end

    # PATCH /deliveries/:id
    def update
        delivery = Delivery.find(id: params[:id])
        delivery.update!(delivery_params)
        render json: delivery, status: :ok
    end

    # DELETE /deliveries/:id
    def destroy
        delivery = Delivery.find(id: params[:id])
        Delivery.destroy
        head :no_content
    end

    private

    def delivery_params
        params.permit(:receiver_name, :receiver_contact, :pickup_instructions, :delivery_instructions, :package_type, :package_details)
    end

    def unprocessable_entity(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def delivery_not_found
        render json: { error: "delivery not found" }, status: :not_found
    end

end
