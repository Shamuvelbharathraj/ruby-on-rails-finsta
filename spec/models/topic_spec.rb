require 'rails_helper'

RSpec.describe Topic, type: :model do
  context "topic field presents" do
    let(:topic) { build :topic}
    
    it "check valid" do 
      expect(topic.valid?).to eq(true)
    end
  end
end
