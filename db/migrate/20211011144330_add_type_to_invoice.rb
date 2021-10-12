class AddTypeToInvoice < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :invoices, :type, foreign_key: true
  end
end
