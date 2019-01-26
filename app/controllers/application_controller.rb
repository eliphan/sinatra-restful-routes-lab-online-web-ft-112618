class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/' do
    redirect to "/recipes"
  end
  
  get '/recipes' do

    erb :index
  end
  
  get '/new' do
    
    erb :new
  end
  
  post '/new' do
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"
  end
end
