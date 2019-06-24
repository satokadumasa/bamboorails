class ApplicationController < ActionController::Base
  before_action :set_business
  protected
    def set_business
      @new_recv_count = current_user.recv_messages.where('created_at > ? ', current_user.last_sign_in_at).where(received_at: nil).where(deleted_at: nil).count if current_user
      @categories = Category.all()
      @forum_categories = ForumCategory.all()
      @base_url = root_url(only_path: false)
      @relationship = Relationship.new
      @now_url = request.url
      @site_name = Bamboo::Application.config.site_name
      @overview = 'Hesper.siteは小説などの投稿サイトです。気軽に登録して利用してください。'
    end
end
