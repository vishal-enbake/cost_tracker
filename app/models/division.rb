class Division < ActiveRecord::Base
  belongs_to :project
  attr_accessible :name, :project_id
  has_many :invoices
  has_many :receipts
end
