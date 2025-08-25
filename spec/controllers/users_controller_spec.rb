require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:role) { Role.create!(name: 'admin') }
  let(:user) do
    User.create!(name: 'John Doe', email: 'john@example.com', password: 'Testing13#',
                 password_confirmation: 'Testing13#')
  end
  let(:other_user) do
    User.create!(name: 'Jane Doe', email: 'jane@example.com', password: 'Testing13#',
                 password_confirmation: 'Testing13#')
  end

  before do
    sign_in user
  end

  describe 'GET index' do
    it 'renders the index page with users' do
      get :index
      expect(response).to have_http_status(:ok)
      expect(assigns(:user)).to include(user)
    end
  end

  describe 'GET show' do
    it 'shows the user profile' do
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:ok)
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'GET edit' do
    it 'renders the edit form with roles' do
      role
      get :edit, params: { id: user.id }
      expect(response).to have_http_status(:ok)
      expect(assigns(:roles)).to include(role)
    end
  end

  describe 'PATCH update' do
    context 'with valid params' do
      it 'updates the user and redirects' do
        patch :update, params: { id: user.id, user: { name: 'Updated Name' } }
        expect(response).to redirect_to(user)
        user.reload
        expect(user.name).to eq('Updated Name')
      end
    end

    context 'with invalid params' do
      it 're-renders the edit form' do
        patch :update, params: { id: user.id, user: { email: '' } }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE destroy' do
    it 'deletes the user and redirects' do
      delete :destroy, params: { id: other_user.id }
      expect(response).to redirect_to(users_path)
    end
  end
end
