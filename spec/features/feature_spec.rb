require 'rails_helper'

RSpec.feature 'Integrations', type: :feature do
  before :each do
    user = User.create!(name: 'Foo', website: 'https://www.foobar.com')
    user2 = User.create!(name: 'Bar', website: 'https://www.bar.com')
    user3 = User.create!(name: 'Jam', website: 'https://www.foo.com')
    friendship = Friendship.create!(sent_to_id: user2.id, sent_by_id: user.id, status: false)

    visit login_path
    expect(page.current_path).to eq '/login'
    page.fill_in 'Name', with: 'Foo'
    
    click_button 'Log in'
    expect(page.current_path).to eq "/users/#{user.id}"
    click_on 'All users'
    expect(page.current_path).to eq '/users'
  end

  scenario 'Create a Friend Request' do
    have_button 'Add friend'
    click_on 'Add friend'
    expect(page).to have_text 'Friend Request Sent!'
  end

end
