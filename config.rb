activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :sprockets

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :relative_assets
  set :relative_links, true
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.deploy_method = :git
end

activate :livereload

activate :i18n, :path => "/:locale/", :mount_at_root => false

# helpers do

#   def translated_url(locale)
#     # Assuming /:locale/page.html
#     page_name = current_page.split("/", 2).last.sub(/\..*$/, '')
#     untranslated_path = t(:paths).index(page_name)

#     begin
#       translated = I18n.translate!("paths.#{untranslated_path}", locale: locale)
#     rescue I18n::MissingTranslationData
#       translated = untranslated_path
#     end

#     "/#{locale}/#{translated}.html"
#   end

#   def other_langs
#     langs - [I18n.locale]
#   end

# end
