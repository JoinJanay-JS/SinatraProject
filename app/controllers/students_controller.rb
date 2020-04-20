class StudentsController < ApplicationController

    get '/students' do
      @students = Student.all
      erb :"students/index"
    end

    post '/students' do
      students = Student.new(params["student"])
      students.save
      redirect to "/users/#{user.id}"
    end

    get '/students/new' do
        if !is_logged_in?
          redirect '/'
        end
      erb :'students/new'
    end 

    get '/student/:id' do 
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

    #get '/student/:id/edit' do
     # binding.pry
   #student = Student.find_by_id(params[:id])
    # if current_user.id != @student.id
    #  erb :'/students/edit'
 # end 
    
     # patch '/student/:id' do 
      #  @student = student.find_by_id(params[:id])
      #  @student.name = params[:name]
      #  @student.age = params[:age]
      #  @student.save
     # flash[:message] = "Successfully updated your Student!"
     #   redirect to "/student/#{student.id}"
   # end
  
 # post '/student/:id/edit' do
 #   @student.update(name: params["name"], age: params["age"])
 #   flash[:message] = "Successfully updated your Student!"
   #   erb :'/students/show'
 # end 

  #  delete '/student/:id/delete' do
   #   student.destroy
    #  flash[:message] = "Your student has been deleted"
    #  redirect to '/students'
   # end
 # end


  get '/students/:id/edit' do
    @student = student.find_by(id: params[:id])
  if !is_logged_in? || !@student || @student.user != current_user
    redirect '/'
  end
  erb :'/students/edit'
end

patch '/students/:id' do
  student = student.find_by(id: params[:id])
  if student && student.user == current_user
    student.update(params[:student])
    redirect to "/students/#{student.id}"
  else
    redirect to "/students"
  end
end

delete '/students/:id/delete' do
  student = student.find_by(id: params[:id])
  if student && student.user == current_user
    student.destroy
  end
  redirect to '/students'
  end
end