module Lognow
  def self.print(status, event, data={}, error=nil)
    Printer.new(LOGGER, status, event, data, error).print
  end
end