json.extract! invoice, :id, :number, :value, :split_payments, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
