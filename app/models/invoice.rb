class Invoice < ApplicationRecord
	belongs_to :type
	validates :value, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: BigDecimal(10**7) }
end
