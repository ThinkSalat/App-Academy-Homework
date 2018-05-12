# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email           :string           not null
#  session_token   :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    FactoryBot.build(:user,
    email: "jonathan@fakesite.com",
    password: "good_password")
  end
  # user = User.new(email:'email',password: 'password')

  describe 'Validations' do

    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password), minimum: 6, allow_nil: true}

    it "creates a password digest when a password is given" do
      expect(user.password_digest).to_not be_nil
    end

    it "creates a session token before validation" do
      user.valid?
      expect(user.session_token).to_not be_nil
    end
  end

  describe 'Methods' do

    describe '#is_password?' do
      it 'should return false if password doesn\'t match' do
        expect(user.is_password?('not password')).to be false
      end
      it 'should return true if password does match' do
        expect(user.is_password?('good_password')).to be true
      end
    end

    describe '#reset_session_token!' do
      before(:each) do
        @old = user.session_token
        user.reset_session_token!
      end
      it 'Users session token should not be same as before' do
        expect(user.session_token).not_to eq(@old)
      end
      it 'should return a session token' do
        returned_token = user.reset_session_token!
        expect(returned_token).to_not be_empty
      end
      it 'should return the same session token that is in the user\' database records' do
        returned_token = user.reset_session_token!
        expect(returned_token).to eq(user.session_token)
      end
    end
    describe '::find_by_credentials' do

    end
  end

  describe ".find_by_credentials" do
    before { user.save! }

    it "returns user given good credentials" do
      expect(User.find_by_credentials("jonathan@fakesite.com", "good_password")).to eq(user)
    end

    it "returns nil given bad credentials" do
      expect(User.find_by_credentials("jonathan@fakesite.com", "bad_password")).to eq(nil)
    end
  end
end
