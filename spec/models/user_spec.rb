require 'spec_helper'

describe User do

  before(:each) do
    @attr = {
      :name => "Example User",
      :email => "user@example.com"
    }
  end

   describe "microposts associations" do

    before(:each) do
      @user = User.create(@attr)
      @mp1 = Factory(:micropost, :user => @user, :created_at => 1.day.ago)
      @mp2 = Factory(:micropost, :user => @user, :created_at => 1.hour.ago)
    end

    it "should have a microposts attribute" do
      @user.should respond_to(:microposts)
    end

    it "should have the right microposts in the right order" do
      @user.microposts.should == [@mp2, @mp1]
    end

     it "should destroy the associated microposts (v1)" do
       @user.destroy
       [@mp1, @mp2].each do |micropost|
        Micropost.find_by_id(micropost.id).should be_nil
       end
     end

    it "should destroy the associated microposts (v2)" do
      @user.destroy
      [@mp1, @mp2].each do |micropost|
        lambda do
          Micropost.find(micropost.id)
        end.should raise_error(ActiveRecord::RecordNotFound)
      end
    end

  end

end
