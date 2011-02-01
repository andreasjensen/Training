class MicropostsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]

  def create
      @micropost  = current_user.microposts.build(params[:micropost])
      if @micropost.save
        flash[:success] = "Indlæg oprettet"
        redirect_to root_path
      else
        render 'pages/home'
      end
    end

    def destroy
        @micropost.destroy
        redirect_root_path
      end

      private

        def authorized_user
          @micropost = Micropost.find(params[:id])
          redirect_to root_path unless current_user?(@micropost.user)
        end
        
end