require 'rails_helper'

RSpec.describe "commentsratings/index", type: :view do
  before(:each) do
    assign(:commentsratings, [
      Commentsrating.create!(
        no: 2,
        user: nil,
        comment: nil
      ),
      Commentsrating.create!(
        no: 2,
        user: nil,
        comment: nil
      )
    ])
  end

  it "renders a list of commentsratings" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
