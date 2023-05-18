class User < ApplicationRecord
  has_many :transactions, foreign_key: 'user_id', dependent: :destroy
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Add confirmable module only for users
  devise :confirmable if :role == 'user'

  has_many :transactions, foreign_key: 'user_id', dependent: :destroy
  attribute :role, :string, default: 'user'
  attribute :referred_num, :integer, default: 0
  attribute :unique_id, :string, default: SecureRandom.hex(3)
  validates :balance, presence: true, numericality: { allow_decimal: true, greater_than: 0 }, if: -> { role == 'user' }
  validates :firstname, :lastname, :username, :phone_number, presence: true, if: -> { role == 'user' }
  validates :username, uniqueness: true, if: -> { role == 'user' }

  after_create :assign_referral_link, if: -> { role == 'user' }

  def assign_referral_link
    self.referral_link = generate_referral_link
    save
  end

  private

  def generate_referral_link
    Rails.application.routes.url_helpers.new_user_registration_url(ref: unique_id, host: 'https://deposit-app.onrender.com')
  end

end
