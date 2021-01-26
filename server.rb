require_relative "tracer/cli"

if $0 == __FILE__
  cli = VMTracer::CLI.new
  cli.run
end
