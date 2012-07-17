# High Priority (Must be complete before first iteration)

1. Optimize DataTables database --> MUST DO WITH BEN'S HELP
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
  a. Do not allow non-NHR users to print orders
    i. Implement CanCan do deal with this
    ii. Or SHOULD they be allowed to edit orders? What if the person on the other side wants to change the order as well?
  b. non-NHR users must only be able to see their own pending and past orders, and only create orders for themselves
  c. Create relationship between non-NHR and NHR users so that when a non-NHR user creates a new order, it shows up in
     the NHR pending orders page
     i. Possible implementation: when a new user is created, if it is NOT a NHR account, then build a relationship
     between it and the NHR account in the create action.
     ii. This may not be necessary; one can just add some logic to the User model or controller:
       j. If the user is an NHR user, pull ALL orders from the database. If its a non-NHR user, just pull the orders
       associated with that user.

3. Fully implmement printing feature
  a. Create label model, and have print button lead to a form to create labels?
    i. If this route, somehow figure out validations so that the total quantity of books on all the labels associated with an order add up to the order's total quantity
    ii. If one can't implement this, figure it out so that the labels can be anthing, but you print on the screen what the line-items are. This would involve dynamically adding label items to the page

4. Implement statistics page
  a. Total number of books ordered this month
    i. Breakdown by genre, organization, destination
  b. Compare to previous months- use graph?
    ii. This involves storing this sort of information over time

# Medium Priority (should be done before final product)

4. Fix uniqueness validation

# Low Priority (not necessary to complete)

5. Style table further with background-color
  a. And website. Use the blue and orange defined in the CSS
    i. Find an even lighter blue and lighter orange so everything looks very nice
  b. Use http://ie.microsoft.com/testdrive/graphics/cssgradientbackgroundmaker/default.html for CSS gradients
  c. Styling == LOW PRIORITY
6. Implement client_side_validations gem
7. Implement server-side validations of labels for specific orders
  a. Labels page is very similar to new orders page --> partial it out?


## To-do this weekend

Part 1, Javascript & jQuery: Getting Started with Javascript
3 Chapters of "The Rails 3 Way"

## Goals for this week 
6/17/2012: Install CanCan, implement non-NHR interface + authorization, Read Chapter 11 of Hartl tutorial
6/18/2012: Implement relationship model so adding orders on non-NHR account adds them to NHR index
6/19/2012: Optimize DataTables with Ben. Implement Texticle if needed.
6/20/2012: Implement statistics page
6/21/2012: 