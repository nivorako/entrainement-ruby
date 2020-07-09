# importer les fichiers requis
local_dir = File.expand_path('./src/cryptocurrencies', __FILE__)
$LOAD_PATH.unshift(local_dir)

require "cryptocurrencies_data.rb"
