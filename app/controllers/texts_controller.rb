class TextsController < ApplicationController

  def new
    @text = Text.new
    @song = Song.find(params[:song_id])
  end

  def create
    @text = Text.new(text_params)
    @text.song_id = params['song_id']
    @song = Song.find(params[:song_id])

    if @text.save
      flash[:success] = 'Quote saved successfully'
      redirect_to song_path(params['song_id'])
    else
      flash[:alert] = 'Problems saving quote'
      @errors = @text.errors.full_messages
      render 'texts/new'
    end
  end

  def text_params
    params.require(:text).permit(:body)
  end
end
