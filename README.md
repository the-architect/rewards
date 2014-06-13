Rewards Service
================

What is it?
-----------
Based on an account number and channel subscriptions this service checks if the customer is qualified to receive rewards.
If the customer is eligible then the service gathers all the rewards, based on the channels the customer is subscribed to.

Design goals
------------
- Easy to read code
- Small classes, small methods 
- Great testabilty
- Test Driven Design
- Extensibility and flexibility
- Domain logic should be independent from implementation details

Get the code
------------
```
git clone https://github.com/the-architect/rewards.git
```

Requirements
------------
- git
- ruby 2.1.2

Setup
-----
```
gem install bundler
bundle
```

Run all the tests
-----------------
To run the specs simply run __rake__ or __guard__ in your terminal.

Notes
-----
The RewardService class is only the back end of this service. One could think about hooking it up to a grape or sinatra 
rest api frontend. Another possibility could be to make it listen to amqp messages and act more asynchronously.
Since the class is so simple all this is pretty easy to do.

