class OrderController < ApplicationController
  def request_order
  	@random = SecureRandom.hex(3)
  	@status 
  	Order.create(:uid => @random, :status => @status)
  end
end



