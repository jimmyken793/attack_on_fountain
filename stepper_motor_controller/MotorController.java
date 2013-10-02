import processing.serial.*;
class MotorController{
  private boolean enabled;
  private Serial board;
  public MotorController(Serial board){
    this.board = board;
    board.readString();
    enabled = true;
  }
  public void disable(){
    enabled = false;
  }
  public void enable(){
    enabled = true;
  }
  public void go(double x, double y, double speed){
    if(enabled){
      board.write("G1 X"+x*10+" Y"+y*10+" F"+speed+"\n");
      board.readString();
    }
  }
  public void setPos(double x, double y){
    board.write("G92 X"+x*10+" Y"+y*10+"\n");
    board.readString();
  }
  public void disableMotor(){
    board.write("M18\n");
  }
}
