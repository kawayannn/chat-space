class GroupsController < ApplicationController
  
  before_action :set_group, only: [:edit, :update]

  def index
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create 
    
    @group = Group.new(group_params)
    @group.users = []
    if @group.save
      # 中間テーブルに値を保存するための追加コード
      @group.user_ids = group_params[:user_ids]
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def update
    if @group.update
      redirect_to root_path, notice: 'グループを編集しました'
    else
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def set_group
    @group = Group.find(params[:id])
  end

end