require 'rails_helper'

feature 'User creates location' do
  scenario 'with correct params', js: true do
    location_name = 'Test name'

    visit new_location_path

    draw_a_triangle_on_the_map

    find('#location_name').set(location_name)
    find('.btn[value="Create Location"]').click
  end

  scenario 'without entering a name', js: true do
    visit new_location_path

    draw_a_triangle_on_the_map

    find('.btn[value="Create Location"]').click

    within '.location_name.has-error' do
      find('.help-block', text: 'can\'t be blank')
    end
  end

  scenario 'without drawing an area on the map' do
    visit new_location_path

    find('#location_name').set('Test')
    find('.btn[value="Create Location"]').click
  end
end
