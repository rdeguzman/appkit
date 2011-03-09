class Admin::ApplicationController < ApplicationController
  before_filter :authenticate_user!

  add_breadcrumb "Admin Home", "/admin/home/index"
end