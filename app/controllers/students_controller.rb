class StudentsController < ApplicationController
    before '/students/*' do
      if !is_logged_in?
        flash[:login] = "You need to be logged in to perform that action"
        redirect to '/login'
      end
    end
  
    get '/students' do
      if !is_logged_in?
        flash[:login] = "You need to be logged in to performance that action"
        redirect to '/login'
      end
      @students = Students.all.sort_by{|s| s.name}
      erb :"students/landingpage"
    end
  
    get '/students/:id' do
      @students = Students.find(params["id"])
      erb :"students/show"
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