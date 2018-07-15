# Hackathon_Dribble
A repo for competing in the US Soccer Hackathon.

## What is the problem we are trying to solve?

Woman's Soccer has incredible potential to grow globally.  The 2015 Women's World Cup final was watched by a staggering 750 million people! In the past year, an off World Cup year, Mexico in their first year in league play had multiple games with over 50 thousand fans in attendace. England's Super league did the same in their semis and finals. Once fans leave the match or turn off their TV there are very few web and mobile apps that are continuously engaging with those fans, particularly ones with a global outlook.

## Challenges

There are no women's soccer API's out there and very few quality datasets freely available. Other sports such as women's basketball have this.

## What is our project?

This project drives consumer-centric engagement in women's soccer. We believe the best way to grow the game is to create habit forming hooks. Making predictions in is a fun and safe way of engaging. No money Our business model is providing a alternative store that sells items not under the US Soccer Umbrella.

Our app is divided into 5 sections:

Dribble - An area where a user interacts with predictions and statistics

Store - Where the user purchases items or player experiences

Wall - An area where a fan sees realtime tweets and sentiments overs time (we also recorded tonight's Chicago Red Stars vs Seattle Reign game and provided insights over the entire game!)

Twitter - Tweets of WoSo Writers, Teams Members, Retired Players, Recent Callups by category


Here is where we begin:

![](https://github.com/femaleinventor/Hackathon_Dribble/blob/development/homepage.png)


**Dribble**

Choose to engage with leagues and teams around the world. The app is meant to grow the international game of soccer. Emphasis is not just on the USA. It's all many domestic leagues and federations. Making predictions in leagues you don't know much about is a learning opportunity.

![](https://github.com/femaleinventor/Hackathon_Dribble/blob/development/WorldwideLeagues.png)

Once in the app a users swipes up and down to browse through matches in each league. Team colors are blended to form the background of the page and begin to expose the user to an aspect of the team. The swiping is habit forming.

We ask not only who will win, but why does a user think this. Again, the brief moment of considering a reason deepens the understanding.

![](https://github.com/femaleinventor/Hackathon_Dribble/blob/development/Predictions.gif)


Real-time in match user engagement with Reactive and Predictive notifications.

Reactive Notification example:
Should that foul have been a A) red card B) yellow card C) no foul?
realtime results showing

Predictive Notification example:
Do you think Sky Blue FC will score in the next 10 minutes?
realtime results showing

A user answers questions like:
Which team will win the match?
How many goals will be scored?
How many attempts on Goals?
How many Saves by a team in the 1st half?
How many Nutmegs will happen?

A User can look historically at the data and compare themselves to other User's predictions.

![](https://github.com/femaleinventor/Hackathon_Dribble/blob/development/realtimestats.gif)

We also protect soccer players and prominent members of the soccer community by restricting these. So someone can't user MiaHamm or Abby-Wambach as a username in the app.


**Store**

A user can go see what the WoSo community is selling. Purchase a fun funky t-shirt that a player/designer has made. There will also be experiences for sale, like a small group clinic sponsored by a current NWSL player. The store items are woven into the fabric of the app.

![](https://github.com/femaleinventor/Hackathon_Dribble/blob/development/CommericalModel.png)


**Wall**

![](https://github.com/femaleinventor/Hackathon_Dribble/blob/development/TwitterWall.png)

And We have realtime sentiment analysis! Tweets collected over the course of a game are analyzed to see whether they were positive or negative and how strong the feelings are. When this data is broken into buckets and compared to actual game events, we see strong negative feelings when players are injured and strong positive feelings immediately preceded a goal indicating that fans were picking up on the momentum change.

The Twitter API stream collects tweets that mention the game hashtag, team Twitter handles, or player names. The text of the tweets are then run through the Google Sentiment Analysis API which returns values for the sentiment score (-1 to 1 representing negative to positive sentiment) and the magnitude which represents how strong those feelings are. From there, the tweets with a score of 0 are dropped, and each tweet is given a converted score equal to (magnitude * 10)^2 * score. Tweets are then grouped into 5 minute time intervals and the scores of the tweets in each bucket are summed. This data is then plotted on a graph with relevant game events overlaid (injuries and goals).

![](https://github.com/femaleinventor/Hackathon_Dribble/blob/development/sentiment/sentiment.jpg)


**Twitter**

Review twitter lists from Women's Soccer Writers and Teams from around the world. It's a twitter dashboard for what the sports writers, national team players, nwsl players, retired players, recent call-ups, and fans are tweeting about.

![](https://github.com/femaleinventor/Hackathon_Dribble/blob/development/Wosowriters.png)

![](https://github.com/femaleinventor/Hackathon_Dribble/blob/development/FrancePlayers.png)



## What technology have we employed?

Ruby on Rails backend, Postgres Database, JS frontend, StatsBomb Data, Deployed to Heroku from an open source MIT License to Github.


## Team

Alison Gale | @agale123 | agale753@gmail.com |
Frontend Engineer, Backend Engineer, Data Mapper and Parser

Denise Duffy | @femaleinventor | denise@deniseduffy.com
Product Manager, Presenter, Front and Backend Engineer

Ethan Fertsch | @efertsch | efertsch@gmail.com
Backend Engineer, Frontend Engineer

Jamie Swanson | @jamieswanson3141 | jamieswanson3141@gmail.com |
Database Engineer, Data Mapper and Parser


Current Schema:

![](https://github.com/femaleinventor/Hackathon_Dribble/blob/master/Dribble-Schema.png)
