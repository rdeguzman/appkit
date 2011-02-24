class Section < ActiveRecord::Base
  belongs_to :app_profile
  belongs_to :user

  has_many :pages, :dependent => :destroy

  validates :title, :presence => true, :uniqueness => {:scope => :app_profile_id}
end
