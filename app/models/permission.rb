class Permission < ActiveRecord::Base
  attr_accessible :action, :controller, :description, :key
end
