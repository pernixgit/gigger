require 'rails_helper'

describe ClientsController do
  
  let(:client) { create(:client) }
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET #new' do
    it 'assigns new client' do
      get :new
      expect(assigns(:client)).to be_a_new(Client)
    end
  end

  describe 'GET #index' do
    let(:clients) { create_list(:client, 5) }

    it 'gets the clients' do
      get :index
      expect(assigns(:clients)).to eq(clients)
    end

    it 'gets the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'gets the client' do
      get :show, id: client.id
      expect(assigns(:client)).to eq(client)
    end

    it 'renders the template' do
      get :show, id: client.id
      expect(response).to be_success
    end
  end

  describe 'GET #edit' do
    it 'gets the client' do
      get :edit, id: client.id
      expect(assigns(:client)).to eq(client)
    end

    it 'renders the template' do
      get :edit, id: client.id
      expect(response).to be_success
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a client' do
      delete :destroy, id: client.id
      expect(response).to redirect_to clients_path
    end
  end

  describe 'POST #create' do
    let(:client_params) { attributes_for(:client) }

    context 'when save is valid' do
      it 'saves' do
        expect {
          post :create, client: client_params
        }.to change(Client.all, :count).by(1)
      end

      it 'redirects to index' do
        post :create, client: client_params
        expect(response).to redirect_to clients_path
      end
    end

    context 'when save is invalid' do
      before { allow_any_instance_of(Client).to receive(:save).and_return(false) }

      it 're-renders the new template' do
        post :create, client: client_params
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PUT #update' do
    let(:update_params) { { name: Faker::Lorem.name } }

    context 'when update is valid' do
      it 'updates' do
        put :update, id: client.id, client: update_params
        expect(client.reload.name).to eq(update_params[:name])
      end

      it 'redirects to the client page' do
        put :update, id: client.id, client: update_params
        expect(response).to redirect_to client_path(client)
      end
    end

    context 'when update is invalid' do
      before { allow_any_instance_of(Client).to receive(:save).and_return(false) }

      it 're-renders the edit template' do
        put :update, id: client.id, client: update_params
        expect(response).to render_template(:edit)
      end
    end
  end
end
