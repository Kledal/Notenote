# The UserLIst class is a weak table
class UserList < ActiveRecord::Base
  belongs_to :user
  belongs_to :list
end
