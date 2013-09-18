class UsersController < ApplicationController
  def new
    @user = User.new
  end

 def create
   @user = User.new(params[:user])
   if @user.save
     render text: "ok"
   else
     render text: "not ok"
   end
 end
end
