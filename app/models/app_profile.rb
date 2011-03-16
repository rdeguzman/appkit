class AppProfile < ActiveRecord::Base
  belongs_to :user

  has_many :image_assets, :dependent => :destroy
  has_many :sections, :dependent => :destroy
  has_many :pages, :dependent => :destroy
  has_many :buttons, :dependent => :destroy

  has_many :app_builds

  validates :app_name, :presence => true, :uniqueness => true

  def application_icon
    image_asset = ImageAsset.where(:app_profile_id => self.id).where(:asset_type => 'application_icon').first
    if !image_asset.nil?
      image_asset.image.url(:icon)
    else
      nil
    end
  end

  def application_artwork
    image_asset = ImageAsset.where(:app_profile_id => self.id).where(:asset_type => 'application_artwork').first
    if !image_asset.nil?
      image_asset.image.url(:default)
    else
      nil
    end
  end
end
