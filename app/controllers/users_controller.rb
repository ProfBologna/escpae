class UsersController < ApplicationController

  def new
    render 'new.html.erb'
  end

  def create
    user = User.new(
                    name: params[:name],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation]
                    )
    if user.save
      User.create_game(user.id)
      session[:user_id] = user.id
      flash[:success] = 'Successfully created account!'
      room = user.rooms.first
      redirect_to "/rooms/#{room.id}"
    else
      p user.errors.full_messages
      flash[:warning] = 'Invalid email or password.'
      redirect_to '/signup'
    end
  end

  def edit
    
  end

end
