require 'rails_helper'

RSpec.describe CheckPointComment, type: :model do
  before do
    create(:road)
    create(:user)
    create(:check_point)
  end

  it "コメントができる" do
    comment = CheckPointComment.new(
      user_id: 1,
      road_id: 1,
      check_point_id: 1,
      body: "ここはよく来てます"
    )
    expect(comment).to be_valid
  end

  it "コメントが空の場合、無効である" do
    comment = CheckPointComment.new(
      user_id: 1,
      road_id: 1,
      check_point_id: 1,
      body: ""
    )
    comment.valid?
    expect(comment.errors[:body]).to include("コメントを入力してください。")
  end
end
