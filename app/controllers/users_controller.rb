class UsersController < ApplicationController
  def edit
    # @user = User.new(user_params)
    # if @user.delete
    #   redirect_to destroy_user_session_path, method: :delete, unauthenticated: 'ログインまたは登録が必要です'
    # end
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