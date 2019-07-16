require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
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
  end

  scenario "can add a product to the cart" do
    visit '/'
    product_el = page.find('article.product:first-child')
    product_footer = product_el.find('footer button')
    nav_el = page.find('nav li.cart')

    product_footer.click
    # save_screenshot
    within(nav_el) {expect(page).to have_content('1')} 
  end



end
