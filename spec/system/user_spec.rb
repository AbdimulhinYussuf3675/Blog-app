require 'rails_helper'

describe 'User index page', type: :feature do
  before :each do
    @user1 = User.create(id: 1, name: 'user1', photo: 'photo.png', bio: 'this is my bio', posts_counter: 0)
    @user2 = User.create(id: 2, name: 'user2', photo: 'photo.png', bio: 'this is my bio', posts_counter: 0)
    @user3 = User.create(id: 3, name: 'user3', photo: 'photo.png', bio: 'this is my bio', posts_counter: 0)
    visit root_path
  end

  it 'can see other users username.' do
    expect(page).to have_content 'user1'
    expect(page).to have_content 'user2'
    expect(page).to have_content 'user3'

    expect(page).to have_selector('.user-name', count: 3)
  end

  it 'I can see the profile picture for each user.' do
    expect(page).to have_selector('.user-img', count: 3)
  end

  it 'I can see the number of posts of all other users.' do
    expect(page).to have_content('Number of posts: ')
    expect(page).to have_content('Number of posts: ')

    expect(page).to have_selector('.user-post-count', count: 3)
  end

  it 'When I click on a user, I am redirected to that user\'s show page' do
    click_on 'user1'
    expect(page).to have_current_path user_path(@user1)
  end
end

describe 'User show page, only test user', type: :feature do
  before :each do
    @user1 = User.create(id: 1, name: 'user1', photo: 'photo.png', bio: 'this is my bio', posts_counter: 0)

    visit user_path(@user1)
  end

  it 'I can see the user\'s profile picture.' do
    expect(page).to have_css('.user-img')
  end

  it 'I can see the user\'s username.' do
    expect(page).to have_content(@user1['name'], count: 1)
  end

  it 'I can see the number of posts the user has written.' do
    expect(page).to have_content("Number of posts: #{@user1['posts_counter']}")
  end

  it 'I can see the user\'s bio.' do
    expect(page).to have_content(@user1['bio'])
  end
end

describe 'User show page', type: :feature do
  before :each do
    @user1 = User.create(id: 1, name: 'user1', photo: 'photo.png', bio: 'this is my bio', posts_counter: 0)
    @post1 = @user1.posts.create(id: 1, title: 'post1', text: 'this is my text1', comments_counter: 0,
                                 likes_counter: 0, author: @user1)
    @post2 = @user1.posts.create(id: 2, title: 'post2', text: 'this is my text2', comments_counter: 0,
                                 likes_counter: 0, author: @user1)
    @post3 = @user1.posts.create(id: 3, title: 'post3', text: 'this is my text3', comments_counter: 0,
                                 likes_counter: 0, author: @user1)
    @post4 = @user1.posts.create(id: 4, title: 'post4', text: 'this is my text4', comments_counter: 0,
                                 likes_counter: 0, author: @user1)
    @comment1 = @post1.comments.create(id: 1, text: 'this is my text', author: @user1)

    visit user_path(@user1)
  end
  it 'I can see the user\'s first 3 posts.' do
    expect(page).to have_selector('.user-post-title', count: 3)
  end

  it 'I can see a button that lets me view all of a user\'s posts.' do
    expect(page).to have_link('See all posts')
  end

  it 'When I click a user\'s post, it redirects me to that post\'s show page.' do
    page.first(".text#{@post2.id}").click
    expect(page).to have_current_path user_post_path(@user1, @post2)
  end

  it 'When I click to see all posts, it redirects me to the user\'s post\'s index page.' do
    click_on 'See all posts'
    expect(page).to have_current_path user_posts_path(@user1)
  end
end
