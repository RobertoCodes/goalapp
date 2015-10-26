class GoalsController < ApplicationController

  before_action :require_logged_in, only: [:new,:create,:update]

  def index
    @goals = Goal.all
    render :index
  end

  def new
    @goal = Goal.new
    render :new
  end

  def create
    @goal = current_user.goals.new(goal_params)
    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update_attributes(goal_params)
      redirect_to goals_url
    else
      redirect_to goals_url
    end
  end

  def show
    @goal = Goal.find(params[:id])
    render :show
  end

  private

    def goal_params
      params.require(:goal).permit(:name, :private, :completed)
    end

end
