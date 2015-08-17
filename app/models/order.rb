class Order < ActiveRecord::Base
  before_create :generate_order_uid

  def details
    {order_id: self.uid, tag_name: self.tag_name, account_id: self.account_id}
  end

  private

  def generate_order_uid
    if self.uid.blank?
      self.uid = SecureRandom.hex(2)      
    end    
  end
end
