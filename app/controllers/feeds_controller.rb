require 'rss'

class FeedsController < ActionController::Base
  before_action :load_contents

  def index
    # TODO:
    # - caching
    # - permitir generar el feed para fechas anteriores (lo soportan los clientes? que formato usan?)
    # - refactoring
    respond_to do |format|
      format.html { render :index }
      format.xml { render plain: atom_feed }
    end
  end

  private

  def load_contents
    @contents = Content.where(published_at: {'$gte' => Date.today.beginning_of_day, '$lt' => Date.today.end_of_day}).order('published_at desc')
  end

  def atom_feed
    rss = RSS::Maker.make("atom") do |maker|
      maker.channel.author = "indexador"
      maker.channel.updated = Time.now.to_s
      maker.channel.about = feeds_url(format: 'xml')
      maker.channel.title = "Indexador"

      @contents.each do |content|
        maker.items.new_item do |item|
          item.title = content.title
          item.link = content.url
          item.published = content.published_at.to_s
          item.updated = content.published_at.to_s
          item.content.type = 'html'
          item.content.content = content.body
          item.author = content.creator
        end
      end
    end

    rss.to_s
  end
end
