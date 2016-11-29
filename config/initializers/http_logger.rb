if Rails.env.development?
  HttpLogger.colorize = true # Default: true
  HttpLogger.log_headers =true  # Default: false
  HttpLogger.log_request_body  = true  # Default: true
  HttpLogger.log_response_body = true  # Default: true
  HttpLogger.level = :debug # Desired log level as a symbol. Default: :debug
end
