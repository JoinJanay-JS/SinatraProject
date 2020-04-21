class StudentsController < ApplicationController

    get '/students' do
      user = User.create(username: params["username"], email: params["email"], password: params["password"]  )
      @students = Student.all
      erb :"students/index"
    end

    get '/students/new' do
      if !is_logged_in?
        redirect '/'
      end
    erb :'students/new'
  end 

    post '/students' do
      user = current_user
      if user.valid?
      session[:user_id] = user.id 
      end
      students = Student.new(params["student"])
      students.save
      redirect to "/users/#{user.id}"
    end

    get '/students/:id' do 
      #binding.pry
      if !is_logged_in?
        redirect '/'  
      end
        @student = Student.find_by(id: params[:id])
        if !@student
          redirect '/'
        end
     erb :'students/show'
    end 



  get '/students/:id/edit' do
    @user = current_user
    @student = Student.find_by(id: params[:id])
    if @user.id != @student.user_id
      redirect to "/students/#{@student.id}"
    end 
  erb :'/students/edit'
end

patch '/students/:id' do
  student = Student.find_by(id: params[:id])
  if student && student.user == current_user
    student.update(params[:student])
    redirect to "/students/#{student.id}"
  else
    redirect to "/students"
  end
end

delete '/students/:id/delete' do
  student = Student.find_by(id: params[:id])
  if student && student.user == current_user
    student.destroy
  end
  redirect to '/students'
  end
end