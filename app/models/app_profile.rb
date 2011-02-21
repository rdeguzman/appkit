class AppProfile < ActiveRecord::Base
  belongs_to :user

  has_many :image_assets, :dependent => :destroy
  has_many :sections, :dependent => :destroy

  validates :app_name, :presence => true, :uniqueness => true
end
