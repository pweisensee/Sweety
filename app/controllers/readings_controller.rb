class ReadingsController < ApplicationController
  def new
  end

  def create
    @article = Article.new(@article = Article.new(params.require(:reading).permit(:blood_glucose)))

    @article.save
    redirect_to @article
  end
end
