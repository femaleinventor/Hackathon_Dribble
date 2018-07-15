import json

league_id = '49'

matches_file = open('../statsbomb/data/matches/' + str(league_id) + '.json')
matches = json.load(matches_file)

match_ids = []
for match in matches:
    match_ids.append(match['match_id'])

player_stats = {}

def is_nutmeg(event):
    return 'dribble' in event and 'nutmeg' in event['dribble'] and event['dribble']['nutmeg']

def is_shot_assist(event):
    return 'pass' in event and 'shot_assist' in event['pass'] and event['pass']['shot_assist']

def is_goal(event):
    return 'shot' in event and 'outcome' in event['shot'] and event['shot']['outcome']['name'] == 'Goal'

def increment_player_stat(event, field):
    name = event['player']['name']
    if not name in player_stats:
        player_stats[name] = {}
    if not field in player_stats[name]:
        player_stats[name][field] = 0
    player_stats[name][field] = player_stats[name][field] + 1 

stats = [
    ('nutmeg', is_nutmeg),
    ('shot_assist', is_shot_assist),
    ('goal', is_goal),
]

for match_id in match_ids:
    events_file = open('../statsbomb/data/events/' + str(match_id) + '.json')
    events = json.load(events_file)
    for event in events:
        for stat in stats:
            if stat[1](event):
                increment_player_stat(event, stat[0])

for stat in stats:
    print('')
    print('Summary for ' + stat[0])
    
    sorted_els = sorted(player_stats.items(), key=lambda tup: tup[1][stat[0]] if stat[0] in  tup[1] else 0, reverse=True)
    for el in sorted_els:
        if (stat[0] in el[1]):
            print(el[0] + ',' + str(el[1][stat[0]]))

