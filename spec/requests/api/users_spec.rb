require 'rails_helper'

describe 'GET /users' do
  it 'returns a successful response' do
    get '/users'

    expect(response).to be_successful
    # expect(response.body).to include('<h2>Here is a list of all users</h2>')
    expect(response).to render_template(:index)
  end
end

describe 'GET /users/:id' do
  it 'returns a successful response' do
    user = User.create!(name: 'Test User', posts_counter: 0)
    get "/users/#{user.id}"

    expect(response).to be_successful
    # expect(response.body).to include('<h2>Here is a user</h2>')
    expect(response).to render_template(:show)
  end
end
