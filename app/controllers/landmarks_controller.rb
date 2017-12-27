require 'pry'
class LandmarksController < ApplicationController

  get '/' do
    redirect '/landmarks'
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    @figure = Figure.all
   erb :'/landmarks/index'
 end

 get '/landmarks/new' do
   erb :'landmarks/new'
 end

 get '/landmarks/:id' do
   @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/show'
 end

 post '/landmarks' do
   @landmark = Landmark.find_or_create_by(:name => params["landmark[name]"], :year_completed => params["landmark[year_completed]"])
   @landmark.save

   redirect to "/landmarks/#{@landmark.id}"
 end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/edit'
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.name = params[:landmark][:name]
    @landmark.year_completed = params[:landmark][:year_completed]
    @landmark.save
    erb :'/landmarks/show'
  end
end
