require 'rails_helper'

describe 'User post index page', type: :feature do
  before :each do
    @user = User.create(id: 1, name: 'user1', photo: 'photo.png', bio: 'This is my bio', posts_counter: 0)

    @post1 = Post.create(title: 'title1', text: 'post1', likes_counter: 0, comments_counter: 0, author: @user)
    @post2 = Post.create(title: 'title2', text: 'post2', likes_counter: 0, comments_counter: 0, author: @user)
    @post3 = Post.create(title: 'title3', text: 'post3', likes_counter: 0, comments_counter: 0, author: @user)

    @comment1 = Comment.create(text: 'comment1', author: User.first, post: Post.first)
    @comment2 = Comment.create(text: 'comment2', author: User.first, post: Post.first)
    @comment3 = Comment.create(text: 'comment3', author: User.first, post: Post.first)

    visit(user_posts_path(@user.id))
  end

  it "shows user's profile picture" do
    all('img').each do |i|
      expect(i[:src]).to eq('photo.png')
    end
  end

  it 'shows the users username' do
    expect(page).to have_content('user1')
  end

  it 'shows number of posts of user has written' do
    post = Post.all
    expect(post.size).to eql(@user.posts_counter)
  end

  it 'I can see a post\'s title.' do
    expect(page).to have_content('title1')
  end

  it 'can see some of the post detail' do
    expect(page).to have_content 'post1'
  end

  it 'can see the first comment on a post' do
    expect(@comment1.text).to eql('comment1')
  end

  it 'can see how many comments a post has.' do
    post = Post.first
    expect(page).to have_content(post.comments_counter)
  end

  it 'can see how many likes a post has.' do
    post = Post.first
    expect(page).to have_content(post.likes_counter)
  end

  it 'shows a section for pagination if there are more posts than fit on the view' do
    expect(page).to have_content 'Pagination'
  end

  it "redirects the user to the post's show page after clicking on it" do
    click_link 'title1'
    expect(page).to have_current_path user_post_path(@post1.author_id, @post1)
  end
end
