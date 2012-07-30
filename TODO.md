# High Priority (Must be complete before first iteration)

1. Implement search
  a. Implement Search form at top of table
    i. Be able to search by solicitor, destination, total books, ETA, Entered at, genre
  b. Add links to top of each column, allowing one to sort by that column

3. Fully implmement printing feature
  a. Create label model, and have print button lead to a form to create labels?
    ii. If one can't implement this, figure it out so that the labels can be anything, but you print on the screen what the line-items are. This would involve dynamically adding label items to the page
  b. Check out cocoon example of double nested models with SimpleForm.
    i. an order accepts_nested_attributes_for :labels
  c. Advantage to label model: saves labels for future use, and can use best_in_place to edit them on the spot.
  d. Implement foriegn key with Label-LineItem association

4. Implmement DataTables with JSON again, but don't use any virtual attributes
  a. instead, just show solicitor, destination, eta, created_on
  b. Use tooltip from bootstrap to show total books for each row
    i. Use jquery selector + hover

# Medium Priority (should be done before final product)

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