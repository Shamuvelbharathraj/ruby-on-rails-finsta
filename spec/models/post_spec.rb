require 'rails_helper'

RSpec.describe Post, type: :model do
  context Post do
    let(:post) { build :post }
    topic=Topic.create(name:"spec topic 1",description:"spec topic 1 desc",id:1)
    it "check valid presence" do
      expect(post.valid?).to eq(true)
    end
  end
end
