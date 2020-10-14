class PurchasesController < ApplicationController
    before_action :set_purchase, only: [:index, :new, :create]
    before_action :move_to_sign_in
    before_action :purchase_protect
    def index
        @purchase_address = PurchaseAddress.new
    end

    def create
        @purchase_address = PurchaseAddress.new(purchase_params)
        if @purchase_address.valid?
            pay_item
            @purchase_address.save
            redirect_to root_path
        else
            render action: :index
        end
    end

    private

    def set_purchase
        @item = Item.find(params[:item_id])
    end
    
    def move_to_sign_in
        unless user_signed_in?
            redirect_to  new_user_session_path
        end
    end
    
    def purchase_protect
        if current_user.id == @item.user_id
            redirect_to root_path
        end
    end

    def purchase_params
        params.require(:purchase_address).permit(:postal_code, :send_area_choice_id, :municipalities, :address, :building, :phone_number, :item_id).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
    end

    def pay_item
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
            amount: @item.price,
            card: purchase_params[:token],
            currency: 'jpy'
        )
    end

end
