require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  context 'GET index' do
    before(:example) do
      get '/users/5/posts'
    end

    it 'should be 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render a correct template' do
      expect(response).to render_template(:index)
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Post List')
    end
  end

  context 'GET show' do
    before(:example) do
      get '/users/5/posts/13'
    end

    it 'returns a 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      expect(response).to render_template('show')
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Show Post Details')
    end
  end
end
