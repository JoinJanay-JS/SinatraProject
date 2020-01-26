class StudentsController < ApplicationController
    before '/students/*' do
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
      @students = Student.all.sort_by{|s| s.name}
      erb :"students/show"
    end
  
    post '/create' do 
      student = Students.new(name: params["name"], age: params["age"])
      if !student.name.empty? && student.age.empty?
        student.save
      elsif
        @error = "Please create a new Student"
      else 
        new_student= Students.create(name: params["name"], age: params["age"], image: params["image"])
        session[:student_id] = new_student.id   
        student.save 
        redirect '/students/show'
    end 

    get '/student' do 
      @students = Student.all.reverse
      erb :'/students/index'
    end 

    get '/student/:id' do 
       @student = Student.find(params[id])
      erb :'/students/show'
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
end 