require 'rails_helper'

feature 'Create new song' do
  let(:user) { FactoryGirl.create(:user) }
  let(:song) { FactoryGirl.create(:song) }

  before do
    login_user(user)
    visit new_song_path
  end

  scenario 'User creates new song with a body' do
    fill_in('Title', with: song['title'])
    fill_in('Body', with: song['body'])

    click_button('Save Song')

    expect(page).to have_content(song['title'])
    expect(page).to have_content(song['body'])
    expect(page).to have_content('Song saved successfully')
  end

  scenario 'User submits bad data' do
    fill_in('Title', with: '')

    click_button('Save Song')

  expect(page).to have_content('Problems saving song')
  end
end
