module GitHub
  class PullRequestComments
    require 'net/http'
    require 'json'

    def fetch(comment_urls)
      comment_urls.map do |comment_url|
        response = fetch_comments(comment_url)
        parse_comments(response)
      end.flatten
    end

    private

    def fetch_comments(url)
      uri = URI(url)
      JSON.parse(Net::HTTP.get(uri))
    end

    def parse_comments(response)
      response.map do |comment|
        { user: comment['user']['login'],
          body: comment['body'] }
      end
    end
  end
end
