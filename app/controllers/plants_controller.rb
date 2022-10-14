class PlantsController < ApplicationController
    wrap_parameters format: []
    def index
        plants = Plant.all 
        render json: plants
    end

    def show
        show_plant = Plant.find_by(id: params[:id])
        if show_plant
            render json: show_plant
        else
            render json: { error: "Bird not found" }, status: :not_found
        end
    end

    def create
        plant = Plant.create(plant_params)
        render json: plant, status: :created
    end

    private

    def plant_params
        params.permit(:name, :image, :price)
    end
end
