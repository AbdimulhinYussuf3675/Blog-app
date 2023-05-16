require 'rails_helper'

describe "User index page", type: :feature do
  before :each do
    @user1 = User.create(id:1, name: 'user1', photo: 'photo.png', bio: 'this is my bio', posts_counter: 0)
    @user2 = User.create(id:2, name: 'user2', photo: 'photo.png', bio: 'this is my bio', posts_counter: 0)
    @user3 = User.create(id:3, name: 'user3', photo: 'photo.png', bio: 'this is my bio', posts_counter: 0)
    visit root_path
  end

  it 'can see other users username.' do
    expect(page).to have_content 'user1'
    expect(page).to have_content 'user2'
    expect(page).to have_content 'user3'

    expect(page).to have_selector('.user-name', count: 3)
  end

  it 'I can see the profile picture for each user.' do
    expect(page).to have_selector('.user-img', count:3)
  end

  it 'I can see the number of posts of all other users.' do
    expect(page).to have_content('Number of posts: ',)
    expect(page).to have_content('Number of posts: ',)

    expect(page).to have_selector('.user-post-count', count:3)
  end

  it 'When I click on a user, I am redirected to that user\'s show page' do
    click_on 'user1'
    expect(page).to have_current_path user_path(@user1)
  end


end

