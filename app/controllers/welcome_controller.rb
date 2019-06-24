class WelcomeController < ApplicationController
  def index
    @newses = News.paginate(page: params[:page], per_page: 5).order(created_at: :desc)
    @notes = Note.paginate(page: params[:page], per_page: 5).where(public_status: [0,1]).order(created_at: :desc)
    @pages = Page.paginate(page: params[:page], per_page: 5).where(public_status: [0,1]).order(created_at: :desc)
    if current_user
	    @bookmarks = Bookmark.left_outer_joins(note: :pages).where('pages.created_at > ?',current_user.last_sign_in_at)
	    following_ids = current_user.following_relationships.map{|following_relationship| following_relationship.following_id}
	    @follow_user_notes = Note.left_outer_joins(:pages).where(public_status: [0,1]).where(user_id: following_ids).where('pages.created_at > ?', current_user.last_sign_in_at)
	    # @follow_user_notes = @follow_user_notes.where('pages.public_status IN (?)' [0,1])
    end
  end
end
