class Offset < ApplicationRecord
    validates :bot_id, uniqueness: true
end
