class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @nickname = current_user.nickname
    @items = current_user.items
  end
end
