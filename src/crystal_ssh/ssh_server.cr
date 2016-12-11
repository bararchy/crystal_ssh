class SSHServer
  def initialize(username, password, rsakey, port = "22", listen_address = "0.0.0.0", timeout = "360", banner = "Welcome to Crystal SSH")
    @user_name = username.as String
    @password = password.as String
    @rsakey = rsakey.as String
    @port = port.as String
    @listen_address = listen_address.as String
    @timeout = timeout.as String
    @banner = banner.as String

    # initialize the ssh instance
    @sshbind = LibSSH.ssh_bind_new
    @sshsession = LibSSH.ssh_new

    # Configure the session intance
    LibSSH.ssh_bind_options_set(@sshbind, LibSSH::SSH_BIND_OPTIONS_BINDADDR, @listen_address) if @listen_address.is_a? String
    LibSSH.ssh_bind_options_set(@sshbind, LibSSH::SSH_BIND_OPTIONS_BINDPORT_STR, @port) if @port.is_a? String
    LibSSH.ssh_bind_options_set(@sshbind, LibSSH::SSH_BIND_OPTIONS_RSAKEY, @rsakey) if @rsakey.is_a? String
    LibSSH.ssh_options_set(@sshbind, LibSSH::SSH_OPTIONS_TIMEOUT, @timeout) if @timeout.is_a? String
    LibSSH.ssh_bind_options_set(@sshbind, LibSSH::SSH_BIND_OPTIONS_BANNER, @banner) if @banner.is_a? String
  end

  def listen
    raise "Error in SSH Bind Instance" unless @sshbind.is_a? Void*
    raise "Error in SSH Session Instance" unless @sshsession.is_a? Void*
    binded = LibSSH.ssh_bind_listen(@sshbind)
    raise "#Error binding to port: #{String.new(LibSSH.ssh_get_error(@sshbind))}" unless binded >= 0
    accept = LibSSH.ssh_bind_accept(@sshbind, @sshsession)
    raise "#Error accepting clients: #{String.new(LibSSH.ssh_get_error(@sshbind))}" unless accept >= 0
    exchange = LibSSH.ssh_handle_key_exchange(@sshsession)
    raise "#Error in key exchange: #{String.new(LibSSH.ssh_get_error(@sshsession))}" unless exchange >= 0
    # auth_loop
    #  chan_loop
    #   shell_loop
  end

  def close
    LibSSH.ssh_bind_free(@sshbind) if @sshbind.is_a? Void*
    LibSSH.ssh_disconnect(@sshsession) if @sshsession.is_a? Void*
  end
end
