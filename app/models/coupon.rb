class Coupon < ApplicationRecord
  belongs_to :user, optional: true

  #def self.usable?
  #  valid_on_count?
  #end

  #def valid_on_count?
  #  kind.eq?('target') ? count > 0 : true
  #end

  def compute_total(total)
    if discount.eq?('percent')
      percent_value = amount.to_f / 100
      total = total - (total * percent_value)
    else
      total = total - amount
      (total < 0) ? 0 : total 
    end 
  end

  def disabled
    self.available = false
    self.save
  end
    
end

#controller, antes de pagar 
coupon = Coupon.find_by(code: get_code_from_params)
if coupon.available? 
  price = copupon.compute_total(order.total)
end

#controller, despues de pagar
if coupon.kind.eq?('target')
  coupon.disabled
end