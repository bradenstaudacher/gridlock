require "application_system_test_case"

class RaceResultsTest < ApplicationSystemTestCase
  setup do
    @race_result = race_results(:one)
  end

  test "visiting the index" do
    visit race_results_url
    assert_selector "h1", text: "Race Results"
  end

  test "creating a Race result" do
    visit race_results_url
    click_on "New Race Result"

    fill_in "Driver", with: @race_result.driver_id
    fill_in "Points", with: @race_result.points
    fill_in "Position", with: @race_result.position
    fill_in "Race", with: @race_result.race_id
    click_on "Create Race result"

    assert_text "Race result was successfully created"
    click_on "Back"
  end

  test "updating a Race result" do
    visit race_results_url
    click_on "Edit", match: :first

    fill_in "Driver", with: @race_result.driver_id
    fill_in "Points", with: @race_result.points
    fill_in "Position", with: @race_result.position
    fill_in "Race", with: @race_result.race_id
    click_on "Update Race result"

    assert_text "Race result was successfully updated"
    click_on "Back"
  end

  test "destroying a Race result" do
    visit race_results_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Race result was successfully destroyed"
  end
end
