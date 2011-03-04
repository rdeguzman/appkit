class Picture < ActiveRecord::Base
  belongs_to :page
  belongs_to :user

  has_attached_file :image,
                    :styles => {
                      :thumb => ["100x100>", :jpg],
                      :pagesize => ["500x400>", :jpg],
                    },
                    :default_style => :pagesize,
                    :url => "/images/appkit/pictures/:id/:style/:basename.:extension",
                    :path => "/wwwroot/images/appkit/pictures/:id/:style/:basename.:extension"
  
  validates_attachment_presence :image                  
  validates_attachment_size :image, :less_than => 10.megabytes
  
end
