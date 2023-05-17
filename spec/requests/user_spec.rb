require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :request do
  describe 'POST #create' do
    let(:referring_user) { User.create(balance: 0) }

    context 'with a valid unique_id' do
      it 'updates the referring user balance' do
        post :create, params: { unique_id: referring_user.unique_id }

        referring_user.reload
        expect(referring_user.balance).to eq(200)
      end
    end

    context 'without a unique_id' do
      it 'does not update any user balance' do
        post :create

        referring_user.reload
        expect(referring_user.balance).to eq(0)
      end
    end
  end
end
