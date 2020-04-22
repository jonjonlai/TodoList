class Todo < ApplicationRecord
    validates :todo, presence: true


    belongs_to :user,
        foreign_key: :user_id,
        class_name: "User"


end
