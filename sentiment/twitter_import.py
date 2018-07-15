from tweepy.streaming import StreamListener
from tweepy import OAuthHandler
from tweepy import Stream
import json
import sys

key_file = sys.argv[1]
f=open(sys.argv[1], "r")

twitter_keys = f.read().split()
access_token_key = twitter_keys[0]
access_token_secret = twitter_keys[1]
consumer_key = twitter_keys[2]
consumer_secret = twitter_keys[3]

class StdOutListener(StreamListener):
	def on_data(self, data):
		tweet = json.loads(data)
		if tweet['lang'] == 'en':
			print(data)
		return True
		
	def on_error(self, status):
		return True
		
listener = StdOutListener()
auth = OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token_key, access_token_secret)
stream = Stream(auth, listener)

stream.filter(track=[
    '#CHIvSEA',
    '@ReignFC',
    '#LetItReign',
    'Elizabeth Addo',
    'Morgan Andrews',
    'Yael Averbuch',
    'Lauren Barnes',
    'Maddie Bauer',
    'Michelle Betos',
    'Steph Catley',
    'Kiersten Dallstream',
    'Fishlock',
    'Jaycie Johnson',
    'Naho Kawasumi',
    'Alyssa Kleiner',
    'Adriana Leon',
    'Allie Long',
    'Kristen Mcnabb',
    'Theresa Nielsen',
    'Megan Oyster',
    'Rapinoe',
    'Jasmyne Spenccer',
    'Jodie Taylor',
    'Rumi Utsugi',
    'Christen Westphal',
    'Lydia Williams',
    'Beverly Yanez',
    '@chiredstarsPR',
    'Alyssa Naeher',
    'Nikki Stanton',
    'Arin Gilliland',
    'Alyssa Mautz',
    'Katie Naughton',
    'Casey Short',
    'Julie Ertz',
    'Stephanie McCaffrey',
    'Vanessa DiBernardo',
    'Yuki Nagasato',
    'Morgan Brian',
    'Sarah Gorden',
    'Michele Vasconcelos',
    'Summer Green',
    'Sam Kerr',
    'Emily Boyd',
    'Rosie White',
    'Brooke Elby',
    'Danielle Colaprico',
    ])