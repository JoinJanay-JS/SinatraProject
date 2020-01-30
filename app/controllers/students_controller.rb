class StudentsController < ApplicationController
    before '/students*' do
      if !is_logged_in?
        flash[:message] = "You need to be logged in to perform that action"
        redirect to '/login'
      end
    end
  
    get '/students' do
      if !is_logged_in?
        flash[:message] = "You need to be logged in to performance that action"
        redirect to '/login'
      end
      @students = Student.all
      erb :"students/index"
    end
  
    post '/students' do 
      student = Student.new(name: params["name"], age: params["age"])
      if student.save  
        redirect '/students' 
      else         
        @error = "Please create a new student"
        student= Student.create(name: params["name"], age: params["age"], image: params["image"]) 
        redirect '/students/#{student.id}'
    end 
  end 


    get '/students/:id' do 
     erb :'/students/index'
    end 

    post '/student' do 
      @students = Student.all
      erb
    end  

   
    
    post '/students/:id' do 
    end 

    get '/students/:id/edit' do
    end
    
    post '/students/:id/edit' do
    end

    get '/students/:id/delete' do
    end

    post '/students/:id/delete' do
    end

    get '/student/:id' do 
       @students = Student.find(params[:id])
      erb :'/students/index'
   end 


    get '/back' do
      if is_logged_in?
        session.clear
        redirect to '/users'
      else
        redirect to '/'
      end
    end
  end