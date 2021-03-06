class Tithe < ApplicationRecord
  belongs_to :membership

  validates :membership_id, presence: true
  validates :amount, presence: true, numericality: true

   ransacker :created_at, type: :date do
    Arel.sql('date(tithes.created_at)')
   end

   def ind_tithe
  	Tithe.where(membership_id: membership.id).sum(:amount)
  end

  
end
