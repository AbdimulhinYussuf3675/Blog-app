require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.new(name: 'Khusniddin Ismoilov', photo: 'https://picsum.photos/400', bio: 'I am a full-stack software engineer.') }
  subject { Post.new(title: 'Congrats', text: 'Congratulations', author: user) }
  before { subject.save }

  it 'has title' do
    expect(subject.title).to eq('Congrats')
  end

  it 'has text' do
    expect(subject.text).to eq('Congratulations')
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
