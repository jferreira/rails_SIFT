class TopicsController < ApplicationController
  # skip_before_action :authenticate!, only :index

  def index
    if params[:query].present?
      @documents = PgSearch.multisearch(params[:query]).limit(10)
      @articles = Article.all
      @topics = Topic.all
    else
      @documents = []
      @articles = Article.all
      @topics = Topic.all
    end
  end

  def show
      @articles = Article.all

      @topic = Topic.find(params[:id])
      @events = @topic.events
  end

end
