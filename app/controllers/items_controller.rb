class ItemsController < ApplicationController
    before_action :set_item, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show, :search]
    before_action :edit_protect, only: [:edit, :destroy]
    
    def index
        @items = Item.includes(:user).order("created_at DESC")
    end
    
    def new
        @item = Item.new
    end
    
    def show
        @purchase = @item.purchase
    end

    def edit
    end

    def destroy
        if @item.destroy
            redirect_to root_path
        else
            render :show
        end
    end

    def update      
        if @item.update(item_params)
            redirect_to root_path
        else
            render :edit
        end
    end

    def create
        @item = Item.new(item_params)
        if @item.save
            redirect_to root_path
        else
            render :new
        end
    end


    private

    def item_params
        params.require(:item).permit(:image, :name, :explanation, :price, :category_choice_id, :item_status_choice_id, :send_area_choice_id, :send_date_choice_id, :send_fee_choice_id).merge(user_id: current_user.id)
    end

    def set_item
        @item = Item.find_by_id(params[:id])
    end

    def edit_protect
        unless current_user.id == @item.user.id
            redirect_to root_path
        end
    end

end
