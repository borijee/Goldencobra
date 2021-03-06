require "friendly_id"
require 'ancestry'
require 'devise'
require 'cancan'
require 'meta_tags'
require 'sass'
require 'sprockets'
require 'sprockets/railtie'
require 'sass-rails'
require 'acts-as-taggable-on'
require 'paperclip'
require 'liquid'
require 'geocoder'
require "paper_trail"
require 'sunspot_rails'
require 'sunspot_solr'
# require "pdfkit"
# require 'wkhtmltopdf-binary'
# require "wicked_pdf"
require 'sidekiq'
require 'sinatra'
require 'slim'
require 'geokit'



module Goldencobra
  class Engine < ::Rails::Engine
    isolate_namespace Goldencobra
    initializer "goldencobra.load_app_instance_data" do |app|
      #app.class.configure do
      #  #Pull in all the migrations from goldencobra to the application
      #  config.paths['db/migrate'] += Goldencobra::Engine.paths['db/migrate'].existent
      #end
    end
    config.to_prepare do
      ApplicationController.helper(Goldencobra::ApplicationHelper)
      ActionController::Base.helper(Goldencobra::ApplicationHelper)
      DeviseController.helper(Goldencobra::ApplicationHelper)
      Devise::SessionsController.helper(Goldencobra::ApplicationHelper)
      Devise::PasswordsController.helper(Goldencobra::ApplicationHelper)

      ApplicationController.helper(Goldencobra::ArticlesHelper)
      ActionController::Base.helper(Goldencobra::ArticlesHelper)
      DeviseController.helper(Goldencobra::ArticlesHelper)
      Devise::SessionsController.helper(Goldencobra::ArticlesHelper)
      Devise::PasswordsController.helper(Goldencobra::ArticlesHelper)
    end
  end
end
