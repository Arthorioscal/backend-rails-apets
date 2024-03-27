class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null:false
      t.string :password_digest
      t.string :cpf
      t.date :date_of_birth
      t.string :phone

      t.timestamps
    end

    add_index :users, :email, unique:true
  end
end
