require 'net/http'

class PrEventsController < ApplicationController
  def create
    pr_service = GitHub::PullRequestAction.new(params)

    if pr_service.is_pr? && pr_service.state == 'closed'
      comments = GitHub::PullRequestComments.fetch(pr_service.comments_url)
    end
  end
end
