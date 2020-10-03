class ItemsController < ApplicationController
    before_action :set_item, only: [:show, :edit]
    before_action :move_to_sign_in, except: [:index, :show, :search]

    def index
        @items = Item.includes(:user).order("created_at DESC")
    end
    
    def new
        @item = Item.new
    end
    
    def show    
    end

    def edit
        edit_protect
    end

    def update
        @item = Item.update(item_params)
        if @item
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

    def move_to_sign_in
        unless user_signed_in?
            redirect_to  new_user_session_path
        end
    end

    def set_item
        @item = Item.find(params[:id])
    end

    def edit_protect
        @item = Item.find(params[:id])
        unless current_user.id == @item.user.id
            redirect_to root_path
        end
    end

end
