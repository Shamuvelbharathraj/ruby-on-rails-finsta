require 'rails_helper'

RSpec.describe "commentsratings/new", type: :view do
  before(:each) do
    assign(:commentsrating, Commentsrating.new(
      no: 1,
      user: nil,
      comment: nil
    ))
  end

  it "renders new commentsrating form" do
    render

    assert_select "form[action=?][method=?]", commentsratings_path, "post" do

      assert_select "input[name=?]", "commentsrating[no]"

      assert_select "input[name=?]", "commentsrating[user_id]"

      assert_select "input[name=?]", "commentsrating[comment_id]"
    end
  end
end
