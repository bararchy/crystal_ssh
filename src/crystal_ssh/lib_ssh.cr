@[Link("libssh")]
lib LibSSH
  # General SSH Options
  SSH_OPTIONS_HOST                        =  0
  SSH_OPTIONS_PORT                        =  1
  SSH_OPTIONS_PORT_STR                    =  2
  SSH_OPTIONS_FD                          =  3
  SSH_OPTIONS_USER                        =  4
  SSH_OPTIONS_SSH_DIR                     =  5
  SSH_OPTIONS_IDENTITY                    =  6
  SSH_OPTIONS_ADD_IDENTITY                =  7
  SSH_OPTIONS_KNOWNHOSTS                  =  8
  SSH_OPTIONS_TIMEOUT                     =  9
  SSH_OPTIONS_TIMEOUT_USEC                = 10
  SSH_OPTIONS_SSH1                        = 11
  SSH_OPTIONS_SSH2                        = 12
  SSH_OPTIONS_LOG_VERBOSITY               = 13
  SSH_OPTIONS_LOG_VERBOSITY_STR           = 14
  SSH_OPTIONS_CIPHERS_C_S                 = 15
  SSH_OPTIONS_CIPHERS_S_C                 = 16
  SSH_OPTIONS_COMPRESSION_C_S             = 17
  SSH_OPTIONS_COMPRESSION_S_C             = 18
  SSH_OPTIONS_PROXYCOMMAND                = 19
  SSH_OPTIONS_BINDADDR                    = 20
  SSH_OPTIONS_STRICTHOSTKEYCHECK          = 21
  SSH_OPTIONS_COMPRESSION                 = 22
  SSH_OPTIONS_COMPRESSION_LEVEL           = 23
  SSH_OPTIONS_KEY_EXCHANGE                = 24
  SSH_OPTIONS_HOSTKEYS                    = 25
  SSH_OPTIONS_GSSAPI_SERVER_IDENTITY      = 26
  SSH_OPTIONS_GSSAPI_CLIENT_IDENTITY      = 27
  SSH_OPTIONS_GSSAPI_DELEGATE_CREDENTIALS = 28
  SSH_OPTIONS_HMAC_C_S                    = 29
  SSH_OPTIONS_HMAC_S_C                    = 30

  # SSH Bind Options
  SSH_BIND_OPTIONS_BINDADDR          = 0
  SSH_BIND_OPTIONS_BINDPORT          = 1
  SSH_BIND_OPTIONS_BINDPORT_STR      = 2
  SSH_BIND_OPTIONS_HOSTKEY           = 3
  SSH_BIND_OPTIONS_DSAKEY            = 4
  SSH_BIND_OPTIONS_RSAKEY            = 5
  SSH_BIND_OPTIONS_BANNER            = 6
  SSH_BIND_OPTIONS_LOG_VERBOSITY     = 7
  SSH_BIND_OPTIONS_LOG_VERBOSITY_STR = 8
  SSH_BIND_OPTIONS_ECDSAKEY          = 9

  # SSH Messages
  SSH_REQUEST_AUTH         = 1
  SSH_REQUEST_CHANNEL_OPEN = 2
  SSH_REQUEST_CHANNEL      = 3
  SSH_REQUEST_SERVICE      = 4
  SSH_REQUEST_GLOBAL       = 5

  # SSH Auth Types
  SSH_AUTH_METHOD_UNKNOWN     =      0
  SSH_AUTH_METHOD_NONE        = 0x0001
  SSH_AUTH_METHOD_PASSWORD    = 0x0002
  SSH_AUTH_METHOD_PUBLICKEY   = 0x0004
  SSH_AUTH_METHOD_HOSTBASED   = 0x0008
  SSH_AUTH_METHOD_INTERACTIVE = 0x0010
  SSH_AUTH_METHOD_GSSAPI_MIC  = 0x0020

  # Initializars
  fun ssh_init : Int32
  fun ssh_new : Void*
  fun ssh_bind_new : Void*

  # Cleanups
  fun ssh_bind_free(bind_struct : Void*) : Int32
  fun ssh_disconnect(session_struct : Void*) : Int32
  fun ssh_message_free(Void*) : Int32

  # Bind functions
  fun ssh_bind_options_set(bind_struct : Void*, bind_option : Int32, bind_addr : UInt8*) : Int32
  fun ssh_bind_listen(bind_struct : Void*) : Int32
  fun ssh_bind_accept(bind_struct : Void*, session_struct : Void*) : Int32

  # General Options
  fun ssh_options_set(bind_struct : Void*, option : Int32, option_value : UInt8*) : Int32

  # Helpers
  fun ssh_get_error(session_struct : Void*) : UInt8*

  # Message Handlers
  fun ssh_message_get(session_struct : Void*) : Void*
  fun ssh_message_type(ssh_message : Void*) : Int32
  fun ssh_message_subtype(Void*) : Int32
  fun ssh_message_auth_user(UInt8*) : UInt8*
  fun ssh_message_auth_password(UInt8*) : UInt8*

  # Key Handlers
  fun ssh_handle_key_exchange(session_struct : Void*) : Int32

  # Error handeling
  fun ssh_get_error(bind_struct : Void*) : UInt8*

  #         attach_function :ssh_message_auth_set_methods, [SSHMessage, :int], :int
  #         attach_function :ssh_message_reply_default, [SSHMessage], :int
  #         attach_function :ssh_message_auth_user, [SSHMessage], :string
  #         attach_function :ssh_message_auth_password, [SSHMessage], :string
  #         attach_function :ssh_message_auth_reply_success, [SSHMessage, :int], :int
  #         attach_function :ssh_message_channel_request_open_reply_accept, [SSHMessage], SSH_channel
  # attach_function :ssh_message_channel_request_reply_success, [SSHMessage], :int

end
