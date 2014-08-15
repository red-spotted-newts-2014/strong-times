require 'rails_helper'

#test that password gets hashed


#validates format of email
describe User do
  context "validations" do
    it {should validate_presence_of :email}
    it {should allow_value('alan@gmail.com').for (:email) }
    it {should_not allow_value('alansgmail.com').for (:email) }
    it {should_not allow_value('alan@gmail').for (:email) }
    it {should_not allow_value('@gmail.com').for (:email) }
  end

end

#validates presence of email
describe "when user attempts login without email" do
  before do
    @user_without_email = User.new(password: 'testing')
    @user_without_email.save
  end
    it { @user_without_email.should_not be_valid }
end


#validates uniqueness of email ==> NOT CURRENTLY WORKING
describe "when user attempts login with duplicate email" do
  before do
    @user_with_email = User.create(email: 'alan@gmail.com', password: 'testing')
    @user_with_same_email = User.new(email: 'alan@gmail.com', password: 'resting')
    @user_with_same_email.save
  end
    it { @user_with_same_email.should_not be_valid }
end
