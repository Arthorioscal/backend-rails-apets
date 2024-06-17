class Animal < ApplicationRecord
    belongs_to :devise_user
    
    has_one_attached :photo

    validates :name, :breed, :age, :additional_info, presence: true
end
