class OrderController < ApplicationController
  def request_order
    tag = Tag.find_by(name: params[:tag])
    order = Order.create(tag: tag)
    render json: order.details
  end

  def validate
    uid = params[:order_uid]
    order = Order.includes(:tag).find_by(uid: uid)
    return_data = {}
    if order.blank?
      return_data = {valid: false, message: 'Invalid order', account: '', tag: ''}
    else
      return_data = {valid: true, message: 'Welcome to our khaana Khazaana', account: 'Kaakal Kai Ruchi', tag: order.tag.name}
    end
    render json: return_data
  end
end