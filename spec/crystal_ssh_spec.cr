require "./spec_helper"
require "socket"

describe CrystalSsh do
  it "initializes" do
    SSHServer.new(
      username: "foo",
      password: "bar",
      rsakey: "spec/foo.key",
      timeout: "360",
      port: "2020",
      banner: "Welcome to Crystal SSH :)",
      listen_address: "0.0.0.0",
    ).is_a?(SSHServer)
  end

  it "binds" do
    ssh = SSHServer.new(
      username: "foo",
      password: "bar",
      rsakey: "spec/foo.key",
      timeout: "360",
      port: "2020",
      banner: "Welcome to Crystal SSH :)",
      listen_address: "0.0.0.0",
    )
    spawn do
      # Without a spawn this will block
      # When client side is ready the check would be to see if the server responds
      ssh.listen
    end
  end

  it "cleans up" do
    ssh = SSHServer.new(
      username: "foo",
      password: "bar",
      rsakey: "spec/foo.key",
      timeout: "360",
      port: "2020",
      banner: "Welcome to Crystal SSH :)",
      listen_address: "0.0.0.0",
    )
    ssh.close.should eq(0)
  end
end
