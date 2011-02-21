class Section < ActiveRecord::Base
  belongs_to :app_profile
  belongs_to :user

  has_many :pages, :dependent => :destroy

  validates_presence_of :title
  #validates_uniqueness_of :title
end
