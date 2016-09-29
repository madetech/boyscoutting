require 'net/http'

class PrEventsController < ApplicationController
  def create
    pr_service = GitHub::PullRequestAction.new(params)

    if pr_service.is_pr? && pr_service.state == 'closed'
      url = URI.parse(pr_service.comments_url)
      req = Net::HTTP::Get.new(url.to_s)
      @response = Net::HTTP.start(url.host, url.port) do |http|
        http.request(req)
      end
    end
  end

  def index
  end
end
