require 'test_helper'

class KeywordgroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @keywordgroup = keywordgroups(:one)
  end

  test "should get index" do
    get keywordgroups_url
    assert_response :success
  end

  test "should get new" do
    get new_keywordgroup_url
    assert_response :success
  end

  test "should create keywordgroup" do
    assert_difference('Keywordgroup.count') do
      post keywordgroups_url, params: { keywordgroup: {  } }
    end

    assert_redirected_to keywordgroup_url(Keywordgroup.last)
  end

  test "should show keywordgroup" do
    get keywordgroup_url(@keywordgroup)
    assert_response :success
  end

  test "should get edit" do
    get edit_keywordgroup_url(@keywordgroup)
    assert_response :success
  end

  test "should update keywordgroup" do
    patch keywordgroup_url(@keywordgroup), params: { keywordgroup: {  } }
    assert_redirected_to keywordgroup_url(@keywordgroup)
  end

  test "should destroy keywordgroup" do
    assert_difference('Keywordgroup.count', -1) do
      delete keywordgroup_url(@keywordgroup)
    end

    assert_redirected_to keywordgroups_url
  end
end
