class StudentsController < ApplicationController
    def index 
        @students = Student.sort_alphabetically 
    end
end