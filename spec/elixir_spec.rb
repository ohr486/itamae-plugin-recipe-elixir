require "spec_helper"

describe file("/root/.kerlrc") do
  it { should be_file }
end

describe file("/etc/profile.d/elixir.sh") do
  it { should be_file }
  its(:content) { should match /1\.5\.1/ }
end

describe file("/usr/bin/kerl") do
  it { should be_file }
  it { should be_executable }
end

describe command("source /etc/profile.d/kerl.sh && \
                  source /etc/profile.d/elixir.sh && \
                  iex -v") do
  its(:stdout) { should contain("1.5.1") }
end
