class EditsController < ApplicationController

	# GET /edits
	def index
		@edits = Edit.all

		render json: @edits
	end

	# GET /edits/1
	def show
		render json: @edit
	end

	# POST /edits
	def create
		@edit = Edit.new(edit_params)

		if @edit.save
			render json: @edit, status: :created, location: @edit
		else
			render json: {
        error: {
          message: @edit.errors.full_messages.to_sentence
        }
      }
		end
	end

	# PATCH/PUT /edits/1
	def update
		if @edit.update(edit_params)
			render json: @edit
		else
			render json: {
        error: {
          message: @edit.errors.full_messages.to_sentence
        }
      }
		end
	end

	# DELETE /edits/1
	def destroy
		@edit.destroy
	end

	private

	    # Only allow a trusted parameter "white list" through.
    def edit_params
      params.require(:edit).permit(:content)
    end
end
