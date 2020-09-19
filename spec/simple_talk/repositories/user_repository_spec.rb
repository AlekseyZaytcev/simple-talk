# frozen_string_literal: true

RSpec.describe UserRepository, type: :repository do
  describe '#by_email' do
    subject(:query) { described_class.new.by_email(target_email) }

    let(:email) { Faker::Internet.email }
    let!(:user) { create(:user, email: email) }

    context 'when user with email exists' do
      let(:target_email) { email }

      it 'returns found user' do
        expect(query).to eq(user)
      end
    end

    context 'when user with email not exists' do
      let(:target_email) { 'not_existing@email.com' }

      it { expect(query).to be_nil }
    end
  end
end
