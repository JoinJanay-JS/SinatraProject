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
        redirect "/students/#{student.id}"
    end 
  end 


    get '/students/:id' do 
      student = Student.find(params[:id])
     erb :'students/show'
    end 

    patch '/students/:id' do 
      student = Student.find(params[:id])
      student.update(params [:name, :age])
      flash[:message] = "Successfully updated your Student!"
        redirect to "/students/#{student.id}"
    end
   

    get '/students/:id/edit' do
      student.find(params[:id])
      erb :'/students/show'
    end
    
    post '/students/:id/edit' do
      student.update(params[:name, :age])
      flash[:message] = "Your student has been updated"
      redirect to "/students/#{student.id}"
    end

    delete '/students/:id/delete' do
      student.destroy
      flash[:message] = "Your student has been deleted"
      redirect to '/students'
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