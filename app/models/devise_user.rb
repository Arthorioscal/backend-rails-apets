class DeviseUser < ApplicationRecord
  has_many :animals

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :email, :password, :cpf, :date_of_birth, :phone, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :cpf, :phone, uniqueness: true
  validates :email, uniqueness: { case_sensitive: false }
end
