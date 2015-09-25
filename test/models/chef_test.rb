require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.new(:chefname => "George Plimpton", :email => "george@example.com")
  end
  
  test "chef is valid" do
    assert @chef.valid?
  end
  
  test "chefname should be present" do
    @chef.chefname =  ""
    assert (@chef.valid? == false)
  end
  
  test "chefname should not be too short" do
    @chef.chefname  = "bo"
    assert (@chef.valid? == false)
  end
  
  test "chefname should not be too long" do
    @chef.chefname = 'a' * 41
    assert (@chef.valid? == false)
  end
  
  test "email should be present" do
    @chef.email = ""
    assert (@chef.valid? == false)
  end
  
  test "email should be unique" do
    @chef2 = Chef.create(:chefname => "Bob", :email => "bob@example.com")
    @chef.email = "bob@example.com"
    assert (@chef.valid? == false)
  end
end
