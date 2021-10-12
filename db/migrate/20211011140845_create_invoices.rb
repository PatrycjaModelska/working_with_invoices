class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.string :number
      t.decimal :value, precision: 10, scale: 2
      t.boolean :split_payments

      t.timestamps
    end
  end
end
