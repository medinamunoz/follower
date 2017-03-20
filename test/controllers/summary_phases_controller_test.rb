require 'test_helper'

class SummaryPhasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @summary_phase = summary_phases(:one)
  end

  test "should get index" do
    get summary_phases_url
    assert_response :success
  end

  test "should get new" do
    get new_summary_phase_url
    assert_response :success
  end

  test "should create summary_phase" do
    assert_difference('SummaryPhase.count') do
      post summary_phases_url, params: { summary_phase: {  } }
    end

    assert_redirected_to summary_phase_url(SummaryPhase.last)
  end

  test "should show summary_phase" do
    get summary_phase_url(@summary_phase)
    assert_response :success
  end

  test "should get edit" do
    get edit_summary_phase_url(@summary_phase)
    assert_response :success
  end

  test "should update summary_phase" do
    patch summary_phase_url(@summary_phase), params: { summary_phase: {  } }
    assert_redirected_to summary_phase_url(@summary_phase)
  end

  test "should destroy summary_phase" do
    assert_difference('SummaryPhase.count', -1) do
      delete summary_phase_url(@summary_phase)
    end

    assert_redirected_to summary_phases_url
  end
end
