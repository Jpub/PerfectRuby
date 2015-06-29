require 'logger'

logger = Logger.new('/tmp/perfect_ruby.log')

logger.info 'info level log.'
logger.debug 'debug level log.'

logger.close
