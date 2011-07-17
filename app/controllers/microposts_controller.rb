class MicropostsController < ApplicationController


  def create
    # in microposts controller, user_id and page come from hidden form fields
    @user = User.find(params[:user_id])
    @micropost = @user.microposts.build(params[:micropost])
    if (@micropost.save)
      flash[:success] = "Micropost created!"
      redirect_to user_path(@user)   # will show all microposts with a new empty micropost form
    else   #re-render the users/show page
      @microposts = @user.microposts.paginate(:page => params[:page])
      @title = @user.name
      render "users/show"
    end
  end

  def destroy

  end

end
