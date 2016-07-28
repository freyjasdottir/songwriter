require 'rails_helper'

feature 'Create new quote' do
  let(:user) { FactoryGirl.create(:user) }
  let(:song) { FactoryGirl.create(:song) }
  let(:text) { FactoryGirl.build(:text) }

  before do
    login_user(user)
    visit new_song_text_path(song.id)
  end

  scenario 'User creates a new quote' do
    fill_in('Quote Body', with: text['body'])

    click_button('Save Quote')

    expect(page).to have_content(song['title'])
    expect(page).to have_content(song['body'])
    expect(page).to have_content(text['body'])
    expect(page).to have_content('Quote saved successfully')
  end

end
