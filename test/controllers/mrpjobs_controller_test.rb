require 'test_helper'

class MrpjobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mrpjob = mrpjobs(:one)
  end

  test "should get index" do
    get mrpjobs_url
    assert_response :success
  end

  test "should get new" do
    get new_mrpjob_url
    assert_response :success
  end

  test "should create mrpjob" do
    assert_difference('Mrpjob.count') do
      post mrpjobs_url, params: { mrpjob: { description: @mrpjob.description, name: @mrpjob.name } }
    end

    assert_redirected_to mrpjob_url(Mrpjob.last)
  end

  test "should show mrpjob" do
    get mrpjob_url(@mrpjob)
    assert_response :success
  end

  test "should get edit" do
    get edit_mrpjob_url(@mrpjob)
    assert_response :success
  end

  test "should update mrpjob" do
    patch mrpjob_url(@mrpjob), params: { mrpjob: { description: @mrpjob.description, name: @mrpjob.name } }
    assert_redirected_to mrpjob_url(@mrpjob)
  end

  test "should destroy mrpjob" do
    assert_difference('Mrpjob.count', -1) do
      delete mrpjob_url(@mrpjob)
    end

    assert_redirected_to mrpjobs_url
  end
end
