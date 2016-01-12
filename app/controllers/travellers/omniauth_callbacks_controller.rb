class Travellers::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    @traveller = Traveller.from_omniauth(request.env["omniauth.auth"])

    if @traveller.persisted?
      sign_in_and_redirect @traveller, :event => :authentication
    end
  end
end