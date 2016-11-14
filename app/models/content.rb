class Content
  include Mongoid::Document

  field :title, type: String
  field :body, type: String
  field :url, type: String
  field :source, type: String
  field :created_at, type: DateTime

  field :creator, type: String
  field :published_at, type: DateTime
end
