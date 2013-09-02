class PumpController
    def initialize(port)
        @sp = SerialPort.new(port, 9600, 8, 1,  SerialPort::NONE)
    end
    def send(motor_id, speed)
        speed = 45 if speed < 45
        speed = 254 if speed > 254
        if motor_id > 7 || motor_id < 0
            throw Exception.new('Invalid motor id.')
        end
        @sp.print([255, motor_id, speed].pack('C*'))
    end
    def close
        @sp.close
    end
end