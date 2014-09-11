require_relative '../feature_spec_helper'

describe 'admin', type: :feature do
  include AdminHelper

  before { login_as_admin }

  xit 'changes an item from endangered to extinct' do
    item = Item.create(title: "hi", description: "mom", price: 10)
    category = Category.create(name: "Dinner")
    item.categories.create(name: "Lunch")

    visit admin_item_path(item)

    within ".scarcity" do
      expect(page).to have_content("Endangered")
    end

    click_link 'Trigger Extinction Event'

    within ".scarcity" do
      expect(page).to have_content("Extinct")
    end
  end
end
