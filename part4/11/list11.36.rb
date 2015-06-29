require 'logger'

logger = Logger.new('/tmp/perfect_ruby.log')
logger.level = Logger::INFO

logger.info 'info level log.'
logger.debug 'debug level log.'

logger.close
