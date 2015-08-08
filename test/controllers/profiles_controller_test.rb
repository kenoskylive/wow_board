require "test_helper"

class ProfilesControllerTest < ActionController::TestCase
  def profile
    @profile ||= profiles :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:profiles)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Profile.count") do
      post :create, profile: { about_me: profile.about_me, address: profile.address, firstname: profile.firstname, lastname: profile.lastname, user_id: profile.user_id }
    end

    assert_redirected_to profile_path(assigns(:profile))
  end

  def test_show
    get :show, id: profile
    assert_response :success
  end

  def test_edit
    get :edit, id: profile
    assert_response :success
  end

  def test_update
    put :update, id: profile, profile: { about_me: profile.about_me, address: profile.address, firstname: profile.firstname, lastname: profile.lastname, user_id: profile.user_id }
    assert_redirected_to profile_path(assigns(:profile))
  end

  def test_destroy
    assert_difference("Profile.count", -1) do
      delete :destroy, id: profile
    end

    assert_redirected_to profiles_path
  end
end
