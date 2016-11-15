require 'rss'

class FeedsController < ActionController::Base
  def show
    # TODO:
    # - caching
    # - permitir generar el feed para fechas anteriores (lo soportan los clientes? que formato usan?)
    # - refactoring
    rss = RSS::Maker.make("atom") do |maker|
      maker.channel.author = "indexador"
      maker.channel.updated = Time.now.to_s
      maker.channel.about = feed_url(format: 'xml')
      maker.channel.title = "Indexador"

      Content.where(published_at: {'$gte' => Date.today.beginning_of_day, '$lt' => Date.today.end_of_day}).order('published_at desc').each do |content|
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

    respond_to do |format|
      format.xml { render plain: rss.to_s }
    end
  end
end
