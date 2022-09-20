class Order < ApplicationRecord
  
  belongs_to :customer
  has_many :items
  has_many :order_details, dependent: :destroy
 
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting_for_payment: 0, confirmation: 1, producing: 2, preparation: 3, shipped: 4 }

end
