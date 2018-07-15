# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

# Parse in Teams csv and create Team objects
csv_text = File.read(Rails.root.join('lib', 'seeds', 'BCD_for_CSV_teams_062518.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Team.new
  t.name = row['name']
  t.abbreviation = row['abbreviation']
  t.nickname = row['nickname']
  t.bright_color = row['bright_color']
  t.light_color = row['light_color']
  t.dark_color = row['dark_color']
  t.twitter_list = row['twitter_list']
  t.sport_id = row['sport_id']
  t.save!
end


# -----------------
# Sports
# -----------------

sport_list = [
  [ "Soccer", "/../assets/images/small_sports/soccer_ball.png" ],
  [ "BasketBall", "/../assets/images/small_sports/basket_ball.png"],
  [ "Rugby", "/../assets/images/small_sports/rugby_ball.png"],
  [ "Ice Hockey", "/../assets/images/small_sports/ice_hockey.png"],
  [ "Tennis", "/../assets/images/small_sports/tennis_ball.png"],
  [ "Volleyball", "/../assets/images/small_sports/tennis_ball.png"]
]

sport_list.each do |sport|
  Sport.create!(name: sport[0], image_url: sport[1])
end


# -----------------
# Leagues
# -----------------

league_list = [
  [ "FIFA (Worldwide National Teams)", "FIFA", 1],
  [ "National Women's Soccer League (USA)", "NWSL", 1],
  [ "International Champions Cup", "ICC", 1],
  [ "Liga MX Femenil (Mexico)", "Liga MX", 1],
  [ "UEFA Women's Champions League Champion's League (Europe)", 1 ],
  [ "Allianz Frauen-Bundesliga (Germany)", "Frauen-Bundesliga", 1],
  [ "FA Women's Super League (England)", "FA Super League", 1],
  [ "FA Women's Championship (England)", "FA Championship", 1],
  [ "Westfield W-League (Australia)", "W-League", 1],
  [ "National Women’s League (New Zealand)", "NWL", 1 ],
  [ "Primera División Femenina (Spain)", "Primera División", 1],
  [ "Serie A Women (Italy)", "Serie A", 1],
  [ "Damallsvenskan (Sweden)", "Damallsvenskan", 1],
  [ "Division 1 Féminine (France)", "Division 1", 1],
  [ "Indian Women's Football League (India)", "IWFL", 1],
  [ "Kowsar Women Football League (Iran)", "Kowsar", 1],
  [ "Iraqi Women's Premier League (Iraq)", "Iraqi PL", 1],
  [ "Nadeshiko League[ (Japan)", "Nadeshiko", 1],
  [ "WK League (South Korea)", "WK", 1],
  [ "Thai Women's Premier League (Thailand)", "Thai League", 1],
  [ "Algerian Championship (Algeria)", "Algerian League", 1],
  [ "Egyptian League (Egypt)", "Egyptian League", 1],
  [ "Kenyan Premier League (Kenya)", "Kenyan League", 1],
  [ "Botola (Morocco)", "Botola", 1],
  [ "Nigerian Championship (Nigeria)", "Nigerian Championship", 1],
  [ "Tunisian Ligue (Tunisia)", "Tunisian Ligue", 1],
  [ "Copa do Brasil de Futebol Feminino (Brazil)", "CBFF", 1],
  [ "Frauenliga (Austria)", "Frauenliga", 1],
  [ "Premier League (Belarus)", "Balarus Premier", 1],
  [ "Super League (Belgium)", "Super League", 1],
  [ "Eredivisie (Netherlands)", "Erdivisie", 1],
  [ "Estonia League (Estonia)", "Estonian League", 1],
  [ "Hong Kong League (Hong Kong)", "Hong Kong League", 1],
  [ "Vietnam League (Vietnam)", "Vietnam League", 1],
  [ "Malta League (Malta)", "Malta League", 1],
  [ "Toppserien (Norway)", "Toppserien", 1],
  [ "Kadınlar 1. Futbol Ligi (Turkey)", "K1FL", 1],
  # [ "National Collegiate Athletic Association Division 1 Soccer (USA)", "NCAA Soccer D1", 1],
  # [ "National Collegiate Athletic Association Division 1 Soccer (USA)", "NCAA Soccer D2", 1]
  [ "Women's National Basketball Association (USA)", "WNBA", 2],
  [ "Women's National Basketball League (Australia)", "WNBL", 2],
  [ "Russian Women's Basketball Premier League (Russia)", "RWBL", 2],
  [ "Liga Femenina de Baloncesto (Spain)", "LFB", 2],
  [ "Turkish Women's Basketball League‎ (Turkey)", "TWBL", 2],
  [ "First Women's Basketball League of Serbia (Serbia)", "FWBLS", 2],
  [ "Women's British Basketball League (England)", "WBBL", 2],
  [ "National Collegiate Athletic Association Division 1 BasketBall (USA)", "NCAA BasketBall D1", 2],
  [ "National Collegiate Athletic Association Division 2 BasketBall (USA)", "NCAA BasketBall D2", 2],
  [ "National Collegiate Athletic Association Division 1 Rugby (USA)", "NCAA Rugby D1", 3],
  [ "National Collegiate Athletic Association Division 1 Ice Hockey (USA)", "NCAA Ice Hockey D1", 4],
  [ "National Collegiate Athletic Association Division 1 Tennis (USA)", "NCAA Tennis D1", 5],
  [ "National Collegiate Athletic Association Division 1 Volleyball (USA)", "NCAA Volleyball D1", 6],
  [ "Women's Rugby League World (Worldwide National Teams)", "WR", 3],
  [ "The Women's Premier League (USA)", "WPL", 3],
  [ "Rugby Football League (United Kingdom)", "RFL", 3],
  [ "Australian Women's Rugby League (Australia)", "AWRL", 3],
  [ "Rugby Football League (England)", "RFL", 3],
  [ "National Women's Hockey League (USA)", "NWHL", 4],
  [ "Women's Tennis Association (USA)", "WTA", 5],
  [ "Canadian Women's Hockey League (USA)", "CWHL", 4]
]

league_list.each do |league|
  League.create!(name: league[0], abbreviation: league[1], sport_id: league[2])
end


# -----------------
# Venues
# -----------------

venues_list = [
  #id 1
  [ "Toyota Park", "venues/Toyota_Park.jpg", "7000 Harlem Ave, Bridgeview, IL 60455", "America/Chicago"],
  #id 2
  [ "BBVA Compass Stadium", "venues/BBVA_Compass.jpg", "2200 Texas St, Houston, TX 77003", "America/Chicago"],
  #id 3
  [ "WakeMed Soccer Park", "venues/Wake_Med.jpg", "201 Soccer Park Dr, Cary, NC 27511", "America/New_York"],
  #id 4
  [ "Orlando City Stadium", "venues/Orlando.jpg", "655 W Church St, Orlando, FL 32805", "America/New_York"],
  #id 5
  [ "Providence Park", "venues/Providence_Park.png", "1844 SW Morrison St, Portland, OR 97205","America/Los_Angeles"],
  #id 6
  [ "Memorial Stadium", "venues/Memorial_Stadium.jpg", "401 5th Ave N, Seattle, WA 98109", "America/Los_Angeles"],
  #id 7
  [ "Yurcak Field", "venues/Yurcak_Field.jpg", "83 Fitch Rd, Piscataway Township, NJ 08854", "America/New_York"],
  #id 8
  [ "Rio Tinto Stadium", "venues/Rio_Tinto_Stadium.jpeg", "9256 State St, Sandy, UT 84070", "America/Denver"],
  #id 9
  [ "Maryland SoccerPlex", "venues/Maryland_Soccerplex.jpeg", "18031 Central Park Cir, Boyds, MD 20841", "America/New_York"],
  #id 10
  [ "Audi Field", "venues/Audi_Field.jpg", "32-60 R St SW, Washington, DC 20024", "America/New_York"],
  #id 11
  [ "Avaya Stadium", "venues/Avaya_Stadium.png", "1123 Coleman Ave, San Jose, CA 95110","America/Los_Angeles"],
  #id 12
  [ "EverBank Field", "venues/Everbank_Field.jpg", "1 Everbank Field Dr, Jacksonville, FL 32202", "America/New_York"],
  #id 13
  [ "Talen Energy Stadium", "venues/Talen_Energy_Stadium.jpg", "1 Stadium Dr, Chester, PA 19013", "America/New_York"],
  #id 14
  [ "FirstEnergy Stadium", "venues/FirstEnergy_Stadium.jpg", "100 Alfred Lerner Way, Cleveland, OH 44114", "America/Chicago"],
  #id 15
  [ "Stade Guy-Piriou", "venues/Stade_Guy-Pirious.jpg", "13 Rue de Keriolet, 29900 Concarneau", "Europe/Paris"],
  #id 16
  [ "Children’s Mercy Park", "venues/Childrens_Mercy_Park.png", "1 Sporting Way, Kansas City, KS 66111 Kansas City", "America/Chicago"],
  #id 17
  [ "Pratt & Whitney Stadium at Rentschler Field", "venues/Pratt_and_Whitney_Stadium.jpg", "615 Silver Ln, East Hartford, CT 06118", "America/New_York"],
  #id 18
  [ "StubHub Center", "venues/StubHub_Center.jpg", "18400 S Avalon Blvd, Carson, CA 90746", "America/Los_Angeles"],
  #id 19
  [ "Hard Rock Stadium", "venues/hard_rock_stadium.jpg", "347 Don Shula Dr, Miami Gardens, FL 33056", "America/New_York"]
]


venues_list.each do |venue|
  Venue.create!(name: venue[0], picture_url: venue[1], address: venue[2], timezone: venue[3])
end

#----------------------
# Matches go here! :)
#----------------------
#[result, channel, start_time, start_date, league_id, away_team_id, home_team_id, sport_id, venue_id, ref_id]

matches = [
  [ "Seattle Reign", "go90 App", Time.parse("19:00"), Date.new(2018,5,6), 2, 11, 10, 1, 5, 7443 ],
  [ "Tie",           "go90 App", Time.parse("19:00"), Date.new(2018,5,6), 2,  8,  6, 1, 7, 7444 ],
  [ "Utah Royals",   "go90 App", Time.parse("19:00"), Date.new(2018,5,6), 2, 14, 13, 1, 8, 7445 ]
  [ "", "go90 App", Time.parse("20:00"), Date.new(2018,7,15,12), 2,  7, 10, 1, 5, 7545 ],
  [ "", "go90 App", Time.parse("20:00"), Date.new(2018,7,20,12), 2,  8, 13, 1, 8, 7546 ],
  [ "", "go90 App", Time.parse("15:30"), Date.new(2018,7,21,12), 2, 11,  9, 1, 4, 7547 ]
]

# -----------------
# Questions
# -----------------
# [display_text, response_type, match_id, ref_id]
questions_list = [
  ["How many goals will Portland Thorns FC score?", "integer", 1, 7443],
  ["How many goals will Seattle Reign FC score?", "integer", 1, 7443 ],
  ["How many shot assists will Margaret Purce have?", "integer", 1, 7443],
  ["How many shot assists will Ana-Maria Crnogorcevic have?", "integer", 1, 7443],
  ["How many diving saves will the keeper for Portland Thorns FC have?", "integer", 1, 7443],
  ["How many diving saves will the keeper for Seattle Reign FC have?", "integer", 1, 7443],
  ["Which team will have more interceptions?", "triplet", 1, 7443],
  ["Who will win?", "triplet" 1, 7443],
  ["Will Margaret Purce nutmeg another player?", "boolean", 1, 7443],
  ["Will Beverly Yanez nutmeg another player?", "boolean", 2, 7443],
  ["How many goals will North Carolina Courage score?", "integer", 2, 7444],
  ["How many goals will Chicago Red Stars score?", "integer", 2, 7444],
  ["How many shot assists will Jaelene Hinkle have?", "integer", 2, 7444],
  ["How many shot assists will Abby Dahlkemper have?", "integer", 2, 7444],
  ["How many diving saves will the keeper for North Carolina Courage have?", "integer", 2, 7444],
  ["How many diving saves will the keeper for Chicago Red Stars have?", "integer", 2, 7444],
  ["Which team will have more interceptions?", "triplet", 2, 7444],
  ["Who will win?", "triplet" 1, 7444],
  ["Will Jaelene Hinkle nutmeg another player?", "boolean", 2, 7444],
  ["Will Débora Cristiane de Oliveira nutmeg another player?", "boolean" 2, 7444],
  ["How many goals will Utah Royals FC score?", "integer", 3, 7445],
  ["How many goals will Washington Spirit score?", "integer", 3, 7445],
  ["How many shot assists will Katrina Gorry have?", "integer", 3, 7445],
  ["How many shot assists will Ashley Hatch have?", "integer", 3, 7445],
  ["How many diving saves will the keeper for Utah Royals FC have?", "integer", 3, 7445],
  ["How many diving saves will the keeper for Washington Spirit have?", "integer", 3, 7445],
  ["Which team will have more interceptions?", "integer", 3, 7445],
  ["Who will win?", "triplet", 3, 7445]
]

questions_list.each do |question|
  Question.create!(display_text: question[0], response_type: question[1], match_id: question[2], ref_id: question[3])
end


# -----------------
# Users
# -----------------
users_list = [
  #id1
  ["Erica Amaya", "woso_girl", "@ericamaya6",  "2 Salem Green", "Salem", "MA", "01970","Eastern Time (US & Canada)", "USA", "erick@mail.com", "password", "bitmoji/erica.jpeg"],
  #id2
  ["Heather Yeager", "oceanlvr", "@oceanlvr328", "865 Franklin St", "Melrose", "MA", "02176", "Eastern Time (US & Canada)",  "USA", "angie@mail.com", "password", "bitmoji/heather.jpeg"],
  #id3
  ["Denise Duffy", "sunnysideup", "@denise_duffy", "142 Whitney Street", "San Francisco", "CA",  "94131", "Pacific Time (US & Canada)", "USA", "denise@deniseduffy.com", "password", "bitmoji/denise.jpeg"],
  #id4
  ["Tania Ardel", "sunnysidedown", "@ardelltania", "2700 Great Highway", "San Francisco", "CA", "96161", "Pacific Time (US & Canada)", "USA", "mike.duffy@usa.com", "password", "bitmoji/tania.jpeg"],
  #id5
  ["Rachel W", "Rachel_Will!", "@rachelwill", "111 A Street", "San Francisco", "CA", "96161", "Pacific Time (US & Canada)", "USA","notdan@usa.com", "password", "bitmoji/rachel.jpeg"],
  #id6
  ["Butch Loy", "sportyinmiami", "@HMLoy86", "111 A Street", "San Francisco", "CA", "96161", "Pacific Time (US & Canada)", "USA","danny@usa.com", "password", "bitmoji/butch.jpeg"],
  #id7
  ["Lura McCoy", "luramccoy81", "@wosogirl", "111 A Street", "San Francisco", "CA", "96161", "Pacific Time (US & Canada)", "USA","notsusan@usa.com", "password", "bitmoji/laura.jpeg"],
  #id8
  ["Alice Keeney", "navy_vet", "@alicesauce", "111 A Street", "San Francisco", "CA", "96161", "Pacific Time (US & Canada)", "USA","notjohn@usa.com", "password", "bitmoji/alice.jpeg"],
  #id9
  ["Hannah Basso", "ballergirl", "@bassohannah", "111 A Street", "San Francisco", "CA", "96161", "Pacific Time (US & Canada)", "USA","ballergirl@usa.com", "password", "bitmoji/hannah.jpeg"]
]


users_list.each do |user|
  User.create!(name: user[0], username: user[1], twitter_handle: user[2], street_address: user[3], city: user[4], state: user[5], zipcode: user[6], time_zone: user[7], country: user[8], email: user[9], password: user[10], avatar: user[11])
end


# -----------------
# Predictions
# -----------------
# [guess, reason, likes, user_id, match_id, question_id]
predictions_list = [
  #Past match predictions
  ["1", "", "", 1, 1, 1],
  ["4", "", "", 2, 1, 1, 2],
  ["3", "", "", 3, 1, 3],
  ["6", "", "", 4, 1, 4],
  ["8", "", "", 5, 1, 5],
  ["14", "", "", 6, 1, 6],
  ["Portland Thorns", "", "", 7, 1, 7],
  ["Seattle Reign", "", "", 8, 1, 8],
  [false, "", "", 9, 1, 9],
  [true, "", "", 1, 1, 10],
  #Future match predictions
  ["5", "", "", 2, 2, 11],
  ["5", "", "", 3, 2, 12],
  ["2", "", "", 4, 2, 13],
  ["7", "", "", 4, 2, 14],
  ["18", "", "", 5, 2, 15],
  ["14", "", "", 6, 2, 16],
  ["Chicago Red Stars", "", "", 7, 2, 17],
  ["Tie", "", "", 8, 2, 18],
  [true,  "", "", 9, 2, 19],
  [false, "", "", 9, 2, 20],
  ["0",           "", "", 4, 3, 21],
  ["2",           "", "", 4, 3, 22],
  ["1",           "", "", 5, 3, 23],
  ["2",           "", "", 4, 3, 24],
  ["1",           "", "", 4, 3, 25],
  ["3",           "", "", 3, 3, 26],
  ["Utah Royals", "", "", 2, 3, 27],
  ["Utah Royals", "", "", 1, 3, 28]
]
