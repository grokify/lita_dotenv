require 'dotenv'
require 'multi_json'

module LitaDotenv
  class Loader
    attr_accessor :config

     def initialize(config)
       @config = config
       Dotenv.load
       config_env
     end

     def config_env
      ENV.keys.grep(/^LITA_/i) do |key|
        val = ENV[key]
        slugs = key.split('__')
         # Convert value types
        if slugs.length==2
          type = slugs[1].downcase
          if type=='typesym'
            val = val.to_sym
          elsif type == 'typebool'
            val = val.downcase == 'true' ? true : false
          elsif type == 'typeint' && type =~ /^s*[0-9]+\s*$/
            val = val.to_i
          elsif type == 'typejson'
            val = MultiJson.decode val
          elsif type == 'typejsonsym'
            val = MultiJson.decode val, symbolize_keys: true
          end
        end
         # Convert path
        path = slugs[0].split('_')
        path.shift # Remove LITA prefix
        path.each_with_index do |part, i|
          if part =~ /[a-z]/
            path[i] = part.gsub(/([A-Z])/, '_\1')
          end
          path[i].downcase!
        end
        if path.length == 2
          @config.send(path[0]).send("#{path[1]}=",val)
        elsif path.length == 3
          @config.send(path[0]).send(path[1]).send("#{path[2]}=",val)
        else
          raise "Config path length #{path.length} not supported for #{path.join('.')}."
        end
      end
    end
  end
end
