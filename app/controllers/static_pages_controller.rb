class StaticPagesController < ApplicationController
  
  def home
    @cart = Cart.find_by!(params[:id])
  end

  def help
    @cart = Cart.find_by!(params[:id])
  end

  def about
    @cart = Cart.find_by!(params[:id])
  end

  def contact
    @cart = Cart.find_by!(params[:id])
  end

end
