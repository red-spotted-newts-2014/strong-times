require 'rails_helper'

describe User do
  context "validations" do
    it {should validate_presence_of :email}
  end
  #validates presence of email
  #validates uniqueness of email
  #validates format of email
  #test that password gets hashed

end
