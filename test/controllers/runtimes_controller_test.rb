require 'test_helper'

class RuntimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @runtime = runtimes(:one)
  end

  test "should get index" do
    get runtimes_url
    assert_response :success
  end

  test "should get new" do
    get new_runtime_url
    assert_response :success
  end

  test "should create runtime" do
    assert_difference('Runtime.count') do
      post runtimes_url, params: { runtime: { Mrpjob_id: @runtime.Mrpjob_id, date: @runtime.date, end_time: @runtime.end_time, start_time: @runtime.start_time } }
    end

    assert_redirected_to runtime_url(Runtime.last)
  end

  test "should show runtime" do
    get runtime_url(@runtime)
    assert_response :success
  end

  test "should get edit" do
    get edit_runtime_url(@runtime)
    assert_response :success
  end

  test "should update runtime" do
    patch runtime_url(@runtime), params: { runtime: { Mrpjob_id: @runtime.Mrpjob_id, date: @runtime.date, end_time: @runtime.end_time, start_time: @runtime.start_time } }
    assert_redirected_to runtime_url(@runtime)
  end

  test "should destroy runtime" do
    assert_difference('Runtime.count', -1) do
      delete runtime_url(@runtime)
    end

    assert_redirected_to runtimes_url
  end
end
