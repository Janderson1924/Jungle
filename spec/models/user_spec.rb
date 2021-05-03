require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'must have valid attributes' do
       params = {
       name:'Justin Anderson',
       email: 'example@me.com',
       password:'password',
       password_confirmation:'password'
       }
       expect(User.new(params)).to be_valid

     end
    it 'must have a password greater than 4 characters' do
       params = {
       name:'Justin Anderson',
       email: 'example@me.com',
       password:'pass',
       password_confirmation:'pass'
       }
       expect(User.new(params)).to_not be_valid
     end
    it 'must have matching password/confirmation fields' do
       params = {
       name:'Justin Anderson',
       email: 'example@me.com',
       password:'pass',
       password_confirmation:'passw'
       }
       expect(User.new(params)).to_not be_valid
     end
  end
end
