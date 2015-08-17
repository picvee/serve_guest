class OrderController < ApplicationController
  def request_order  	
    account_details = Account.find_by_name(params[:name])      
    @account_id = account_details.id
    @tag_name = params[:tag_name]    
    order = Order.create
    render json: order.details
  end

  def validate
    uid = params[:order_uid]
    order = Order.find_by(uid: uid)
    return_data = {}
    if order.blank?
      return_data = {valid: false}
    else
      return_data = {valid: true}
    end
    render json: return_data
  end
end



