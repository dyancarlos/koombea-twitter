module Relationships
  class Create
    def initialize(current_user:, followed_id:)
      @current_user = current_user
      @followed_id = followed_id
    end

    def call
      return unless followed

      @current_user.following << followed
    end

    private

    def followed
      User.find_by(id: @followed_id)
    end
  end
end