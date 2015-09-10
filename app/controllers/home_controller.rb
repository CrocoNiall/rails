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
        redirect_to "/" 
  #redirect("/pics/#{@pic.pid}")
      else
        erb(:"/pics/new")
    end

    # add it to my DB\
    # render the page i want

  end


end
