class WowsController < ApplicationController
    before_action :find_wow, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @wows = Wow.all.order("created_at DESC")
    end

    def show
    end
    
    def new
        @wow = current_user.wows.build
    end
    
    def create
         @wow = current_user.wows.build(wow_params)

         if @wow.save
             redirect_to @wow, notice: "Wow! Successfully created"
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

    def upvote
        @wow.upvote_by current_user
        redirect_to :back
    end
    
    private
    
    def wow_params
        params.require(:wow).permit(:title, :description, :image)
    end

    def find_wow
        @wow = Wow.find(params[:id])
    end

    def buddies 
        if current_user
            @wow = Wow.new
            buddies_ids = current_user.wow.map(&:id).push(current_user.id)
            @wow = Wow.find_all_by_user_id buddies_ids
        else
            redirect_to root_url
        end
    end
end
