require 'rails_helper'

RSpec.describe 'Post page', :js, type: :feature do
  let!(:user) { create :user }

  scenario 'user creates post' do
    login_as user

    visit new_user_post_url(user_id: user)

    within '.input-form' do
      attach_file Rails.root.join('spec/support/rspecimage.jpg')
      fill_in 'Content', with: "Some text here"
      click_button 'Save Post'
    end

    expect(page).to have_content("Some text here")

  end
end
