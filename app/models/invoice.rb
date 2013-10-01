class Invoice < ActiveRecord::Base
  belongs_to :division
  attr_accessible :amount, :name, :division_id
end
