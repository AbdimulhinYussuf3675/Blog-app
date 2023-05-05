require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.new(name: 'Abdimulhin', photo: 'https://picsum.photos/id/4/5000/3333', bio: 'test user', posts_counter: 0) }
  subject { Post.new(author: user, title: 'testing post', comments_counter: 0, likes_counter: 0) }

  it 'has title' do
    expect(subject.title).to eq('testing post')
  end
  it 'has valid attributs' do
    expect(subject).to be_valid
  end

  it 'has no valid comment_counter that is less than 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'has no valid with like_counter' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'has valid like_count' do
    subject.likes_counter = 1
    expect(subject).to be_valid
  end

  it 'has valid comment_conunt' do
    subject.comments_counter = 1
    expect(subject).to be_valid
  end

  it 'title has a maximum length of 250 characters' do
    expect(subject.title.length).to be <= 250
  end

  it 'method recent_comments returns the 5 most recent comments' do
    expect(subject.recent_comments).to eq(subject.comments.order(updated_at: :desc).limit(5))
  end

  it 'method update_posts_counter increments posts_counter by 1' do
    expect(subject.send(:posts_counter)).to eq(subject.author.increment!(:posts_counter))
  end

  it 'cannot add post without text' do
    post = Post.create(title: 'Hello', author: user)
    expect(post).not_to be_valid
  end

  it 'cannot add Text that is empty' do
    post = Post.create(title: 'Congrats', text: '', author: user)
    expect(post).not_to be_valid
  end

  it 'cannot add title that is more than 250 characters' do
    post = Post.create(title: 'a' * 300, text: 'Text', author: user)
    expect(post).not_to be_valid
  end
end
