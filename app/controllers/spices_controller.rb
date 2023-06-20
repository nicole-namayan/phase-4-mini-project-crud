class SpicesController < ApplicationController

    # GET /spices
    def index
        spices = Spice.all
        render json: spices
    end

    # GET /spices/:id
    def show
        spices = find_spice
        if spices
        render json: spices
        else 
            render_not_found_response
        end
     
    end

    # POST /spices
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    # PATCH /spices/:id
    def update
        spice = find_spice
        if spice
        spice.update(spice_params)
        render json: spice
        else
            render_not_found_response
        end  
    end

    # DELETE /spices/:id
    def destroy
        spice = find_spice
        if spice
        spice.destroy
        head :no_content
        else 
            render_not_found_response
        end
    end

    private
    
    def find_spice
        Spice.find_by(id: params[:id])
    end

    def render_not_found_response
        render json: { error: "Spice not found" }, status: :not_found
    end

    def spice_params
       params.permit(:title, :image, :description, :notes, :rating)
    end
end
