# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = (ENV["ASSETS_VERSION"] || "1.0")
Rails.application.config.assets.precompile += %w( jquery.js )
Rails.application.config.assets.precompile += %w( jquery_ujs.js )
Rails.application.config.assets.precompile += %w( jquery.rateyo.js )
Rails.application.config.assets.precompile += %w( toolkit.css )
Rails.application.config.assets.precompile += %w( toolkit.js )
Rails.application.config.assets.precompile += %w( default.css )
Rails.application.config.assets.precompile += %w( jquery.rateyo.css )
Rails.application.config.assets.precompile += %w( blueimp-gallery.min.css )
Rails.application.config.assets.precompile += %w( bootstrap.min.css )


Rails.application.config.assets.precompile += %w( dependent_fields.js )
Rails.application.config.assets.precompile += %w( jquery.blueimp-gallery.min.js )

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
