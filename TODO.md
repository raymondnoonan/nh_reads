# High Priority (Must be complete before first iteration)

1. Optimize DataTables database
  a. Ask Ben for help or try RailsCast again?
  b. Figure out how to use JSON with order functions and not just columns.
  c. Figure out how to use ActiveRecord queries with functions if it's possible
    i. It seems like ActiveRecord queries pull straight from the database, so this may not be the best way to do it...
    ii. If this isn't possible, figure out another way to get dynamic tabling with AJAX
  d. Look into how to use virtual attributes with JSON
    i. Check out SO and serializeable_hash
  e. Will have to:
    i. Define as_json for Order model

2. Create non-NHR User interface
  d. For the new order page, have the organization option available for NHR users, but not available for non-NHR users
     i. Will have to define a virtual attribute for organization that ||= 's to the current_user's organization
  e. Order already has a virtual attribute defined --> use this.

3. Fully implmement printing feature
  a. Create label model, and have print button lead to a form to create labels?
    i. If this route, somehow figure out validations so that the total quantity of books on all the labels associated with an order add up to the order's total quantity
    ii. If one can't implement this, figure it out so that the labels can be anything, but you print on the screen what the line-items are. This would involve dynamically adding label items to the page

# Medium Priority (should be done before final product)

4. Fix uniqueness validation
5. Implement best-in-place for order show form and eliminate edit order form
6. If it's past the ETA, color it red; if today is the ETA, color it yellow; if ETA is in the future, don't color it at all.

# Low Priority (not necessary to complete)

5. Style table further with background-color
  a. And website. Use the blue and orange defined in the CSS
    i. Find an even lighter blue and lighter orange so everything looks very nice
  b. Use http://ie.microsoft.com/testdrive/graphics/cssgradientbackgroundmaker/default.html for CSS gradients
  c. Styling == LOW PRIORITY
7. Implement server-side validations of labels for specific orders
  a. Labels page is very similar to new orders page --> partial it out?

## Goals for this week 
6/17/2012: Install CanCan, implement non-NHR interface + authorization, Read Chapter 11 of Hartl tutorial
6/18/2012: Implement relationship model so adding orders on non-NHR account adds them to NHR index
6/19/2012: Optimize DataTables with Ben. Implement Texticle if needed.
6/20/2012: Implement statistics page
6/21/2012: 