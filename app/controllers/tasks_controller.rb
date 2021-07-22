class TasksController < ApplicationController
    before_action :require_user_logged_in, only: [:index, :show, :new]
    before_action :correct_user, only: [:destroy]
    
    def index
         @tasks = Task.where(user_id: @current_user.id).order("created_at DESC")
    end
    
    def show
        @task = current_user.tasks.find(params[:id])
    end 
    
    def new
        @task = Task.new
    end
    
    def create
        @task = current_user.tasks.new(task_params)
        if @task.save
            flash[:success] = 'タスクが作成されました'
            redirect_to @task
        else
            flash.now[:danger] = 'タスクが投稿されませんでした'
            render :new
        end
    end
    
    def edit
        @task = current_user.tasks.find(params[:id])
    end
    
    def update
        @task = current_user.tasks.find(params[:id])
        
        if @task.update(task_params)
            flash[:success] = 'タスクが更新されました'
            redirect_to @task
        else
            flash.now[:danger] = 'タスクが更新されませんでした'
            render :edit
        end
    end
    
    def destroy
        @task.destroy
        flash[:success] = 'タスクを削除しました。'
        redirect_to tasks_url
    end
    
    private
    
    def task_params
        params.require(:task).permit(:content, :status)
    end
    
    def correct_user
        @task = current_user.tasks.find_by( id: params[:id] )
        unless @micropost
            redirect_to root_url
        end
    end
    
end
