require 'rails_helper'
RSpec.describe Comment, type: :model do
  subject { Comment.new(text: 'hello man') }
  before { subject.save }
  it 'comments should be not be Valid' do
    subject.text = nil
    expect(subject).to_not be_valid
  end
  it 'Post comments counter to increment' do
    subject.post = Post.new(title: 'Post One', text: 'This is the post one', comments_counter: 0)
    subject.send(:comments_counter)
    expect(subject.post.comments_counter).to be(1)
  end
end
