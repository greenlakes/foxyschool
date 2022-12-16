require 'rails_helper'

RSpec.describe "questions/edit", type: :view do
  let(:question) {
    Question.create!(
      body: "MyText",
      answer: "MyString",
      subject: nil
    )
  }

  before(:each) do
    assign(:question, question)
  end

  it "renders the edit question form" do
    render

    assert_select "form[action=?][method=?]", question_path(question), "post" do

      assert_select "textarea[name=?]", "question[body]"

      assert_select "input[name=?]", "question[answer]"

      assert_select "input[name=?]", "question[subject_id]"
    end
  end
end
