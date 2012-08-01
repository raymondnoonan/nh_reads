require 'spec_helper'

describe Label do
  let(:label) { FactoryGirl.create(:label) }
  subject { label }

  describe "attributes and associations" do
  	it { should respond_to(:note) }
  	it { should respond_to(:order) }
  	it { should respond_to(:line_items) }
  end
end
