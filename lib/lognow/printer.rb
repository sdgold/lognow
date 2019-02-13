module Lognow
  class Printer
    def initialize(logger, status, event, data, error)
      @logger = logger
      @status = status
      @event  = event
      @data   = data
      @error  = error
    end

    def print
      i = {
        status: @status,
        timestamp: Time.now,
        event: AppEvents::TYPES.fetch(@event),
        data: @data
      }
      i[:error] = @error if @error

      @logger.info i.to_json
    end
  end
end