require 'pry'
class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index' 
  end

  get '/pets/new' do
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do
    if params["owner_id"] == nil
      @owner = Owner.create({"name"=>params["owner"]["name"]})
    else
      @owner = Owner.find(params["owner_id"])
    end
    @pet = Pet.create({"name" => params["pet_name"], "owner_id" => @owner.id})
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
    @owner = Owner.find(@pet.owner_id)
    erb :'/pets/show'
  end

  patch '/pets/:id' do 

    redirect to "pets/#{@pet.id}"
  end
end