class TodoItem < ActiveRecord::Base
  belongs_to :list
  validates :name, presence: true

  scope :sorted, -> { order(id: :ASC) }
end
