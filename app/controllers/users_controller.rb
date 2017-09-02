#module Admin
	class UsersController < ApplicationController
		def index
			@users = User.all
		end

		def new
			@user = User.new
		end

		def create
			@user = User.new(user_params)
			@user.profile_id = 2
			if @user.save
				redirect_to users_path(), notice: "Usuario Registrado Correctamente."
			else
				@errors = @user.errors.full_messages
				render :new
			end
		end

		private
			def user_params
				params.require(:user).permit(:name, :email, :password)
			end
	end
#end