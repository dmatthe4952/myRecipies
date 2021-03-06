require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup
    @recipe = Recipe.new(:name => "chicken parm", :summary => "This is the best chicken parm ever",
    :description => "heat oil, add tomato sauce, add chicken, cook for 25 minutes")
  end
  
  test 'recipe should be valid' do
    assert @recipe.valid?
  end

  test 'name should be present' do
    @recipe.name = ""
    assert (@recipe.valid? == false)
  end
  
  test 'anme should not be too short' do
    @recipe.name = "XXXX"
    assert (@recipe.valid? == false)
  end
  
  test "name should not be too long" do
    @recipe.name = 'a' * 101
    assert (@recipe.valid? == false)
  end

  test 'summary should be present' do
    @recipe.summary = ""
    assert (@recipe.valid? == false)
  end
  
  test 'summary should not be too short' do
    @recipe.summary = "XXXXXXXXX"
    assert (@recipe.valid? == false)
  end
  
  test "summary should not be too long" do
    @recipe.summary = 'a' * 151
    assert (@recipe.valid? == false)
  end
  
  test "description should be present" do
    @recipe.description = ""
    assert (@recipe.valid? == false)
  end
  
  test "description should not be too short" do
    @recipe.description = 'a' * 19
    assert (@recipe.valid? == false)
  end
  
  test 'description should not be too long' do
    text = 'a' * 501
    @recipe.description = text
    assert (@recipe.valid? == false)
  end

end