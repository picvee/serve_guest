class Order < ActiveRecord::Base
  before_create :generate_order_uid

  def details
    {order_id: self.uid, account_id: self.account_id, tag_name: self.tag_name}
  end

  private

  def generate_order_uid
    if self.uid.blank?
      self.uid = SecureRandom.hex(2)
      self.account_id = @account_id    
      self.tag_name = @tag_name
    end    
  end
end
