class UserController < ApplicationController

  def unsubscribe
    user = User.find params[:id]
    user.update_attributes(subscribed: false)
    flash[:success] = "You successfully unsubscribed"
    redirect_to posts_path
  end

end
