class ArtsController < ApplicationController

  def new
    @art = Art.new
    @song = Song.find(params[:song_id])
  end

  def create
    @art = Art.new(art_params)
    @art.song_id = params['song_id']

    if @art.save
      flash[:success] = 'Art saved successfully'
      redirect_to song_path(params['song_id'])
    else
      flash[:alert] = 'Problems saving Art'
      @errors = art.errors.full_messages
      render 'arts/new'
    end
  end

  def art_params
    params.require(:art).permit(:art)
  end
end
