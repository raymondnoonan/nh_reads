# New Haven Reads Book Order Database

[New Haven Reads](http://newhavenreads.org) is a nonprofit organization dedicated to providing an environment where children and adults can nuture a love of reading. This application simplifies the management and analytics of the organization's book orders.

- - -

## Organization of the Application

Upon visiting the website, the New Haven Reads employee (modeled as a __User__) will be greeted with a welcome message and one large button: "Sign in here!". 

A user associated with an organization may log on and see past and current orders as well as make new ones.

- - - 

## Organization of the Data (Models)

### User

The New Haven Reads staff member logged in to the application. A User has many orders, and has many line_items through orders. A User will be able to create new orders, delete its old ones as desired, and print labels for its orders.

### Order

An order belongs to an organization. It is what a User creates when he or she makes a request for books. Its attributes will include:
  * At what time the order was made
  * When the order was last updated
  * The name of the organization making the order
  * The name of the person, along with their phone number and email address, to contact at the organization
  * The expected date of pickup of the order

### Line Item

A line item includes the attributes of the order itself. It belongs to an order. These attributes include:
	* book_qty: an _integer_ value representing the number of books ordered
	* children: a _boolean_ value representing whether the order contained children's books (true) or not (false)
	* genre: a _hash_ with keys corresponding to a genre and values as booleans indicating whether the line item contains books of that genre.

---

## Plans for Future Iterations

Future iterations of the application will allow others to register their organizations with the application and sign in to personal User accounts, which will be associated with a (single) particular organization. Upon organization registration, an email will be sent to a New Haven Reads staff member confirming that the organization is a legitimate one. Once an organization is approved, it may create users associated with the organization that will be able to make orders.

Other features will include:

### The Organization model

An institution, such as an airport or school, that solicits books from New Haven Reads. An organization has many users, who a part of that organization, and many orders, which are the requests they have made for books. There will be two levels of organizations:
	* __Executive__: Solely occupied by New Haven Reads. May delete other organizations (thereby deleting all users associated with that organization) in addition to everything else a non-executive organization can do.
	* __Non-Executive__: Cannot delete other organizations. May create new User accounts associated with its organization.

#### The User model
In the future, it is planned to expand the User model to all approved visitors of the website. A User belongs to an organization and can make orders on behalf of its organization. There will be two levels of access for a User:
	* __Director__: May remove other users from its organization and approve new ones in addition to everything a normal User can do. There may be multiple directors for an organization.
	* __Non-director__: A non-director can make orders for books as well as edit current orders.
