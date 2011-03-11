class AppProfile < ActiveRecord::Base
  belongs_to :user

  has_many :image_assets, :dependent => :destroy
  has_many :sections, :dependent => :destroy
  has_many :pages, :dependent => :destroy
  has_many :buttons, :dependent => :destroy

  has_many :app_builds

  validates :app_name, :presence => true, :uniqueness => true
end
