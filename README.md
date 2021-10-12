## Introduction

I struggled with RoR, jQuery and testing for a long time before I got the proper effect. Maybe some of these solutions will be useful to you and will save you some time.

* ### First task 
#### Playing with the form and jQuery
I have two models that are related to each other: Invoice belongs to Type, Type has many Invoices.
After the user selects a specific type, I want to hide certain options in the form.
The whole logic of such a procedure is in the file: [_form.html.er](/app/views/invoices/_form.html.er)

```ruby
<div class="field">
    <%= form.label "type" %>
    <%= form.collection_select(:type_id, @types, :id, :kind, {:include_blank =>"Wybierz"}) %>
  </div>

  <script>
    $("#invoice_type_id").change(function() {

      if ($("#invoice_type_id option:selected").text() == "Paragon"){
        $("#invoice_split_payments").prop("checked", false);
        $('#invoice_split_payments').hide();
        $('.field').find("label[for=invoice_split_payments]").hide();

      } else {
        $('#invoice_split_payments').show();
        $('.field').find("label[for=invoice_split_payments]").show();
      }
    });
    $("#invoice_type_id").trigger("change");
  </script>l
```
If the user selects the type named "Receipt", jQuery will uncheck the checkbox and hide it.
I don't recommend using .attr() method. [Here](https://api.jquery.com/prop/) is why.
