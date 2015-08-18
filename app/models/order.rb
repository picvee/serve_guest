class Order < ActiveRecord::Base
  before_create :generate_order_uid
  validates :tag_id, presence: true
  belongs_to :tag

  def details
    {order_id: self.uid, tag_name: self.tag.name, account_id: ''}
  end

  private

  def generate_order_uid
    if self.uid.blank?
      self.uid = SecureRandom.hex(2)      
    end    
  end
end
