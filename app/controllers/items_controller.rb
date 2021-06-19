class ItemsController < ApplicationController
  
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  # def edit
  # end

  # def update
  # end
  
  # def destroy
  # end

  private

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :scheduled_delivery_id,
                                 :price, :prefecture_id, :image).merge(user_id: current_user.id)
  end

  # def set_item
  #   @item = Item.find(params[:id])
  # end

  # def contributor_confirmation
  #   redirect_to root_path unless current_user == @item.user
  # end
end
