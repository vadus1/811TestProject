require 'rails_helper'

describe LocationsController do
  render_views

  describe 'GET index' do
    let!(:location) { create(:location) }

    it 'assigns @locations' do
      get :index
      expect(assigns(:locations)).to eq([location])
    end

    it 'renders the index template' do
      get :index

      expect(response).to render_template(:index)
      expect(response).to render_template(:_map)
    end
  end

  describe 'GET new' do
    it 'assigns new @location' do
      get :new
      expect(assigns(:location)).to be_a_new(Location)
    end

    it 'renders the new template' do
      get :new

      expect(response).to render_template(:new)
      expect(response).to render_template(:_map)
    end
  end

  describe 'POST create' do
    context 'with valid attributes' do
      it 'creates a new location' do
        expect do
          post :create, location: attributes_for(:location)
        end.to change(Location, :count).by(1)
      end

      it 'redirects to the index page' do
        post :create, location: attributes_for(:location)

        expect(flash[:success]).to eq('Location was successfully created')
        expect(response).to redirect_to locations_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new location, assigns flash error message and then renders the new template' do
        expect do
          post :create, location: attributes_for(:location).merge(area: nil)

          expect(flash[:error]).to eq 'Please draw an area on the map'
          expect(response).to render_template(:new)
        end.to change(Location, :count).by 0
      end
    end
  end

  describe 'GET show' do
    let!(:location) { create(:location) }

    it 'assigns @location' do
      get :show, id: location.id
      expect(assigns(:location)).to eq(location)
    end

    it 'renders the show template' do
      get :show, id: location.id

      expect(response).to render_template(:show)
      expect(response).to render_template(:_map)
    end
  end

  describe 'GET edit' do
    let!(:location) { create(:location) }

    it 'assigns @location' do
      get :edit, id: location.id
      expect(assigns(:location)).to eq(location)
    end

    it 'renders the edit template' do
      get :edit, id: location.id

      expect(response).to render_template(:edit)
      expect(response).to render_template(:_map)
    end
  end

  describe 'PUT update' do
    let!(:location) { create(:location) }

    context 'with valid attributes' do
      it 'updates @location' do
        new_name = 'New Name'

        put :update, id: location.id, location: { name: new_name }

        expect(location.reload.name).to eq(new_name)
      end

      it 'redirects to the show page' do
        put :update, id: location.id, location: { name: 'New Name' }

        expect(flash[:success]).to eq('Location was successfully updated')
        expect(response).to redirect_to action: :show, id: location.id
      end
    end

    context 'with invalid attributes' do
      it 'does not update @location and renders the edit template' do
        put :update, id: location.id, location: { name: '' }

        expect(location.reload.name).not_to eq('')

        expect(response).to render_template(:edit)
        expect(response).to render_template(:_map)
      end
    end
  end
end
