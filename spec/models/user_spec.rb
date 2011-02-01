require 'spec_helper'

describe User do
<<<<<<< HEAD
  pending "add some examples to (or delete) #{__FILE__}"
end
=======
  
  before(:each) do
    @attr = { :name => "Example User", :email => "user@example.com" }
  end
  
  it "should create an instance given valid attributes" do
    User.create!(@attr)
  end
  
  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end
end
>>>>>>> modeling-users
