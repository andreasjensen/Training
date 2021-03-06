class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy

  def index
      @title = "Alle brugere"
      @users = User.paginate(:page => params[:page])
    end
    
    def show
         @user = User.find(params[:id])
         @microposts = @user.microposts.paginate(:page => params[:page])
         @title = @user.name
       end
    

  
  def new
      @user = User.new
      @title = "new"
  end
   
   def edit
       @user = User.find(params[:id])
       @title = "Rediger"
   end
   
    def update
        @user = User.find(params[:id])
        if @user.update_attributes(params[:user])
          flash[:success] = "Opdateret."
          redirect_to @user
        else
          @title = "Rediger"
          render 'edit'
        end
      end
      
      def create
           @user = User.new(params[:user])
           if @user.save
             sign_in @user
             flash[:success] = "Velkommen til din træningsdagbog!"
             redirect_to @user
           else
             @title = "Tilmeld"
             render 'new'
           end
         end
   
         def destroy
             User.find(params[:id]).destroy
             flash[:success] = "Bruger slettet"
             redirect_to users_path
           end

           private

             def authenticate
               deny_access unless signed_in?
             end

             def correct_user
               @user = User.find(params[:id])
               redirect_to(root_path) unless current_user?(@user)
             end
             
             def admin_user
                   redirect_to(root_path) unless current_user.admin?
             end
           end
             
             
            
            
     
     