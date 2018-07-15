import json
from string import Template
import csv

match_ids = ['7443', '7444', '7445']

questions = [
    (Template('How many goals with $player score?'), 'INTEGER', 'PLAYER', 'goal'),
    (Template('How many goals will $team score?'), 'INTEGER', 'TEAM'),
    (Template('How many shot assists will $player have?'), 'INTEGER', 'PLAYER', 'shot_assist'),
    (Template('How many diving saves will the keeper for $team have?'), 'INTEGER', 'TEAM'),
    (Template('Which team will have more interceptions?'), 'TRIPLET', 'NEITHER'),
    (Template('Who will win?'), 'TRIPLET', 'NEITHER'),
    (Template('Will $player nutmeg another player?'), 'BOOLEAN', 'PLAYER', 'nutmeg'),
]

for match_id in match_ids:
    events_file = open('../statsbomb/data/events/' + str(match_id) + '.json')
    events = json.load(events_file)
    team1 = events[0]['team']['name']
    team2 = events[1]['team']['name']

    players1 = list(map(lambda x: x['player']['name'], events[0]['tactics']['lineup']))
    players2 = list(map(lambda x: x['player']['name'], events[1]['tactics']['lineup']))

    for question in questions:
        if question[2] == 'TEAM':
            print(','.join([match_id, question[0].substitute(team=team1), question[1]]))

            print(','.join([match_id, question[0].substitute(team=team2), question[1]]))
        elif question[2] == 'NEITHER':
            print(','.join([match_id, question[0].substitute(), question[1]]))
        else:
            data_file = open(question[3], 'r')
            reader = csv.reader(data_file)
            count = 0
            for row in reader:
                player = row[0]
                if (player in players1 or player in players2) and count < 2:
                    count += 1
                    print(','.join([match_id, question[0].substitute(player=player), question[1]]))

