# TodoList class which is a todo list
class List < ActiveRecord::Base
  has_many :user_lists, dependent: :destroy
  has_many :users, through: :user_lists
  has_many :todo_items, dependent: :destroy

  validates :name, presence: true

  def add_user(user, owner = false)
    user_lists.create(user_id: user.id, owner: owner)
  end

  def owner?(user)
    user_lists.where(user_id: user.id, owner: true).present?
  end

  def shared?
    return true if user_lists.size > 1
    false
  end

  def percent_done
    return 0 unless todo_items.present?
    percent = (todo_items.done.size / todo_items.size.to_f) * 100
    percent.round
  end
end
