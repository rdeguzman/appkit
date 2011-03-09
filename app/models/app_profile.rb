class AppProfile < ActiveRecord::Base
  belongs_to :user

  has_many :image_assets, :dependent => :destroy
  has_many :sections, :dependent => :destroy
  has_many :pages, :dependent => :destroy
  has_many :buttons, :dependent => :destroy

  validates :app_name, :presence => true, :uniqueness => true
end
