require "serialport"
require './pump_controller'

#
# Demp script for  PumpController class
#
port_str = "/dev/tty.usbserial-DAWR13BI"
pc = PumpController.new(port_str)

class PumpCommandHandler < EM::Connection
    include EM::Protocols::LineText2
    attr_reader :pc

    def initialize(pc)
        @pc = pc
        @buffer = []
    end

    def process_command
        begin
            @pc.send(@buffer[0].to_i, @buffer[1..-1].join.to_i)
        rescue
        end
    end
    def receive_data(data)
        data.split('').each{|k|
            if k == "\n"
                process_command
                @buffer = []
            else
                @buffer << k
            end
        }
    end
end


STDIN.sync
EventMachine::run do
    EventMachine.open_keyboard(PumpCommandHandler, pc)
end

pc.close

