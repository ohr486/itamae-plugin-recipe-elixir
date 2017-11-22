# --- SETTINGS ---

elixir_version = node[:elixir][:version]

directory "/usr/local/elixir" do
  mode "0755"
  owner "root"
  group "root"
end

template "/etc/profile.d/elixir.sh" do
  action :create
  source "templates/elixir.sh.erb"
  owner "root"
  group "root"
  mode "644"
  variables(elixir_version: elixir_version)
end

# --- INSTALL ---

execute "# get zip file" do
  not_if "test -e /usr/local/elixir/#{elixir_version}.zip"
  cwd "/usr/local/elixir"
  command "wget https://github.com/elixir-lang/elixir/releases/download/v#{elixir_version}/Precompiled.zip -O #{elixir_version}.zip"
end

execute "# unizp file" do
  not_if "test -e /usr/local/elixir/#{elixir_version}"
  cwd "/usr/local/elixir"
  command "unzip #{elixir_version}.zip -d #{elixir_version}"
end

#execute "source /etc/profile.d/elixir.sh"
#execute "mix local.hex --force"
#execute "mix local.rebar --force"
