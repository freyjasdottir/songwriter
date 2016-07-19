require 'rails_helper'

feature 'User can see list of their songs' do
  scenario 'visits song index' do
    user = FactoryGirl.create(:user)
    song_1 = FactoryGirl.create(:song, user_id: user.id)
    song_2 = FactoryGirl.create(:song, user_id: user.id)

    login_user(user)
    visit songs_path

    expect(page).to have_content(song_1.title)
    expect(page).to have_content(song_2.title)
  end

  scenario "user does not see songs that aren't theirs" do
    user = FactoryGirl.create(:user)
    song_1 = FactoryGirl.create(:song, user_id: user.id)
    song_2 = FactoryGirl.create(:song, user_id: (user.id - 1))

    login_user(user)
    visit songs_path

    expect(page).to have_content(song_1.title)
    expect(page).to_not have_content(song_2.title)
  end
end
