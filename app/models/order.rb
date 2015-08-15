class Order < ActiveRecord::Base
  before_create :generate_order_uid

  def details
    {order_id: self.uid}
  end

  private

  def generate_order_uid
    if self.uid.blank?
      self.uid = SecureRandom.hex(2)
    end
  end
end
