# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.techracing.ru"

SitemapGenerator::Sitemap.create do

  add service_path
  add custom_path
  add contacts_path

  add collections_path
  Collection.find_each do |collection|
    add collection_path(collection)
  end
  #match 'gallery/:collection_id/media/:id', to: 'media#show', as: 'media', via: 'get'

  add advertising_ford_focus_2_zamena_scepleniya_path

  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
