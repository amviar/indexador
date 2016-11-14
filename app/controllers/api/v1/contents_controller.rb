class Api::V1::ContentsController < ActionController::Base
  def create
    @content = Content.new(content_params)

    if @content.save
      render status: :created, nothing: true
    else
      render json: @content.errors.full_messages.to_json, status: :bad_request
    end
  end

  private

  def content_params
    params.permit(:title, :body, :url, :source, :creator, :published_at)
  end
end
