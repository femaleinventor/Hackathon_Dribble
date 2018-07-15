import json
import itertools

import googleapiclient.discovery

import os

api_key_file = open('google_key', 'r')
api_key = api_key_file.read()

tweets_path = 'twitter_out'
tweets = open(tweets_path, 'r')

def analyze_text(text):
    body = {
        'document': {
            'type': 'PLAIN_TEXT',
            'content': text
        },
        'encoding_type': 'UTF32'
    }

    service = googleapiclient.discovery.build(
        'language',
        'v1',
        developerKey=api_key)

    # pylint: disable=no-member
    request = service.documents().analyzeSentiment(body=body)
    response = request.execute()

    return response

for line in tweets:
    try:
        tweet = json.loads(line)
        sentiment = analyze_text(tweet['text'])['documentSentiment']
        timestamp = tweet['timestamp_ms']
        magnitude = sentiment['magnitude']
        score = sentiment['score']
        
        if (magnitude != 0.0) and (score != 0.0):
            print(','.join([timestamp, str(magnitude), str(score)]))
        
    except:
        continue
