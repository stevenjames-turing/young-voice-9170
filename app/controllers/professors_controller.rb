class ProfessorsController < ApplicationController
    def index
        @professors = Professor.sort_alphabetically
    end

    def show
        @professor = Professor.find(params[:id])
    end
end