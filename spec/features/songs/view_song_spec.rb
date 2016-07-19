require 'rails_helper'

feature 'View individual songs' do
  scenario 'user sees the song title and body' do
    user = FactoryGirl.create(:user)
    song_1 = FactoryGirl.create(:song, user_id: user.id)

    login_user(user)
    visit song_path(song_1)

    expect(page).to have_content(song_1.title)
    expect(page).to have_content(song_1.body) unless song_1.body.nil?
  end
end
