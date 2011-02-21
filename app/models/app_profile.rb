class AppProfile < ActiveRecord::Base
  belongs_to :user

  has_many :image_assets, :dependent => :destroy
  has_many :sections, :dependent => :destroy

  validates_presence_of :app_name
  validates_uniqueness_of :app_name
end
