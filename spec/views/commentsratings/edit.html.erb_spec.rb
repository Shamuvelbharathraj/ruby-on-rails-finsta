require 'rails_helper'

RSpec.describe "commentsratings/edit", type: :view do
  let(:commentsrating) {
    Commentsrating.create!(
      no: 1,
      user: nil,
      comment: nil
    )
  }

  before(:each) do
    assign(:commentsrating, commentsrating)
  end

  it "renders the edit commentsrating form" do
    render

    assert_select "form[action=?][method=?]", commentsrating_path(commentsrating), "post" do

      assert_select "input[name=?]", "commentsrating[no]"

      assert_select "input[name=?]", "commentsrating[user_id]"

      assert_select "input[name=?]", "commentsrating[comment_id]"
    end
  end
end
