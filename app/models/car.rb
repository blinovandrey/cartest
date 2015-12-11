class Car < ActiveRecord::Base
  has_many :photos, dependent: :destroy
  validates :name, presence: true, length: { maximum: 50 }
  validates :gosnum, presence: true, length: { maximum: 10 }
  validates :pts, presence: true, length: { maximum: 12 }
  validates :pts_date, presence: true
  validate :valid_date

  private
  	def valid_date
  	  if Date.today < pts_date 
  	  	errors.add(:pts_date, 'must be not in future')
  	  end
  	end
end
