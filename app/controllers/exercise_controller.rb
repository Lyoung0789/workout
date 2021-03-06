class ExerciseController < ApplicationController


    get '/exercises' do 
        
        if logged_in?
            @user = current_user
            erb :"/exercises/index"
        else 
            redirect '/'
        end
    end 

    
    get '/exercises/new' do 
        erb :"/exercises/new"
    end 

    post '/exercises/new' do 
        if logged_in?
            @user = current_user
            @exercise = Exercise.new(params)
            @exercise.user = @user

            if @exercise.valid?
                @exercise.save
                redirect 'exercises'
            else 
                
                erb :"/exercises/new"
                
            end 
        else 
            redirect '/login'
        end 
        
    end 

    get '/exercises/edit' do 

        if logged_in?
            @user = current_user
            erb :"exercises/edit_index"
        else 
            redirect '/login'
        end  
    end 

    post '/exercises' do 
        redirect "/exercises/#{params[:id]}"
        
    end 

    get '/exercises/:id' do 
        
        if logged_in?
            find_exercise
            if @exercise.user_id == current_user.id
                erb :"/exercises/show"
            else 
                redirect '/exercises'
            end 
        else 
            redirect '/login'
        end 
    end 

    get '/exercises/:id/edit' do    
        
        if logged_in?
            find_exercise
            if @exercise.user == current_user
                erb :"/exercises/edit"
            else 
                redirect "/exercises"
            end 
        else 
            redirect "/login"
        end 
    end 

    patch '/exercises/:id' do 
        
        edited_hash={name: params[:name], reps: params[:reps], date: params[:date]}
        if logged_in?
            find_exercise
            #makes sure you are the correct user editing the right exercise
            if @exercise.user == current_user 
                @exercise.update(edited_hash)
                redirect "/exercises/#{@exercise.id}"
            else 
                binding.pry
                redirect "/exercises"
            end 
        else 
            redirect '/login'
        end 

        
    end 

    get '/exercises/:id/delete' do 
        find_exercise
        erb :"/exercises/delete"
    end 

    delete '/exercises/:id' do 
        
        if logged_in?
            find_exercise
            if @exercise.user == current_user
                @exercise.delete
                redirect '/exercises'
            else 
                redirect '/exercises'
            end 
        else 
            redirect '/login'
        end 
        
    end 




end  
    

