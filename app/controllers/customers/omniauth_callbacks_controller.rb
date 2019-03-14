class Customers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @customer = Customer.from_omniauth request.env["omniauth.auth"]

    if @customer.persisted?
      sign_in_and_redirect @customer, event: :authentication
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_customer_registration_url
    end
  end

  def google_oauth2
    @customer = Customer.from_omniauth request.env["omniauth.auth"]
    if @customer.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", kind: "Google"
      sign_in_and_redirect @customer, event: :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_customer_registration_url
    end
  end
end
