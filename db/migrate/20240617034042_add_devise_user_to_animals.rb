class AddDeviseUserToAnimals < ActiveRecord::Migration[7.1]
  def change
    add_reference :animals, :devise_user, null: false, foreign_key: true
  end
end
