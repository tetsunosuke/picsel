class Public::CardsController < ApplicationController
  def index
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
  end
end
