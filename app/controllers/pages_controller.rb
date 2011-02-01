class PagesController < ApplicationController

  def home
      @title = "Hjem"
      if signed_in?
        @micropost = Micropost.new
        @feed_items = current_user.feed.paginate(:page => params[:page])
      end
    end


  def contact
    @title = "Kontakt"
  end
  
  def help
      @title = "Hjælp"
  end

  def about
    @title = "Om"
  end
end