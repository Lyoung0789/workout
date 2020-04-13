class UsersController < ApplicationController 

    get '/signup' do 
        
        if logged_in?
            redirect "/exercises"
        end 

        erb :"/users/signup"
    end 

    post '/signup' do 
        @user = User.new(params)
        
        if @user.valid?
            @user.save 
            session[:user_id] = @user.id
            redirect '/exercises'
        else 
            
            erb :"/users/signup"
        end 
    end 

    get '/user' do 
        if logged_in?
            
            @user = current_user
            erb :"/users/index"
            
        else 
            redirect '/login'
        end 
    
    end 

    get '/user/:id/edit' do 
        
        if logged_in?
            current_user
            erb :"/users/edit"
        else 
            redirect '/login'
        end 
    end 

    patch '/user/:id' do 
        binding.pry
        edited_hash={username: params[:username], password: params[:new_password]}
        
        if logged_in?
            current_user
            
            if @user.id == session[:user_id]

                if params[:new_password] == params[:new_password_2]
                    @user.update(edited_hash)
                    redirect '/user'
                else 
                    
                    redirect '/user'
                end 
            else 
                
                redirect "/user"
            end 
        else 
            
            redirect '/login'
        end 

       

    end 


    delete '/user/:id' do 
        if logged_in?
            @user = current_user
            if @user.id == params[:id].to_i
                @user.exercises.each do |exercise|
                    exercise.delete
                end 
                @user.delete
                redirect '/logout'
            else 
                redirect '/user'
            end 
        else 
            redirect '/login'
        end 
        
    end 
end 