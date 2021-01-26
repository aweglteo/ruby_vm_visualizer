module VMTracer
  class VM
    attr_reader :bytecode, :stack

    def initialize(sequence, server)
      @sequence = sequence
      @stack = []
      @server = server 
    end

    def run
      @sequence.to_a.last.each do |instruction|
        next unless instruction.is_a?(Array)
        sleep 1
        opecode = instruction[0]
        operand = instruction[1..-1]

        puts opecode.to_s
        @server.queue.push(opecode.to_s)
      end 

    end

    def push(val)
      @stack.push(val)
    end

    def pop
      @stack.pop
    end
  end
end
