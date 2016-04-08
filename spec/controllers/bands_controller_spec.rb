require 'rails_helper'

describe BandsController do
  
  let(:band) { create(:band) }
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET #new' do
    it 'assigns new band' do
      get :new
      expect(assigns(:band)).to be_a_new(Band)
    end
  end

  describe 'GET #index' do
    let(:bands) { create_list(:band, 5) }

    it 'gets the bands' do
      get :index
      expect(assigns(:bands)).to eq(bands)
    end

    it 'gets the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'gets the band' do
      get :show, id: band.id
      expect(assigns(:band)).to eq(band)
    end

    it 'renders the template' do
      get :show, id: band.id
      expect(response).to be_success
    end
  end

  describe 'GET #edit' do
    it 'gets the band' do
      get :edit, id: band.id
      expect(assigns(:band)).to eq(band)
    end

    it 'renders the template' do
      get :edit, id: band.id
      expect(response).to be_success
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a band' do
      delete :destroy, id: band.id
      expect(response).to redirect_to bands_path
    end
  end

  describe 'POST #create' do
    let(:band_params) { attributes_for(:band) }

    context 'when save is valid' do
      it 'saves' do
        expect {
          post :create, band: band_params
        }.to change(Band.all, :count).by(1)
      end

      it 'redirects to index' do
        post :create, band: band_params
        expect(response).to redirect_to bands_path
      end
    end

    context 'when save is invalid' do
      before { allow_any_instance_of(Band).to receive(:save).and_return(false) }

      it 're-renders the new template' do
        post :create, band: band_params
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PUT #update' do
    let(:update_params) { { name: Faker::Lorem.name } }

    context 'when update is valid' do
      it 'updates' do
        put :update, id: band.id, band: update_params
        expect(band.reload.name).to eq(update_params[:name])
      end

      it 'redirects to the band page' do
        put :update, id: band.id, band: update_params
        expect(response).to redirect_to band_path(band)
      end
    end

    context 'when update is invalid' do
      before { allow_any_instance_of(Band).to receive(:save).and_return(false) }

      it 're-renders the edit template' do
        put :update, id: band.id, band: update_params
        expect(response).to render_template(:edit)
      end
    end
  end
end
