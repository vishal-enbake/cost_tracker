class Receipt < ActiveRecord::Base
  belongs_to :division
  attr_accessible :name
end
