class SongsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_songs = Song.where(user_id: current_user.id).find_each
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @new_song = Song.new
  end

  def create
    @new_song = Song.new(song_params)
    @new_song.user_id = current_user.id
    if @new_song.save
      flash[:success] = 'Song saved successfully'
      redirect_to song_path(@new_song)
    else
      flash[:alert] = 'Problems saving song'
      @errors = @song.errors.full_messages
      render 'songs/new'
    end
  end

  def song_params
    params.require(:song).permit(:title,
                                  :body)
  end
end
