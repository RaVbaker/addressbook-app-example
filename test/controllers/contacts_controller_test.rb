require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  fixtures :contacts

  test "should get show" do
    get :show, id: contacts(:bob)
    assert_response :success
    assert_equal contacts(:bob), assigns(:contact)
  end

end
