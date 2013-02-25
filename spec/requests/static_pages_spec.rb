require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Main_App'" do
      visit '/static_pages/home'
      page.should have_content('Main_App')
    end

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('title',
                        :text => "Main_App | Home")
    end
  end

  describe "Help page" do

    it "should have the content 'FAQ'" do
      visit '/static_pages/help'
      page.should have_content('FAQ')
    end

    it "should have the title 'FAQ'" do
      visit '/static_pages/help'
      page.should have_selector('title',
                        :text => "Main_App | FAQ")
    end
  end

  describe "About page" do

    it "should have the h1 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'About Us')
    end

    it "should have the title 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('title',
                    :text => "Main_App | About Us")
    end
  end
end