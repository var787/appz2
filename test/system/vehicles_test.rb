require "application_system_test_case"

class VehiclesTest < ApplicationSystemTestCase
  setup do
    @vehicle = vehicles(:one)
  end

  test "visiting the index" do
    visit vehicles_url
    assert_selector "h1", text: "Vehicles"
  end

  test "creating a Vehicle" do
    visit vehicles_url
    click_on "New Vehicle"

    fill_in "Acceleration", with: @vehicle.acceleration
    fill_in "Color", with: @vehicle.color
    fill_in "Horsepower", with: @vehicle.horsepower
    fill_in "Make", with: @vehicle.make
    fill_in "Model", with: @vehicle.model
    fill_in "Powertrain", with: @vehicle.powertrain
    fill_in "User", with: @vehicle.user_id
    fill_in "Vehicle type", with: @vehicle.vehicle_type_id
    fill_in "Year", with: @vehicle.year
    click_on "Create Vehicle"

    assert_text "Vehicle was successfully created"
    click_on "Back"
  end

  test "updating a Vehicle" do
    visit vehicles_url
    click_on "Edit", match: :first

    fill_in "Acceleration", with: @vehicle.acceleration
    fill_in "Color", with: @vehicle.color
    fill_in "Horsepower", with: @vehicle.horsepower
    fill_in "Make", with: @vehicle.make
    fill_in "Model", with: @vehicle.model
    fill_in "Powertrain", with: @vehicle.powertrain
    fill_in "User", with: @vehicle.user_id
    fill_in "Vehicle type", with: @vehicle.vehicle_type_id
    fill_in "Year", with: @vehicle.year
    click_on "Update Vehicle"

    assert_text "Vehicle was successfully updated"
    click_on "Back"
  end

  test "destroying a Vehicle" do
    visit vehicles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vehicle was successfully destroyed"
  end
end
