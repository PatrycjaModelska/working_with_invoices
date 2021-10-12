require "application_system_test_case"

class InvoicesTest < ApplicationSystemTestCase
  setup do
    @invoice = invoices(:one)
  end

  test "visiting the index" do
    visit invoices_url
    assert_selector "h1", text: "Invoices"
  end

  test "creating a Invoice" do
    visit invoices_url

    click_on "New Invoice"

    # opcja z select pozwala wybierać po nazwie 
    # find('#invoice_type_id').find(:xpath, 'option[2]').select_option
    page.select('Paragon', from: 'invoice_type_id')

    fill_in "Number", with: @invoice.number

    fill_in "Value", with: @invoice.value

    assert has_no_field?('invoice_split_paymanet')
    assert_no_text "Split payments"

    click_on "Create Invoice"

    assert_text "Invoice was successfully created"
    assert_text "false"

  end

  test "updating a Invoice" do
    visit invoices_url
    click_on "Edit", match: :first
    page.select('Faktura', from: 'invoice_type_id')

    fill_in "Number", with: @invoice.number
    check "Split payments" if @invoice.split_payments
    fill_in "Value", with: @invoice.value
    click_on "Update Invoice"

    assert_text "Invoice was successfully updated"
    click_on "Back"
  end

  test "destroying a Invoice" do
    visit invoices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Invoice was successfully destroyed"
  end

  test "remove split payments after change to reciept" do
    visit invoices_url
    click_on "Edit", match: :first
    page.select('Paragon', from: 'invoice_type_id')
    click_on "Update Invoice"
    assert_text "false"
  end
end
