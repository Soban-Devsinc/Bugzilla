class BugsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_bug, only: [:show, :edit, :update, :destroy]
  def index
    @bugs = current_user.bugs
  end

  def new
    @bug = Bug.new
  end

  def create
    @bug = current_user.bugs.create(bug_params)
    if @bug.save
      redirect_to bugs_path, notice: 'Bug was successfully created.'
    else
      flash[:errors] = @bug.errors.full_messages
      redirect_to new_bug_url
    end
  end

  def show
  end

  def edit
  end

  def update
    if @bug.update(bug_params)
      redirect_to bug_path(@bug), notice: 'Bug was successfully updated.'
    else
      flash[:errors] = @bug.errors.full_messages
      render :edit
    end
  end

  def destroy
    @bug.destroy
    redirect_to bugs_path, notice: 'Bug was successfully deleted.'
  end

  protected

  def set_bug
    @bug = Bug.find(params[:id])
  end

  def bug_params
    params.require(:bug).permit(:title, :description, :deadline, :screenshot, :type, :status)
  end


end
