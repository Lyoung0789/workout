class UsersController < ApplicationController 

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
            @user = current_user
            erb :"/users/edit"
        else 
            redirect '/login'
        end 
    end 

    patch '/user/:id' do 
        
        edited_hash={username: params[:username], password: params[:password]}

        if logged_in?
            
            @user = current_user
            if @user.id == params[:id].to_i
                if params[:password] == params[:password_2]
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