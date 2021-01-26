require 'rubygems'
require "em-websocket"
require "thread"

module VMTracer
  class SocketIoServer
    attr_accessor :queue, :threads

    def initialize
      @queue = Queue.new
      @threads = []
      @connetcions = []
      threads << Thread.new do
        connections = @connetcions
        EM.run {
          connections = EM::Channel.new
          EM::WebSocket.start(:host => "localhost", :port => 4201) do |ws|
            ws.onopen { |handshake|
              ws.send("websocket open!!")
                loop do
                  if n = @queue.pop
                    if connections
                      connections.push(n)
                      puts "send data: #{n}"
                    end
                  end
                end
            }
          end
        }
      end
    end
  end
end
