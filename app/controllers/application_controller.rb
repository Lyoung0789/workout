class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :session_secret, "password_secret"
  end

  get "/" do
    if logged_in?
      redirect '/exercises'
    else 
      erb :welcome, :layout=>false
    end 
    
  end

  helpers do 
    def logged_in?
      !!session[:user_id]
    end 

    def current_user
      @user = User.find(session[:user_id])
    end 

    def find_exercise
      @exercise = Exercise.find_by(id: params[:id])
    end 


  end 
end
