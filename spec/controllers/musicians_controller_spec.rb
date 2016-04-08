require 'rails_helper'

describe MusiciansController do
  
  let(:musician) { create(:musician) }
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET #new' do
    it 'assigns new musician' do
      get :new
      expect(assigns(:musician)).to be_a_new(Musician)
    end
  end

  describe 'GET #index' do
    let(:musicians) { create_list(:musician, 5) }

    it 'gets the musicians' do
      get :index
      expect(assigns(:musicians)).to eq(musicians)
    end

    it 'gets the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'gets the musician' do
      get :show, id: musician.id
      expect(assigns(:musician)).to eq(musician)
    end

    it 'renders the template' do
      get :show, id: musician.id
      expect(response).to be_success
    end
  end

  describe 'GET #edit' do
    it 'gets the musician' do
      get :edit, id: musician.id
      expect(assigns(:musician)).to eq(musician)
    end

    it 'renders the template' do
      get :edit, id: musician.id
      expect(response).to be_success
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a musician' do
      delete :destroy, id: musician.id
      expect(response).to redirect_to musicians_path
    end
  end

  describe 'POST #create' do
    let(:musician_params) { attributes_for(:musician) }

    context 'when save is valid' do
      it 'saves' do
        expect {
          post :create, musician: musician_params
        }.to change(Musician.all, :count).by(1)
      end

      it 'redirects to index' do
        post :create, musician: musician_params
        expect(response).to redirect_to musicians_path
      end
    end

    context 'when save is invalid' do
      before { allow_any_instance_of(Musician).to receive(:save).and_return(false) }

      it 're-renders the new template' do
        post :create, musician: musician_params
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PUT #update' do
    let(:update_params) { { name: Faker::Lorem.name } }

    context 'when update is valid' do
      it 'updates' do
        put :update, id: musician.id, musician: update_params
        expect(musician.reload.name).to eq(update_params[:name])
      end

      it 'redirects to the musician page' do
        put :update, id: musician.id, musician: update_params
        expect(response).to redirect_to musician_path(musician)
      end
    end

    context 'when update is invalid' do
      before { allow_any_instance_of(Musician).to receive(:save).and_return(false) }

      it 're-renders the edit template' do
        put :update, id: musician.id, musician: update_params
        expect(response).to render_template(:edit)
      end
    end
  end
end
