# Databases

# Case Study for CA Part I 2017/2018

A computer games shop called ‘Games Galore’ sells electronic games some of the games can run on several gaming
consoles. The shop also sells gaming consoles and accessories, both generic accessories and those for specific
consoles. Games Galore want to design an information system to support all the retail activities of the shop.
The details of each item of stock available for sale in the shop will be stored. These include a unique numerical stock
code (5 digits), the type of item it is (game, console, accessory etc.), a description, the number of items of that
product currently in stock, the price the shop paid for a single item, and the percentage mark-up they intend to add
when selling (e.g. 10% this will allow the retail price to be calculated so if the shop paid 100€ for an item if the mark-
up is 10% they will sell it for 110). In addition, for each game its name, release date, console needed, the age group it
is suitable for, and the skills needed to play the game are stored.
The shop buys games, consoles and accessories from several suppliers and needs to store details about these
suppliers including their company name, main email (must include an @ symbol) and phone contact details. Each
supplier is given a unique numerical ID (5 digits). Suppliers can supply many different kinds of game, console and
accessory. Each supplier can have one or more sales representatives and for each supplier the name, email and
phone contact of their representatives needs to be stored. Each representative has a unique numerical ID (5 digits).
A representative can work for one or more suppliers.
Each item sold in the shop can be supplied by many suppliers and a supplier can supply several different items. To
place an order with a supplier (supplier order), the shop identifies the items to be ordered and adds the quantity of
each that they want to order. Each order has a unique order number (6 characters which must start with a letter
followed by 5 digits). The date the order is made is also stored in addition to the sales representative with whom the
order was made. When the order is delivered, the delivery date is recorded.
The games shop has a panel of reviewers who review the games that the shop stocks. Each reviewer has a unique
username (8 characters in length but can include numerical values); a password (must be at least 8 characters in
length but can include numerical values); and an e-mail address (which must include the @ symbol and should be
unique i.e. two reviewers cannot have the same email address). When he/she wants to add a review, the reviewer
will log on to the system which will present them with a list of games available for review, he/she will then select the
game to be reviewed and enter in the review text. The date the review is entered is stored with the review. Many
reviewers can review a game and a reviewer can review many games. Each reviewer can only review a game once.
The following is a list of reviews that have been posted against one of the games. 
The Game Review table is inside the Assignment 1 Part I.

# Case Study for CA Part II 2017/2018

 lighting shop Linda’s Lighting Emporium offers a design service to clients where they will design a lighting system to the client’s specifications. The shop also sells them the products needed for that system. The shop specialises in all types of lighting – indoor and outdoor, commercial and domestic. 
The shop stores details of their clients in the Client table. The shop employs a number of designers and stores details of these designers in the designer table.  Details of lighting products stocked by the shop are stored in the product table. 
Designers create lighting specifications for clients. Details are stored in the specification table. Clients are charged a commission by the shop for designing the specification. This should cover the cost of paying the designer for the number of hours worked on that specification, also stored, at their hourly rate.
One specification can use one or more products stocked by the shop. Details of the products used are stored in the specProduct table. In addition to the commission charged for designing the specification the final cost to the client includes the prices charged for each product used.

The following constraints apply and must be managed through value constraints:
    • Client email addresses must be unique. 
    • Designer email addresses must be unique. 
    • All email addresses must contain the @ symbol and a the(.) symbol and these cannot be the first character of the email address.
    • Designer rate of pay must be < 75.99.
    • Product unit price must be between 5.00 and 45.50.
    • The commission price for a specification cannot be more than 16,000.
    • The hours worked by a designer on a specification cannot be more than 150.
    • Each product is identified by a 1 character product category followed by a 6 digit numeric code.
    • Valid product categories are G Garden Lighting, L Lamps & Bulbs, C Cables, S Shades, X Christmas.

# Case Study for CA Part III 2017/2018

