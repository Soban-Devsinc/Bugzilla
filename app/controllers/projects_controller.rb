class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_project, only: [:show, :edit, :update, :destroy]
  def index
    @projects = current_user.projects # for manager & developer
    @allprojects = Project.all # for qa
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.create(project_params)
    if @project.save
      redirect_to projects_path, notice: 'Project was successfully created.'
    else
      flash[:errors] = @project.errors.full_messages
      redirect_to new_project_url
    end
  end

  def show
    @managers = @project.users.where(usertype: 'Manager')
    @developers = @project.users.where(usertype: 'Developer')
  end

  def edit
    @developer = User.where(usertype: 'Developer')
  end

  def update
    if @project.update(project_params)
      redirect_to project_path(@project), notice: 'Project was successfully updated.'
    else
      flash[:errors] = @project.errors.full_messages
      render :edit
    end
  end


  def destroy
    @project.destroy
    redirect_to projects_path, notice: 'Project was successfully deleted.'
  end

  protected

  def get_project
    @project = Project.find(params[:id])
    @developer = @project.users.where(usertype: 'Developer')
  end

  def project_params
    params.require(:project).permit(:id, :title, :description, user_ids: [])
  end
end
