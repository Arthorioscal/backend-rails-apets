class AddDetailsToDeviseUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :devise_users, :name, :string
    add_column :devise_users, :cpf, :string
    add_column :devise_users, :date_of_birth, :date
    add_column :devise_users, :phone, :string
  end
end
