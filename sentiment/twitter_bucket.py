import math

sentiment_path = 'sentiment_out'
sentiments = open(sentiment_path, 'r')

start_timestamp = 1531612829576
bucket_size = 300000

summary = [0] * 50

for sentiment in sentiments:
    row = sentiment.strip().split(',')
    bucket_id = math.floor((int(row[0]) - start_timestamp) / bucket_size)
    # (magnitude * 10)^2 * score
    summary[bucket_id] = summary[bucket_id] + (float(row[1]) * 10) ** 2 * float(row[2])

print(summary)