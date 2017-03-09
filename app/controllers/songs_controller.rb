require 'rack-flash'
class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @artist = Artist.find_or_create_by(name: params['song']['artist'])
    @song = Song.create(name: params['song']['name'], artist_id:  @artist.id, genre_ids: params['song']['genre_ids'])
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs' do
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_or_create_by(name: params['song']['artist'])
    @song.update(name: params['song']['name'], artist_id:  @artist.id, genre_ids: params['song']['genre_ids'])
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end


end
