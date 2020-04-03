class SessionController < ApplicationController

    get '/signup' do 
        
        if logged_in?
            redirect "/"
        end 

        erb :"/sessions/signup"
    end 

    post '/signup' do 
        @user = User.new(params)
        
        if @user.valid?
            @user.save 
            session[:user_id] = @user.id
            redirect '/exercises'
        else 
            binding.pry
            erb :"/sessions/signup"
        end 
    end 

    get '/login' do 
        
        erb :"/sessions/login"
    end 

    post '/login' do 
        
        @user = User.find_by(username: params[:username])
        
        if @user && @user.authenticate(params[:password]) 
            session[:user_id] = @user.id
            redirect '/exercises'
        else 
            @error = "Invalid Password or Username"
            erb :"/sessions/login"
        end 
    end 

    get '/logout' do 
        if logged_in?
            session.clear
            redirect '/'
        else 
            redirect '/'
        end 
    end 

end 