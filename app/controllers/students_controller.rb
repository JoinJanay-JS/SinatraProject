class StudentsController < ApplicationController

    get '/students' do
      erb :"students/index"
    end
  
    post '/students' do
      students = Student.new(params["student"])
      students.save
      erb :"students/index"
    end

    get '/student/:id' do 
      #binding.pry
      @student = Student.find_by(id: params[:id])
     erb :'students/show'
    end 

    get '/student/:id/edit' do
     # binding.pry
      @student = student.find_by_id(params[:id])
    # if current_user.id != @student.id
      erb :'/students/show'
  end 
    
      patch '/student/:id' do 
        @student = student.find_by_id(params[:id])
        @student.name = params[:name]
        @student.age = params[:age]
        @student.save
      flash[:message] = "Successfully updated your Student!"
        redirect to "/student/#{student.id}"
    end
   

    
    
  post '/student/:id/edit' do
    @student.update(name: params["name"], age: params["age"])
    flash[:message] = "Successfully updated your Student!"
      erb :'/students/show'
  end 

    delete '/student/:id/delete' do
      student.destroy
      flash[:message] = "Your student has been deleted"
      redirect to '/students'
    end
  end