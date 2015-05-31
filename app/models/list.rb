class List < ActiveRecord::Base
  has_many :user_lists, dependent: :destroy
  has_many :users, through: :user_lists

  has_many :todo_items, dependent: :destroy

  validates :name, presence: true

  def is_owner?(user)
    return user_lists.where(user_id: user.id).first.owner
  end

  def shared?
    return false if user_lists.size == 1
    return true
  end

  def percent_done
    return 0 if !todo_items.present?
    percent = (todo_items.where(done: true).size / todo_items.size.to_f)*100
    percent.round
  end
end
