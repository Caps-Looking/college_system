require "application_system_test_case"

class AssessmentsTest < ApplicationSystemTestCase
  setup do
    @assessment = assessments(:one)
  end

  test "visiting the index" do
    visit assessments_url
    assert_selector "h1", text: "Assessments"
  end

  test "creating a Assessment" do
    visit assessments_url
    click_on "New Assessment"

    fill_in "Test1", with: @assessment.test1
    fill_in "Test2", with: @assessment.test2
    fill_in "Test3", with: @assessment.test3
    click_on "Create Assessment"

    assert_text "Assessment was successfully created"
    click_on "Back"
  end

  test "updating a Assessment" do
    visit assessments_url
    click_on "Edit", match: :first

    fill_in "Test1", with: @assessment.test1
    fill_in "Test2", with: @assessment.test2
    fill_in "Test3", with: @assessment.test3
    click_on "Update Assessment"

    assert_text "Assessment was successfully updated"
    click_on "Back"
  end

  test "destroying a Assessment" do
    visit assessments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Assessment was successfully destroyed"
  end
end
