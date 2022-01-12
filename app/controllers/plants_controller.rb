class PlantsController < ApplicationController
    def index
        plants = Plant.all
        render json: plants
    end

    def show
        plant = Plant.find_by_id(params[:id])
        render json: plant
    end

    def create
        # use strong params here, defined a private method of which params.permit
        plant = Plant.create(plant_params)
        plant.save
        render json: plant, status: :created
        # byebug
    end


    private
    def plant_params
        params.permit(:name, :image, :price)
    end
end
