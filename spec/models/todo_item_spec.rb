require 'rails_helper'

describe TodoItem, type: :model do

  let(:uut) { build(:todo_item) }

  it "not done toggles to done" do
    uut.toggle
    expect(uut.done).to be(true)
  end

  it "not done toggles to done" do
    uut.done = true
    uut.toggle
    expect(uut.done).to be(false)
  end
end
