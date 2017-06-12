class OmniauthController < ApplicationController

  def create
    binding.pry
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end