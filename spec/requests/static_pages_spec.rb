require 'spec_helper'

describe "Static pages" do
	subject { page }
	shared_examples_for "all static pages" do
		it { should have_selector('h1', text: heading) }
		it { should have_selector('title', text: title) }
	end

	describe "Home page" do
		before { visit root_path }
		let(:heading) { 'Welcome to the New Haven Reads Book Center' }
		let(:title)   { 'Home' }

		it_should_behave_like "all static pages"
	end

	describe "About page" do
		before { visit about_path }
		let(:heading) { "About us" }
		let(:title) { "About" }

		it_should_behave_like "all static pages"
	end

#	describe "Help page" do
#		before { visit help_path }
#		let(:heading) { "Frequently Asked Questions" }
#		let(:title) { "Help and FAQ" }
#
#		it_should_behave_like "all static pages"
#	end
end
