require 'optparse'
require_relative "vm"
require_relative "socket_io"

module VMTracer
  class CLI
    def initialize
      @argv = ARGV
      parse_option
    end

    def run
      exit 0 if @path.nil?
      bytecode = RubyVM::InstructionSequence.compile_file(@path, false).to_a
      socketserver = VMTracer::SocketIoServer.new

      vm = VMTracer::VM.new(bytecode, socketserver)
      
      vm.run
      
      socketserver.threads.each { |thr| thr.join }
    end

    def parse_option
      @parser = OptionParser.new do |o|
        o.on "-t", "--target program", "exec target program" do |arg|
          @path = arg
        end
      end
      @parser.parse(@argv)
    end

  end
end
