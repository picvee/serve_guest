class OrderController < ApplicationController
  def request_order  	
    order = Order.create(account_id: Account.find_by_name(params[:name]).id, tag_name: params[:tag_name])    
    render json: order.details
  end

  def validate
    uid = params[:order_uid]
    order = Order.find_by(uid: uid)
    return_data = {}
    if order.blank?
      return_data = {valid: false, message: 'Invalid order', account: ''}
    else
      return_data = {valid: true, message: 'Welcome to our khaana Khazaana', account: 'Kaakal Kai Ruchi'}
    end
    render json: return_data
  end
end



