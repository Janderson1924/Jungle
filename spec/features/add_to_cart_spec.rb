require 'rails_helper'

RSpec.feature "My Cart increases by 1 when product added", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
    visit root_path
  end

  xscenario "Visit the homepage, click product, cart goes up by 1" do
    # DEBUG
    save_screenshot 'before_click.png'

    click_on("Add", match: :first)
    sleep 1
    # VERIFY
    expect(page).to have_text 'My Cart (1)'

    save_screenshot 'after-click.png'

  end
end