class PhoneVerificationsController < ApplicationController
  def create
    number = params[:phone]
    if number.blank?
      flash[:alert] = t "some_thing_went_wrong"
      redirect_to root_path
    else
      current_customer.update_phone_number number
      current_customer.generate_pin
      current_customer.send_pin
      flash[:notice] = t ".successfully_sent"
      redirect_to edit_phone_verification_path
    end
  end

  def edit;end

  def update
    if current_customer.verify_pin params[:pin]
      flash[:notice] = t ".successfully_verified"
      redirect_to edit_customer_registration_path
    else
      flash[:alert] = t ".wrong_pin"
      redirect_to edit_phone_verification_path
    end
  end

end
