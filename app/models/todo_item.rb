class TodoItem < ActiveRecord::Base
  belongs_to :list
  validates :name, presence: true
  validates :list, presence: true

  scope :done, -> { where(done: true) }
  scope :sorted, -> { order(id: :ASC) }

  def toggle
    self.done = !done
  end
end
