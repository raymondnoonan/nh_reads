# New Haven Reads Book Order Database

This is an application for [New Haven Reads](http://newhavenreads.org). Its purpose is to make the management and analytics of the organization's book orders easier.

- - -

## Organization of the Application

Upon visiting the website, a not-signed-up (and therefore not-signed-in) User will be greeted with a welcome message and two large buttons: "Sign in" and "Sign Up".

When signing up, besides picking an email and password, a User will also pick an initial organization to be a part of. An email will be sent to that organization's director confirming that the User is indeed a part of that organization. Once membership is confirmed, the User may log on

- - - 

## Organization of the Data

### Organization

An institution, such as an airport or school, that solicits books from New Haven Reads. An organization has many users, who a part of that organization, and many orders, which are the requests they have made for books. There will be two levels of organizations:
	1. __Executive__: Solely occupied by New Haven Reads. May delete other organizations (thereby deleting all users associated with that organization) in addition to everything else a non-executive organization can do.
	2. __Non-Executive__: Cannot delete other organizations.

### User

The signed-in visitor to the website. A User belongs to an organization and can make orders on behalf of its organization. There will be two levels of access for a User:
	1. __Director__: May remove other users from its organization and approve new ones in addition to everything a normal User can do. There may be multiple directors for an organization.
	2. __Non-director__: A non-director can make orders for books as well as edit current orders.

### Order

An order belongs to an organization. It is what a User creates when he or she makes a request for books. It includes what user made the order, as well as what time the order was made, when it was last edited (if it was at all), and what the expected date of completion is.

### Line Item

A line item includes the attributes of the order itself. It belongs to an order. These attributes include:
	1. Quantity of books ordered: an integer
	2. Category of book: childrens, young_adult, or adult?
	3. Genre of book: (list all genres here)

