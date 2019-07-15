require 'rails_helper'

RSpec.describe User, type: :model do
    subject{ User.new(
      name:'Asuka',
      email: 'hello@gmail.com',
      password: 'pass123',
      password_confirmation: 'pass123'
    )}
  
  describe 'Validations' do
    it "should be the same password " do
      subject.password_confirmation = 'pass124'
      expect(subject.password).not_to eq(subject.password_confirmation)
    end

    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }

    it "should have at least length of 5" do
      should validate_length_of(:password).
        is_at_least(5).
        on(:create)
    end
  end

  describe '.authenticate_with_credentials' do
    subject do
      User.create(
        name:'Asuka',
        email: 'hello@gmail.com',
        password: 'pass123',
        password_confirmation: 'pass123'
      )
    end

    before(:each) do
      subject
    end

    it "should return the user when valid" do
      expect(User.authenticate_with_credentials('hello@gmail.com', 'pass123')).to eq(subject)
    end

    it "should verify email with leading and trailing spaces" do
      expect(User.authenticate_with_credentials(' hello@gmail.com ', 'pass123')).to eq(subject)
    end

    it "should verify email with wrong cases" do
      expect(User.authenticate_with_credentials('Hello@GmaiL.com', 'pass123')).to eq(subject)
    end
    it { should have_secure_password }
  end

end
