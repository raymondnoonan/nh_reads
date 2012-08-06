# High Priority (Must be complete before first iteration)

6. Tidy up the statistics page (i.e. choose any previous month FOR WHICH THERE ARE ORDERS and display the data for that month)
  a. Implement a print feature for the statistics page
7. Create statistics model

# Medium priority (should be complete before final product)

3. Fully implmement printing feature
  a. Create label model, and have print button lead to a form to create labels?
    ii. If one can't implement this, figure it out so that the labels can be anything, but you print on the screen what the line-items are. This would invol ve dynamically adding label items to the page
  b. Check out cocoon example of double nested models with SimpleForm.
    i. an order accepts_nested_attributes_for :labels
  c. Advantage to label model: saves labels for future use, and can use best_in_place to edit them on the spot.
    d. Implement foriegn key with Label-LineItem association
    e. Implement join table between labels, orders, and line_items?
4. Fix uniqueness validation
5. Implement best-in-place for order show form and eliminate edit order form
6. If it's past the ETA, color it red; if today is the ETA, color it yellow; if ETA is in the future, don't color it at all.
7. Refactor edit and new order pages by moving the body to a partial

# Low Priority (not necessary to complete)

5. Style table further with background-color
  a. And website. Use the blue and orange defined in the CSS
    i. Find an even lighter blue and lighter orange so everything looks very nice
  b. Use http://ie.microsoft.com/testdrive/graphics/cssgradientbackgroundmaker/default.html for CSS gradients
  c. Styling == LOW PRIORITY
6. Write a script to create descriptive comments at the beginning of models or files