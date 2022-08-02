class RecordsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @records = RecordsService.new(params).call
  end

  def new
    @record = Record.new
  end

  def edit
    record
  end

  def create
    @record = Record.new(record_params.merge(user_id: current_user.id))
    if @record.save
      flash[:success] = 'Created!'
      redirect_to root_path
    else
      flash[:danger] = 'Incorrect!'
      render 'new'
    end
  end

  def update
    if record.update(record_params)
      flash[:success] = 'Updated!'
      redirect_to root_path
    else
      flash[:danger] = 'Incorrect!'
      render 'edit'
    end
  end

  def destroy
    record.destroy!
    redirect_to root_path
  end

  def delete_records
    User.find_by_id(params[:user_id]).records.destroy_all
    redirect_to root_path
  end

  private

  def record_params
    params.require(:record).permit(:cost, :date, :category_id, :user_id)
  end

  def record
    @record = Record.find(params[:id])
  end
end
