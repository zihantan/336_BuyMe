# BuyMe_Auction
This is an online auction website that allows users to search, modify, view, alert, auto and manual bidding for their interested product.

# Functionality
The functionality of the system can be naturally divided into:	
  1. account handling for end users  
  1. auction and bidding functionality 	
  1. browsing and advanced search functionality
  1. alerts and messaging functions
  1. customer representatives & admin functions  
  
  ### Sub-Functionality
1. Create accounts of users; login, logout.  
2. Auctions  
  - seller creates auctions and posts items for sale
	- set all the characteristics of the item
	- set closing date and time
        	- set a hidden minimum price (reserve)
    - a buyer should be able to bid
	- manual bidding: let the buyer set a new bid
	- automatic bidding
	    - set a secret upper limit
	    - put in a higher bid automatically for the user in case someone bids higher   
  - define the winner of the auction
	- when the closing time has come, check if the seller has set a reserve
	    - if yes: if the reserve is higher than the last bid none is the winner.
	    - if no: whoever has the higher bid is the winner

3. Browsing and advanced search functionality     
- let people browse on the items and see the status of the current bidding
- sort by different criteria (by type, bidding price etc.)
- search the list of items by various criteria.
- a user is able to:
	- view all the history of bids for any specific auction
  - view the list of all auctions a specific buyer or seller has participated in  
  - view the list of "similar" items on auctions in the preceding month (and auction information about them)

4. Alerts and Messaging functions
- alert the buyer that a higher bid has been placed
- alert the buyer in case someone bids more than your upper limit (for automatic bidding)
- let user set an alert for specific items s/he is interested 
- get an alert when the item becomes available
- user can post questions
- user can search and browse questions/answers  

5. Customer representatives and admin functions
- Admin (create an admin account ahead of time)
	- creates accounts for customer representatives
  - generates sales reports for:
    - total earnings
    - earnings per:
      - item
      - item type
      - end-user
    - best-selling items
   	- best buyers
 - Customer representative:
	- answers to questions of users
	- edits account information, bids and auctions
	- removes bids 
	- removes auctions
