class HomeController < ApplicationController
  protect_from_forgery

  def index
    @title = 'Home'
    @pics = Pic.all 
  end

  def new
    #renders new form
  end

  def create
    @pic = Pic.new(name: params[:pic]['name'], url: params[:pic]['url'])
      if @pic.save
      
        redirect_to("/pics/#{@pic[:id]}")
      else
        redirect_to("/pics/new")
    end
  end

  def edit 
    @pic = Pic.find(params[:id])
  end

  def update
      @pic = Pic.find(params[:id])
    if @pic.update_attributes!(name: params[:pic]['name'], url: params[:pic]['url'])
      puts 'trying to update'
      redirect_to("/pic/#{@pic[:id]}")
    else 
      puts 'didnt work'
    end
  end


  def show 
    @pic = Pic.find(params[:id])
  end



end
