require 'rails_helper'

describe List, type: :model do
  let(:list) { build :list }
  let(:user) { build :user }
  let(:user_list) { build :user_list }

  it 'Shows false, when no owner' do
    user_lists = nil
    allow(list.user_lists).to receive(:where)
      .with(user_id: user.id, owner: true)
      .and_return(user_lists)

    is_owner = list.owner?(user)
    expect(is_owner).to be(false)
  end

  it 'Shows true, when correct owner' do
    user_lists = build(:user_list, user_id: user.id, owner: true)
    allow(list.user_lists).to receive(:where)
      .with(user_id: user.id, owner: true)
      .and_return(user_lists)

    is_owner = list.owner?(user)
    expect(is_owner).to be(true)
  end

  it 'Adds participant' do
    user.id = 1
    expect(list.user_lists).to receive(:create).with(user_id: 1, owner: false)
      .and_return(user_list)
    list.add_user(user)
  end

  it 'Adds participant as owner' do
    user.id = 1
    expect(list.user_lists).to receive(:create).with(user_id: 1, owner: true)
      .and_return(user_list)
    list.add_user(user, true)
  end

  it 'Shows not shared, when no users attached' do
    expect(list.shared?).to be false
  end

  it 'Shows not shared, only self using list' do
    list.user_lists << build(:user_list, user_id: user.id)
    expect(list.shared?).to be false
  end

  it 'Shows shared, when list is used by more than one user' do
    list.user_lists = build_list(:user_list, 3)
    expect(list.shared?).to be true
  end

  it 'no percent done when no todo_items' do
    expect(list.percent_done).to be(0)
  end

  it 'no percent done when no done todo_items' do
    list.todo_items = build_list(:todo_item, 4)
    expect(list.percent_done).to be(0)
  end

  it '50 percent done when 2/4 done todo_items' do
    list.todo_items = build_list(:todo_item, 4)
    done_items = build_list(:todo_item, 2, :done)

    allow(list.todo_items).to receive_message_chain(:done)
      .and_return(done_items)
    expect(list.percent_done).to eq(50)
  end
end
