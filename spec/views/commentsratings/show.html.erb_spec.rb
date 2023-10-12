require 'rails_helper'

RSpec.describe "commentsratings/show", type: :view do
  before(:each) do
    assign(:commentsrating, Commentsrating.create!(
      no: 2,
      user: nil,
      comment: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
