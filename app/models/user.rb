class User < ApplicationRecord
  has_many :transactions, foreign_key: 'user_id', dependent: :destroy
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Add confirmable module only for users
  devise :confirmable if :role == 'user'

  has_many :transactions, foreign_key: 'user_id', dependent: :destroy
  attribute :balance, :decimal, default: 200
  attribute :bonus, :decimal, default: 200
  attribute :role, :string, default: 'user'
  attribute :unique_id, :string, default: SecureRandom.hex(3)

  validates :balance, presence: true, numericality: { allow_decimal: true, greater_than: 0 }, if: -> { role == 'user' }
  validates :firstname, :lastname, :username, :phone_number, presence: true, if: -> { role == 'user' }
  validates :username, uniqueness: true, if: -> { role == 'user' }
end
