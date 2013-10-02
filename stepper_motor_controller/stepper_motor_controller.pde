import processing.serial.*;
import java.lang.Thread;
import controlP5.*;

Slider2D s;
ControlP5 cp5;
MotorController mc;
void setup() {
  size(500, 600);
  stroke(0);
  cp5 = new ControlP5(this);
  s = cp5.addSlider2D("xy").setPosition(50,50).setSize(400,400).setArrayValue(new float[] {50, 100});
  cp5.addButton("btnReset").setPosition(150,540).setSize(200,20);
  cp5.addButton("btnMOff").setPosition(150,510).setSize(200,20);
  cp5.addSlider("speed").setPosition(150,480).setSize(200,20).setRange(5000,12000).setValue(5000);
  smooth();
  Serial board;
  // List all the available serial ports:
  println(Serial.list());
  // Open the port you are using at the rate you want:
  board = new Serial(this, Serial.list()[4], 115200);
  mc = new MotorController(board);
}
void controlEvent(ControlEvent event) {
  if (event.isFrom(cp5.getController("xy"))) {
    println("this event was triggered by Controller xy");
    float[] pos = event.getArrayValue();
    mc.go(pos[0], pos[1], cp5.getController("speed").getValue());
  }
  if (event.isFrom(cp5.getController("btnReset"))) {
    println("this event was triggered by Controller btnReset");
    println(event.getArrayValue());
    mc.disable();
    s.setArrayValue(new float[] {50, 100});
    mc.setPos(50,100);
    mc.enable();
    
  }
  if (event.isFrom(cp5.getController("btnMOff"))) {
    mc.disableMotor();
  }
}
void draw() {
  background(0);
}

