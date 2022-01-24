class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def active_for_authentication?
    super && (is_deleted == false)
  end
    

  has_many :addresses, dependent: :destroy
         
  validates :fist_name, presence: true
  validates :last_name, presence: true
  validates :fist_name_kana, format: { with:/\A[ァ-ヶー－]+\z/ }, presence: true
  validates :last_name_kana, presence: true
  validates :postal_code,length: { minimum: 7 }, presence: true
  validates :address,presence: true
  validates :phon_number, presence: true
end

