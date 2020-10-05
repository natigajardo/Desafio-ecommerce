class Payment < ApplicationRecord
  belongs_to :order
  belongs_to :payment_method

  #nuevos metodos 
  def close!
    ActiveRecord::Base.transaction do
      #self.order.save!
      order.complete!
      self.complete!
    end
  end

  def complete!
    #payment.state = "completed"
    #payment.save!
    #update_attributes lo que hace es poner el estado y guardar al mismo tiempo
    update_attributes({state: "completed"})
  end

end
