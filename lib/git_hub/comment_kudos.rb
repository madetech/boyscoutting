module GitHub
  class CommentKudos
    def initialize(comments)
      @comments = comments
    end

    def comments_with_kudos(kudos_character:, author:)
      comments.select do |comment|
        comment[:body].include?(kudos_character) &&
        comment[:user] != author
      end
    end

    private

    attr :comments
  end
end
