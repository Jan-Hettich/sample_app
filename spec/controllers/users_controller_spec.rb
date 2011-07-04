require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end

    it "should have the right title" do
      get 'new'
      response.should have_selector("title", :content =>"Sign up")
    end

  end

  describe "GET 'show'" do
    before(:each) do
      @user = Factory(:user)
    end

    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end

    it "should find the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end

    it "should have the right title" do
      get :show, :id => @user
      response.should have_selector("title", :content => @user.name)
    end

    it "should include the user's name" do
      get "show", :id => @user
      response.should have_selector("h1", :content => @user.name)
    end

    it "should have a profile image" do
      get "show", :id => @user
      response.should have_selector("img", :class => "gravatar")
    end

    it "should show the user's microposts" do
      mp1 = Factory(:micropost, :user => @user, :content => "Foo bar")
      mp2 = Factory(:micropost, :user => @user, :content => "Baz quux")
      get :show, :id => @user
      response.should have_selector("span.content", :content => mp1.content)
      response.should have_selector("span.content", :content => mp2.content)
    end

  end

end
