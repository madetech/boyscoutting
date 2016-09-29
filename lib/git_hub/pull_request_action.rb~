module GitHub
  class PullRequestAction
    def initialize(payload)
      @payload = payload
    end

    def is_pr?
      payload.has_key?('pull_request')
    end

    def id
      payload['pull_request']['id']
    end

    def repository
      payload['repository']['full_name']
    end

    def state
      payload['pull_request']['state']
    end

    def author
      payload['pull_request']['user']['login']
    end

    def comments_url
      payload['pull_request']['comments_url']
    end

    def review_comments_url
      payload['pull_request']['review_comments_url']
    end

    private

    attr :payload
  end
end
