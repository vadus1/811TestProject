module DrawAreaHelper
  def click_at(element, x, y)
    native = find(element).native
    page.driver.browser.action.move_to(native, x, y).click.perform
  end

  def draw_a_triangle_on_the_map
    click_at('#map', 100, 100)
    click_at('#map', 150, 100)
    click_at('#map', 100, 150)
    click_at('#map', 100, 100)
  end
end

RSpec.configure do |config|
  config.include DrawAreaHelper, type: :feature
end
