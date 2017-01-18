require 'rails_helper'

feature 'User edits location' do
  let!(:location) do
    create(
      :location,
      area: 'POLYGON((74.86788912917916 -91.58203125, 74.86788912917916 -74.00390625, 69.53451763078358 -91.58203125))'
    )
  end

  scenario 'by changing polygon on the map', js: true do
    previous_location_area = location.area

    visit edit_location_path(location)

    native = find('#map').native
    page.driver.browser.action.move_to(native, 100, 125).click_and_hold.perform
    page.driver.browser.action.move_to(native, 50, 125).click.perform

    find('.btn[value="Update Location"]').click

    within('.js-coordinates-table') do
      within('tbody') do
        expect(page).to have_selector('tr', count: 5)
      end
    end
    expect(location.reload.area).not_to eq(previous_location_area)
  end
end
