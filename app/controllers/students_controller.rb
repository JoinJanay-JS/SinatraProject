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

    post '/students' do 
      @students = Student.all
    end  

   
    
    patch '/students/:id' do 
      students = Student.find(params[:id])
      student = Student.update(name, age)
      flash[:message] = "Successfully updated your Student!"
        redirect to "/students/#{student.id}"
    end
   

    get '/students/:id/edit' do
      erb :'/students/show'
    end
    
    post '/students/:id/edit' do
    end

    get '/students/:id/delete' do
    end

    post '/students/:id/delete' do
      erb :'/students/show'
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