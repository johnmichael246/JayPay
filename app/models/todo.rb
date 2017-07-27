class Todo < ApplicationRecord
    validates :list, presence: true;
end
