class ArtsController < ApplicationController
  before_action :authenticate_user!

  def new
    @art = Art.new
    @song = Song.find(params[:song_id])
  end

  def create
    @song = Song.find(params[:song_id])

    begin
      @art = Art.new(art_params)
    rescue ActionController::ParameterMissing
      flash[:alert] = 'Must choose a file to upload'
      @art = Art.new
      @song = Song.find(params[:song_id])
      render('arts/new') && return
    end

    @art.song_id = params['song_id']


    if @art.save
      flash[:success] = 'Art saved successfully'
      redirect_to song_path(params['song_id'])
    else
      flash[:alert] = 'Problems saving Art'
      render 'arts/new'
    end
  end

  def art_params
    params.require(:art).permit(:imgfile)
  end
end
