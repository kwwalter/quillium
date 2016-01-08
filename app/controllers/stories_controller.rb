class StoriesController < ApplicationController

  # GET /stories
  def index
    render json: @stories
  end

  # GET /stories/1
  def show
    render json: @story
  end

  # POST /stories
  def create
    @story = Story.new(story_params)

    if @story.save
      render json: @story, status: :created, location: @story
    else
      # Which one to use for errors?
      render json: {
        error: {
          message: @story.errors.full_messages.to_sentence
        }
      }

      # render json: @story.errors, status: :unprocessable_entity
    end
  end

  # PATCH /stories/1
  def update
    if @story.update(story_params)
      render json: @story
    else
      render json: {
        error: {
          message: @story.errors.full_messages.to_sentence
        }
      }
      # render json: @story.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stories/1
  def destroy
    @story.destroy
  end

  private

  # white list for story params
  def story_params
    return params.require(:story).permit(:title, :body)
  end

end
