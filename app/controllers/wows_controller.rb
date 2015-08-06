class WowsController < ApplicationController
    before_action :find_wow, only: [:show, :edit, :update, :destroy]

    def index
        @wows = Wow.all.order("created_at DESC")
    end
    
    def new
        @wow = Wow.new
    end

    def show
    end
    
    def create
         @wow = Wow.new(wow_params)

         if @wow.save
             redirect_to @wow, notice: "Successfully created new Wow"
         else
             render 'new'
         end
     end

    def edit
    end

    def update
        if @wow.update(wow_params)
            redirect_to @wow, notice: "Wow was succesfully updated"
        else
            render 'edit'
        end
    end

    def destroy
        @wow.destroy
        redirect_to root_path
    end
    
    private
    
    def wow_params
        params.require(:wow).permit(:title, :description)
    end

    def find_wow
        @wow = Wow.find(params[:id])
    end
end
