require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(_File_) + '/lib/*.rb'].each { |file| require file }
