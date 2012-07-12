1. Create non-NHR User interface
  a. Do not allow non-NHR users to edit or confirm orders
  b. non-NHR users must only be able to see their own pending and past orders
  c. Create relationship between non-NHR and NHR users so that when a non-NHR user creates a new order, it shows up in
     the NHR pending orders page
2. Optimize DataTables database
  a. Ask Ben for help or try RailsCast again?
3. Implement Confirm button
  a. Either use hidden fields for a form, or use it to create/destroy relationships
4. Fully implmement printing feature
  a. Create label model, and have print button lead to a form to create labels?
    i. If this route, somehow figure out validations so that the total quantity of books on all the labels associated with an order add up to the order's total quantity, 