require 'rails_helper'

RSpec.describe Category, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  it "is valid without a parent" do
    category = Category.create(name: "categoria uno")
    expect(category).to be_valid
  end

  it "destroy the parent.. destroy children" do
    cat_parent = Category.create(name: "categoria uno")
    cat_child = Category.create(name: "categoria hijo", parent: cat_parent)

    cat_parent.destroy
    assert_nil Category.find_by_id(cat_child.id)
  end

end
