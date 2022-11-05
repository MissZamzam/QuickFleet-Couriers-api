class ReceiptsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :receipt_not_found

  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity

#   skip_before_action :authenticate, only: [:index, :show, :create, :update]

  # GET /receipts
  def index
    receipts = Receipt.all
    render json: receipts
  end

  #  GET /receipts/:id
  def show
    receipt = Receipt.find(params[:id])
    render json: receipt, status: :ok
  end

  #NEW Receipt
  def new
    @receipt = Receipt.new
    # render json: receipt
  end


  # POST/receipts
  def create
    @receipt = Receipt.create!(receipt_params)
    # receipt.status = "In Progress"
    # puts "xxxxxxxxxxxxxxxx"
    render json: @receipt, status: :created

    if @receipt.valid?
      @receipt.save
      # OrderMailer.with(receipt: @receipt).new_order_email.deliver_now
      # OrderMailer.with(user:current_user, receipt: @receipt).new_order_email.deliver_now
      mail = OrderMailer.new_order_email(@receipt).deliver_now
      puts "xxxxxxxxxxxxx"
      puts mail
      return ("Thank you for your order! Your Order Will Be Delivered Soon")
      # render json: { error: "Thank you for your order! We'll get contact you soon!"}
      redirect_to root_path
      # redirect_to "/receipts", notice: "Your order has been placed."
    else
      render json: { error: "Your receipt form had some errors. Please check the form and resubmit." }, status: unprocessable_entity
    end
  end


  # def create
  #   receipt = Receipt.create!(receipt_params)
  #   render json: receipt, status: :created
  # end

  # PATCH /receipts/:id
  def update
    #find
    receipt = Receipt.find(params[:id])
    Receipt.update!(receipt_params)
    render json: receipt, status: :ok
  end

  # DELETE /receipts/:id
  def destroy
    # find
    receipt = Receipt.find(params[:id])
    # delete
    Receipt.destroy
    head :no_content
  end

  private

  def receipt_params
    params.permit(:id, :receipt_no, :sender_name, :receiver_name, :amount_paid, :nature_of_goods, :pickup, :destination, :order_id)
  end

  def unprocessable_entity(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  def receipt_not_found
    render json: { error: "receipt not found" }, status: :not_found
  end
end
