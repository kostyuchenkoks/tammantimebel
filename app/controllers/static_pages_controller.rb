class StaticPagesController < ApplicationController
  include CurrentCart
  before_action :set_cart
  
  def home
  end

  def help
  end

  def about
  end

  def contact
  end

end
