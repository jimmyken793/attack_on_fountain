require "serialport"
require './pump_controller'

#
# Demp script for  PumpController class
#
port_str = "/dev/tty.usbserial-DAWR13BI"
pc = PumpController.new(port_str)
pc.send(0, 254)
sleep(100)
pc.send(0, 0)
pc.close

