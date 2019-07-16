require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

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

  scenario "can look at a particular product" do
    visit '/'
    product_el = page.find('article.product:first-child')
    product_header = product_el.find('header h4')
    product_header.click

    expect(page).to have_css('section.products-show')
    save_screenshot
  end
end
