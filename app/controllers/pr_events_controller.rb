require 'net/http'

class PrEventsController < ApplicationController
  def create
    pr_service = GitHub::PullRequestAction.new(params)

    if pr_service.is_pr? && pr_service.state == 'closed'
      comments = GitHub::PullRequestComments.new.fetch(
        [
          pr_service.comments_url,
          pr_service.review_comments_url
        ]
      )
      comment_kudos = GitHub::CommentKudos.new(comments)
      comments_with_kudos = comment_kudos.comments_with_kudos(kudos_character: '🔥 ', author: pr_service.author)
      if comments_with_kudos.present?
        Merit.create!(username: pr_service.author,
                      description: pr_service.title)
      end
    end
  end

  def index
    @users = Merit.group(:username).count
    @kit = IMGKit.new(render_to_string action: 'index', layout: false)

    send_data(@kit.to_jpg, type: 'image/jpeg', disposition: 'inline')
  end
end
