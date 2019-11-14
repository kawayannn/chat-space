class UsersController < ApplicationController
  def edit
    # @user = User.new(user_params)
    # if @user.delete
    #   redirect_to destroy_user_session_path, method: :delete, unauthenticated: 'ログインまたは登録が必要です'
    # end
  end

  def index
    return nil if params[:keyword] == ""
    @users = User.where(['name LIKE ?', "%#{params[:keyword]}%"]).where.not(id: current_user.id).limit(10)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path, notice: 'ユーザー情報を更新しました'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:email)
  end


end