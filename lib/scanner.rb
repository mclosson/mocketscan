require 'socket_adapter'

class Scanner

  def initialize
    self.socket_adapter = SocketAdapter.new
  end

  def live!
    socket_adapter.setstate(:live)
  end

  def tcpscan(host, *ports)
    statuses = {}
    ports.each do |port|
      begin
        socket = socket_adapter.open(host, port)
        statuses[port.to_s] = 'open'
      rescue Exception => exception
        statuses[port.to_s] = 'closed'
      end
    end
    return statuses
  end

  def test!
    socket_adapter.setstate(:test)
  end

  private

  attr_accessor :socket_adapter

end
