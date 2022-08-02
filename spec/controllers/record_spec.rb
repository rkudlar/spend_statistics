require 'rails_helper'
require 'pry'

RSpec.describe RecordsController, type: :controller do
  describe 'when user not logged' do
    it {
      get :index
      is_expected.to redirect_to('/users/sign_in')
    }
  end

  describe 'when user logged' do
    before do
      sign_in user
    end

    let(:user) { create :user }

    context '#index' do
      let(:record) { create :record, user_id: user.id }
      it {
        get :index
        expect(assigns(:records)).to eq(user.records)
      }
    end

    context '#new' do
      before do
        get :new
      end

      it { expect(assigns[:record]).to be_instance_of(Record) }
      it { is_expected.to render_template(:new) }
    end

    context '#edit' do
      before do
        get :edit, params: params
      end

      let(:record) { create :record, user_id: user.id }
      let(:params) { { id: record.id } }

      it { expect(assigns[:record]).to eq(Record.find_by(id: params[:id])) }
      it { is_expected.to render_template(:edit) }
    end

    context '#create' do
      before do
        post :create, params: params
      end

      let(:params) do
        { record: { cost: 110.5, date: Date.today, user_id: user.id, category_id: 1 } }
      end

      it { expect(assigns[:record]).to be_instance_of(Record) }
      it { expect(assigns[:record].cost).to eq(110.5) }
    end

    context '#update' do
      before do
        patch :update, params: params
      end

      let(:record) { create :record, user_id: user.id }
      let(:params) { { id: record.id, record: { cost: 75.99 } } }

      it { expect(record.reload.cost).to eq(75.99) }
      it { is_expected.to redirect_to(root_path) }
    end

    context '#destroy' do
      let(:record) { create :record, user_id: user.id }
      let!(:params) { { id: record.id } }
      it { expect { delete :destroy, params: params }.to change(Record, :count).by(-1) }
    end

    context '#delete_records' do
      let(:record) { create :record, user_id: user.id }
      let!(:params) { { user_id: user.id } }
      it {
        get :delete_records, params: params
      }
    end
  end
end
