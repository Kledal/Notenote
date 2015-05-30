class TodoItem < ActiveRecord::Base
  belongs_to :list

  validates :name, presence: true
end
