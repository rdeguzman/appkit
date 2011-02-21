class ImageAsset < ActiveRecord::Base
  belongs_to :user
  belongs_to :app_profile

  has_attached_file :image,
                    :styles => {
                      :thumb => ["80x80>", :jpg],
                      :default => ["500x500", :jpg]
                      #:landscape => ["480x320>", :jpg],
                    },
                    :default_style => :pagesize,
                    :url => "/images/appkit/:id/:style/:basename.:extension",
                    :path => "/wwwroot/images/appkit/:id/:style/:basename.:extension"
  
  validates_attachment_presence :image                  
  validates_attachment_size :image, :less_than => 10.megabytes
  
end
