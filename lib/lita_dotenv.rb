module LitaDotenv
  VERSION = '0.0.1'

  autoload :Loader, 'lita_dotenv/loader'

  class << self
    def new(config)
      LitaDotenv::Loader.new config
    end
  end
end