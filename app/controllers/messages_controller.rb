class MessagesController < ApplicationController
  def index
    @group = Group.all
  end

  def new
  end
end


  private
