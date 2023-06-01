require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create do |user|
      user.name = 'Abdimulhin Adan'
      user.photo = 'https://images.unsplash.com/photo-1533167649158-6d508895b680?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80'
      user.bio = 'Am a kenyan'
      user.posts_counter = 0
      user.email = 'example@gmail.com'
      user.password = '123df2'
    end
  end

  it 'should be valid' do
    expect(subject).to be_valid
  end

  it 'name should be exist' do
    expect(subject.name).to eql('Abdimulhin Adan')
  end
  it 'posts_counter should be an integer' do
    subject.posts_counter = 'string'
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be an integer' do
    subject.posts_counter = 1
    expect(subject).to be_valid
  end

  it 'posts_counter should be greater than or equal to 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'method recent_posts returns the 3 most recent posts' do
    expect(subject.recent_posts).to eq(subject.posts.order(updated_at: :desc).limit(3))
  end
end
