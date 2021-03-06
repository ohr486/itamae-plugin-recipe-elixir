require "serverspec"
require "net/ssh"
require "tempfile"

set :backend, :ssh

if ENV["ASK_SUDO_PASSWORD"]
  set :sudo_password, ask("Enter sudo password: ") { |q| q.echo = false }
else
  set :sudo_password, ENV["SUDO_PASSWORD"]
end

host = ENV["TARGET_HOST"]

`vagrant up #{host}`

config = Tempfile.new("", Dir.tmpdir)
config.write(`vagrant ssh-config #{host}`)
config.close

options = Net::SSH::Config.for(host, [config.path])

options[:user] ||= Etc.getlogin

set :host, options[:host_name] || host
set :ssh_options, options

require "yaml"
require "itamae/node"

def node
  return @node if @node
  hash = YAML.load_file("#{__dir__}/../recipes/node.yml")
  @node = Itamae::Node.new(hash, Specinfra.backend)
end
