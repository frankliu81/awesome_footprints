class Category < ActiveRecord::Base
  has_many :impact_entries, dependent: :destroy
  has_many :categories, through: :impact_entries
end
