module LitaDotenv
  VERSION = '0.0.2'

  autoload :Loader, 'lita_dotenv/loader'

  class << self
    def new(config)
      LitaDotenv::Loader.new config
    end
  end
end