class SpicesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :rescue_not_found

    def index
        spices = Spice.all
        if spices
            render json: spices
        end
    end

    def show
        spice = Spice.find(params[:id])
        if spice
            render json: spice
        end
    end

    def create
        spice = Spice.create(spice_params)
        if spice
            render json: spice
        end
    end

    def update
        spice = Spice.find(params[:id])
        if spice
            spice.update(spice_params)
            render json: spice
        end
    end

    def destroy
        spice = Spice.find(params[:id])
        if spice
            spice.destroy
            head :no_content
        end
    end

    private 

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def rescue_not_found
        render json: {error: "spice not found"}, status: :not_found
    end
end
