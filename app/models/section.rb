class Section < ActiveRecord::Base
  belongs_to :app_profile
  belongs_to :user

  has_many :pages, :dependent => :destroy
  has_one :button, :foreign_key => 'parent_id', :dependent => :destroy

  validates :title, :presence => true, :uniqueness => {:scope => :app_profile_id}
end
