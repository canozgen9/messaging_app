class RoomsController < ApplicationController
  before_action :authenticate_user!
  def show
    @messages = Message.all
    @users = User.all
  end
end
