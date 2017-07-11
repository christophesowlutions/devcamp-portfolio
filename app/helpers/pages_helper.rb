module PagesHelper
  def twitter_parser tweet
      
      regex = %r{
        \b
        (
          (?: [a-z][\w-]+:
           (?: /{1,3} | [a-z0-9%] ) |
            www\d{0,3}[.] |
            [a-z0-9.\-]+[.][a-z]{2,4}/
          )
          (?:
           [^\s()<>]+ | \(([^\s()<>]+|(\([^\s()<>]+\)))*\)
          )+
          (?:
            \(([^\s()<>]+|(\([^\s()<>]+\)))*\) |
            [^\s`!()\[\]{};:'".,<>?«»“”‘’]
          )
        )
      }ix

      tweet.gsub(regex) do |url|  # Global Substitution, takes in a regex as a parameter and replaces it with something else
        "<a href=#{url} target='_blank'> #{url}</a>"

        # this will take any string that matches the regex, then substitute it for an acttual URL that opens in a new tab
      end.html_safe
  end
end
