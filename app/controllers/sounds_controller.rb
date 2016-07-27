require 'soundcloud'

class SoundsController < ApplicationController

  def new
    @sound = Sound.new
    @song = Song.find(params[:song_id])
  end

  def create
    binding.pry
    client = Soundcloud.new(client_id: ENV['SOUNDCLOUD_CLIENT_ID'])
    @sound = Sound.new(sound_params)
    @song = Song.find(params[:song_id])
    track_url = @sound.track_url

    begin
      binding.pry
      embed_info = client.get('/oembed', url: track_url)
      @sound.embed_info = embed_info['html']
    rescue SoundCloud::ResponseError
      binding.pry
      flash[:alert] = 'Problems saving sound'
      render 'sounds/new' && return
    end

    @sound.song_id = params['song_id']

    if @sound.save
      binding.pry
      flash[:success] = 'Sound saved successfully'
      redirect_to song_path(params['song_id'])
    else
      binding.pry
      flash[:alert] = 'Problems saving sound'
      @errors = @sound.errors.full_messages
      render 'sounds/new'
    end
  end


  def sound_params
    params.require(:sound).permit(:track_url, :embed_info)
  end
end
