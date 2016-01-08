class UsersController < ApplicationController

	# GET /users/1
	def show
		render json: @user
	end


	# POST /users
	def create
		@user = User.new(user_params)

		if @user.save
			render json: @user, status: :created, location: @user
		else
			render json: {
				error: {
					message: @user.errors.full_messages.to_sentence
				}
			}
		end
	end

	# PATCH/PUT /users/1
	def update
		if @user.update(user_params)
			render json: @user
		else
			render json: {
				error: {
					message: @user.errors.full_messages.to_sentence
				}
			}
		end
	end

# DELETE /users/1
	def destroy
		@user.destroy
	end

	private

		# Only allow a trusted parameter "white list" through.
	  def user_params
	    return params.require(:user).permit(:username, :password)
	  end
end
