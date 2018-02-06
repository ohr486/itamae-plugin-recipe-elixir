require "spec_helper"

describe file("/etc/profile.d/elixir.sh") do
  it { should be_file }
  its(:content) { should match /1\.6\.1/ }
end

describe command(". /etc/profile.d/kerl.sh && \
                  . /etc/profile.d/elixir.sh && \
                  iex -v") do
  its(:stdout) { should contain("1.6.1") }
end
