#include <Stepper.h>
#include <stdlib.h>

//Change the 48 to the number of steps on your stepper motors if needed.
#define STEPS 48
#define BUFSIZE 1024
#define MAX_CMD_SIZE 500
char cmdbuf[BUFSIZE];
char serial_char;
int serial_count = 0;
Stepper stepper(STEPS, 2, 3, 4, 5);
Stepper stepper2(STEPS, 6, 7, 8, 9);

int buflen = 0;

void setup(){ 
    Serial.begin(115200);
}
inline void get_command(){
  while( Serial.available() > 0  && buflen < BUFSIZE) {
    serial_char = Serial.read();
    if(serial_char == '\n'){
       cmdbuf[buflen] = 0;
       process_command();
    }
    cmdbuf[buflen++] = serial_char;
  }
}
int command_pos=0;
char cmd_type[10];
int cmd_type_pos=0;
int cmd_type_i=0;
char cmd_x[10];
int cmd_x_pos=0;
float cmd_x_f;
char cmd_y[10];
int cmd_y_pos=0;
float cmd_y_f;
char cmd_f[10];
int cmd_f_pos=0;
float cmd_f_f;
inline void process_command(){
  command_pos = 0;
  cmd_type_pos = 0;
  while(cmdbuf[command_pos]!=' ' && cmdbuf[command_pos]!=0){
    cmd_type[cmd_type_pos++] = cmdbuf[command_pos++];
    cmd_type[cmd_type_pos]=0;
  }
  cmd_type_i = atoi(cmd_type+1);
  command_pos++;
  while(cmdbuf[command_pos]!=' ' && cmdbuf[command_pos]!=0){
    cmd_x[cmd_x_pos++] = cmdbuf[command_pos++];
    cmd_x[cmd_x_pos]=0;
  }
  cmd_x_f = atof(cmd_x+1);
  command_pos++;
  while(cmdbuf[command_pos]!=' ' && cmdbuf[command_pos]!=0){
    cmd_y[cmd_y_pos++] = cmdbuf[command_pos++];
    cmd_y[cmd_y_pos]=0;
  }
  cmd_y_f = atof(cmd_x+1);
  command_pos++;
  while(cmdbuf[command_pos]!=' ' && cmdbuf[command_pos]!=0){
    cmd_f[cmd_f_pos++] = cmdbuf[command_pos++];
    cmd_f[cmd_f_pos]=0;
  }
  cmd_f_f = atof(cmd_x+1);
  switch(cmd_type_i){
    case 1: // move
      go(cmd_x_f, cmd_y_f, cmd_f_f);
    break;
    case 92: // set position
    break;
    case 18: //motor off
    break;
  }
}

inline void go(float x, float y, float s){
  stepper.setSpeed(s);
  
}

void loop()
{
  get_command();
  
  stepper.setSpeed(25);
  stepper.step(-1*STEPS);
  stepper.step(STEPS);

  delay(500);  

  stepper2.setSpeed(25);
  stepper2.step(-1*STEPS);              
  stepper2.step(STEPS);
  
}


