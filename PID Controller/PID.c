float outMax = 2047;
float outMin = -2048;

float Ku = 11.37;
float Tu = 0.00002;

float Kp = 11.37;
float Ki = 0;
float Kd = 0;

int New_Val;
int Old_Val;

float Speed;
float dSpeed;
float Last_Speed;

float Position;
float dPosition;
float Last_Position;

float Set_Point = 0;
float Error;
float Speed_end = -20;
float Output;
float ITerm = 0;
float ITerm_out = 0;

char txt1[10];

void Asign(int Set)
{
	Set_Point = Set;
}

void Set_Factors(void)
{
	Kp = Ku*0.6;
	Ki = 2*Kp/Tu;
	Kd = Kp*Tu/8;
}

float* PID_Calc(float* Val)
{
  //New_Val = (TIM1_CCR1 - Old_Val);

  //Callibrate it to degrees
  Position = *Val * 0.36;
	if(Position > 180)
	{
		Position = Position - 360;
	}
	else
	{
		Position = Position;
	}
  //Calculate the error
  Error = Set_Point - Position;

  //Integrate over time all errors
  ITerm += (Ki * Error);

  //Limit the value of ITerm to outMax
  if(ITerm > outMax) ITerm= outMax;
  //Limit the value of ITerm to outMin
  else if(ITerm < outMin) ITerm= outMin;

  //Calculate the difference between the current Position and Last Position
  dPosition = Position - Last_Position;
  //Save the current Position in Last Position
  //in order for the program to use this at the call
  Last_Position = Position;

  Output = Kp * Error + ITerm - (Kd * dPosition);

  if(Output > outMax) Output = outMax;
  else if(Output < outMin) Output = outMin;
  return &Output;
}