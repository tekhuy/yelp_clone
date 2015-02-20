require 'rails_helper'

feature 'reviewing' do
  
  before {Restaurant.create name: 'KFC'}

  before do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  scenario 'allows users to leave a review using a form' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "so so"
    select '3', from: 'Rating'
    click_button 'Leave Review'

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so so')
  end

  scenario 'does not allow a user to edit a review they did not create' do
    visit '/restaurants'

    expect(page).to have_content('KFC')
    expect(page).not_to have_link('Edit KFC')
  end

  scenario 'that reviews get deleted if the restaurant gets deleted' do
    sign_up('test')
    add_restaurant('KFC')
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "so, so"
    select '3', from: 'Rating'
    click_button 'Leave Review'
    click_link 'Delete KFC'
    expect(Review.all.any?).to be false
  end

  scenario 'users can only leave one review per restaurant' do
    sign_up('test')
    add_restaurant('KFC')
    leave_review('KFC', "so, so", "3")
    click_link 'Review KFC'
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('You can only leave one review per restaurant')
  end

  scenario 'users can see link to delete their own reviews' do
    sign_up('test')
    add_restaurant('KFC')
    leave_review('KFC', "so, so", "3")
    expect(page).to have_link('Delete review')
  end

  scenario 'users can not delete others reviews' do
    sign_up('test')
    add_restaurant('KFC')
    leave_review('KFC', "so, so", "3")
    click_link('Sign out')
    sign_up('bob')
    expect(page).not_to have_link('Delete review')
  end

  scenario 'users can delete their own reviews' do
    sign_up('test')
    add_restaurant('KFC')
    leave_review('KFC', "so, so", "3")
    click_link('Delete review')
    expect(page).not_to have_content("so, so")
    expect(page).to have_content('Review deleted successfully')
  end

end





