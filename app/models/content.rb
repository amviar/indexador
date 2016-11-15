class Content
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  field :title, type: String
  field :body, type: String
  field :url, type: String
  field :source, type: String

  field :creator, type: String
  field :published_at, type: DateTime
end
