class Product < ApplicationRecord
  has_and_belongs_to_many :categories
  has_many :variants

  #has_many :order_items
  #has_many :orders, through: :order_items

  def visible_on_catalog?
    #self.variants.each do |variant|
    #  if variant.stock > 0
    #    return true
    #  end
    #  false
    #end

    #contador = 0 
    #self.variants.each do |variant|
    #  contador = contador + variant.stock
    #end

    #if contador > 0 
    #  false
    #else
    #  true
    #end

    #forma corta
    total_stock = self.variants.map(&:stock).inject(0,&:+)
    (total_stock > 0)

  end


end
