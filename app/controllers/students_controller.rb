class StudentsController < ApplicationController

    get '/students' do
      erb :"students/index"
    end
  
    post '/students' do
      students.save 
      redirect to "/student/#{@student.id}"
    end

    get '/student/:id' do 
      @student = Student.find_by_id(params[:id])
     erb :'students/show'
    end 

      patch '/student/:id' do 
        @student = student.find_by_id(params[:id])
        @student.name = params[:name]
        @student.age = params[:age]
        @student.save
      flash[:message] = "Successfully updated your Student!"
        redirect to "/student/#{student.id}"
    end
   

    get '/student/:id/edit' do
      @student.find_by_id(params [:id])
      if @user.id != @student.user_id
        flash[:message] = "This isn't your student"
      erb :'/students/show'
    end
  end 
    
    post '/student/:id/edit' do
      student.update(params[:name, :age])
      flash[:message] = "Your student has been updated"
      redirect to "/student/#{student.id}"
    end

    delete '/student/:id/delete' do
      student.destroy
      flash[:message] = "Your student has been deleted"
      redirect to '/students'
    end
  end