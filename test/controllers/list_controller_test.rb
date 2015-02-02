require 'test_helper'

class ListControllerTest < ActionController::TestCase
  fixtures :contacts
  test "should get index" do
    get :index
    assert_response :success
    assert_equal [contacts(:bob)], assigns(:contacts)
  end

end
