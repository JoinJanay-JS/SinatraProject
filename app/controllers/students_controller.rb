class StudentsController < ApplicationController
    before '/students/*' do
      if !is_logged_in?
        flash[:login] = "You need to be logged in to performance that action"
        redirect to '/login'
      end
    end
  
    get '/students' do
      if !is_logged_in?
        flash[:login] = "You need to be logged in to performance that action"
        redirect to '/login'
      end
      @students = Students.all.sort_by{|s| s.name}
      erb :"students/students"
    end
  
    get '/students/:id' do
      @students = Students.find(params["id"])
      erb :"students/show"
    end
  end