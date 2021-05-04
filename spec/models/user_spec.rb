require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    xit 'must have valid attributes' do
       params = {
       name:'Justin Anderson',
       email: 'example@me.com',
       password:'password',
       password_confirmation:'password'
       }
       expect(User.new(params)).to be_valid
     end
    xit 'must have a password greater than 4 characters' do
       params = {
       name:'Justin Anderson',
       email: 'example@me.com',
       password:'pass',
       password_confirmation:'pass'
       }
       expect(User.new(params)).to_not be_valid
     end
    xit 'must have matching password/confirmation fields' do
       params = {
       name:'Justin Anderson',
       email: 'example@me.com',
       password:'pass',
       password_confirmation:'passw'
       }
       expect(User.new(params)).to_not be_valid
     end
    end
    describe '.authenticate_with_credentials' do
     xit "checks the login and returns the authenticated user" do
      user = User.create(name: "Justin Anderson", :email => "justinanderson101@gmail.com", :password => "password", :password_confirmation => "password")
      authenticated_user = User.authenticate_with_credentials("justinanderson101@gmail.com", "password")
      expect(authenticated_user).to eq(user)
     end
    end
  end