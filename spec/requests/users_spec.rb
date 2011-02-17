require 'spec_helper'

describe "Users" do
  
  describe "signup" do
    
    describe "failure" do
    
      it "should not make a new user" do
        lambda do
          visit signup_path
          fill_in :name,                       :with => ""
          fill_in :email,                      :with => ""
          fill_in :password,                   :with => ""
          fill_in :user_password_confirmation, :with => ""
          click_button
          response.should render_template('users/new')
          response.should have_selector("div#error_explanation")
        end.should_not change(User, :count)
      end
      
      it "should make a new user" do
        lambda do
          visit signup_path
          fill_in "name",                       :with => "Example User"
          fill_in "email",                      :with => "user@example.com"
          fill_in "password",                   :with => "foobar"
          fill_in "user_password_confirmation", :with => "foobar"
          click_button
          response.should_not have_selector("div#error_explanation")
        end.should change(User, :count).by(1)
      end
    end
  end
end
