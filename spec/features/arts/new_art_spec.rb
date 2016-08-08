require 'rails_helper'

feature 'Create new art' do
  let(:user) { FactoryGirl.create(:user) }
  let(:song) { FactoryGirl.create(:song) }
  let(:art) { FactoryGirl.build(:art) }

  before do
    login_user(user)
    visit new_song_art_path(song.id)
  end

  scenario 'User creates a new art' do
    attach_file 'art_imgfile', "#{Rails.root}/spec/support/images/birb.jpg"

    click_button 'Save Art'

    expect(page).to have_content('Art saved successfully')
    expect(page).to have_css("img[src*='birb.jpg']")
  end

  scenario 'User submits bad data' do
    click_button 'Save Art'

    expect(page).to have_content('Must choose a file to upload')
  end
end
