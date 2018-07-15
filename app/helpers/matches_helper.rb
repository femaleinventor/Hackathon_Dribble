module MatchesHelper
  # def find_future_matches(matches)
  # #Returns an array of future matches
  #   matches.select{|match| match.start_time > Time.now && match.start_date > Date.today}
  # end

  def format_match_date(match)
    match_date = match.start_date
    match_date.strftime("%m/%d/%Y at %I:%M%p")
  end

  def format_match_date_english(match)
     date = match.start_date.strftime("%B #{match.start_date.day.ordinalize}, %Y")
     time = match.start_time.strftime("%I:%M%p")
     "#{date} at #{time}"
  end

  def sort_matches_by_date(matches)
    matches.sort_by{ |match| match.start_date }
  end
end
