require 'rails_helper'

describe EventsController do
  
  let(:event) { create(:event) }
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET #new' do
    it 'assigns new event' do
      get :new
      expect(assigns(:event)).to be_a_new(Event)
    end
  end

  describe 'GET #index' do
    let(:events) { create_list(:event, 5) }

    it 'gets the events' do
      get :index
      expect(assigns(:events)).to eq(events)
    end

    it 'gets the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'gets the event' do
      get :show, id: event.id
      expect(assigns(:event)).to eq(event)
    end

    it 'renders the template' do
      get :show, id: event.id
      expect(response).to be_success
    end
  end

  describe 'GET #edit' do
    it 'gets the event' do
      get :edit, id: event.id
      expect(assigns(:event)).to eq(event)
    end

    it 'renders the template' do
      get :edit, id: event.id
      expect(response).to be_success
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a event' do
      delete :destroy, id: event.id
      expect(response).to redirect_to events_path
    end
  end

  describe 'POST #create' do
    let(:event_params) { attributes_for(:event) }

    context 'when save is valid' do
      it 'saves' do
        expect {
          post :create, event: event_params
        }.to change(Event.all, :count).by(1)
      end

      it 'redirects to index' do
        post :create, event: event_params
        expect(response).to redirect_to events_path
      end
    end

    context 'when save is invalid' do
      before { allow_any_instance_of(Event).to receive(:save).and_return(false) }

      it 're-renders the new template' do
        post :create, event: event_params
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PUT #update' do
    let(:update_params) { { name: Faker::Lorem.name, email: Faker::Internet.email } }

    context 'when update is valid' do
      it 'updates' do
        put :update, id: event.id, event: update_params
        expect(event.reload.name).to eq(update_params[:name])
      end

      it 'redirects to the event page' do
        put :update, id: event.id, event: update_params
        expect(response).to redirect_to event_path(event)
      end
    end

    context 'when update is invalid' do
      before { allow_any_instance_of(Event).to receive(:save).and_return(false) }

      it 're-renders the edit template' do
        put :update, id: event.id, event: update_params
        expect(response).to render_template(:edit)
      end
    end
  end
end
