require 'test_helper'

class BreadcrumbsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @breadcrumb = breadcrumbs(:one)
  end

  test "should get index" do
    get breadcrumbs_url
    assert_response :success
  end

  test "should get new" do
    get new_breadcrumb_url
    assert_response :success
  end

  test "should create breadcrumb" do
    assert_difference('Breadcrumb.count') do
      post breadcrumbs_url, params: { breadcrumb: { code: @breadcrumb.code, description: @breadcrumb.description, name: @breadcrumb.name, progress: @breadcrumb.progress, user_created_id: @breadcrumb.user_created_id, user_tested_id: @breadcrumb.user_tested_id } }
    end

    assert_redirected_to breadcrumb_url(Breadcrumb.last)
  end

  test "should show breadcrumb" do
    get breadcrumb_url(@breadcrumb)
    assert_response :success
  end

  test "should get edit" do
    get edit_breadcrumb_url(@breadcrumb)
    assert_response :success
  end

  test "should update breadcrumb" do
    patch breadcrumb_url(@breadcrumb), params: { breadcrumb: { code: @breadcrumb.code, description: @breadcrumb.description, name: @breadcrumb.name, progress: @breadcrumb.progress, user_created_id: @breadcrumb.user_created_id, user_tested_id: @breadcrumb.user_tested_id } }
    assert_redirected_to breadcrumb_url(@breadcrumb)
  end

  test "should destroy breadcrumb" do
    assert_difference('Breadcrumb.count', -1) do
      delete breadcrumb_url(@breadcrumb)
    end

    assert_redirected_to breadcrumbs_url
  end
end
