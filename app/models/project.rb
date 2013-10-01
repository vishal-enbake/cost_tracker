class Project < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :user_id, :client, :amount, :start_date, :due_date
  has_many :divisions
  accepts_nested_attributes_for :divisions, :allow_destroy => true
end
