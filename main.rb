require "serialport"
require './pump_controller'
require 'eventmachine'
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
        @buffer = ''
        puts "Command format: MOTOR_ID[,MOTOR_ID....] LEVEL"
        print "$ "
    end

    def process_command
        begin
            cmd = @buffer.split(' ')
            cmd[0].split(',').each{|m_id|
                @pc.send(m_id.to_i+1, cmd[1].to_i)
            }
        rescue
        end
    end
    def receive_data(data)
        data.split('').each{|k|
            if k == "\n"
                process_command
                @buffer = ''
                print "$ "
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

