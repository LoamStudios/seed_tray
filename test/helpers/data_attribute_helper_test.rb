require 'test_helper'
 
class StaticPagesControllerTest < ActionController::TestCase
    test "helper should return data attribute for controller" do
        get :index
        assert_equal "data-controller='StaticPages' data-action='Index'", @controller.view_context.page_data_attr
    end
end


class Fruit::BananasControllerTest < ActionController::TestCase
  test "helper should return data attribute for controller" do
        get :index
        assert_equal "data-controller='Fruit_Bananas' data-action='Index'", @controller.view_context.page_data_attr
    end
end
