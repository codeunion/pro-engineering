module VotesHelper
  def format_response(vote)
    case vote.response
    when 1
      "Yes"
    when 0
      "No"
    end
  end
end
