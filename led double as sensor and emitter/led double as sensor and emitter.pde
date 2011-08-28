/*
led matrix sensor
pin 2~9 control the led
*/


int delay_10000 = 10000;

int led_light[8] = {0,0,0,0,0,0,0,0};
/*
*/
int p0[4] = {2,3,4,5};//column control  	
int p1[2] = {6,7};//row control		

void setup()
{
}

void loop()
{
	//sampling
	for (int i = 0; i < 8 ; i ++)
	{
		Setled(i);//reversed biased to take sample
	}
	
	//set led on or off
	ledstate();
	delay(delay_10000);

	for (int j =0; j < 8 ; j++)
	{
		led_light[j] = 0;
	}
}

void Setled(int ledID)
{
	switch(ledID)
	{
	case 0: //反向偏置(输出状态) p0.0 = HIGH p1.0 = LOW
		{

			pinMode(p0[0],OUTPUT);
			pinMode(p1[0],OUTPUT);

			digitalWrite(p0[0], LOW);
			digitalWrite(p1[0], HIGH);
	
			SetledInput(p1[ledID%2]);// set high impedance state
			 digitalWrite(p1[ledID%2],LOW);
                         delay(20);
			 
			if ( digitalRead(p1[ledID%2])==0) 
			{
				led_light[ledID] = 0x00;
			}
			else
				led_light[ledID] = 0x01;

			break;
		}
	case 1://p0.0 = HIGH p1.1 = LOW
		{
			pinMode(p0[0],OUTPUT);
			pinMode(p1[1],OUTPUT);

			digitalWrite(p0[0], LOW);
			digitalWrite(p1[1], HIGH);
		
			SetledInput(p1[ledID%2]);//set high impedance state
			 digitalWrite(p1[ledID%2],LOW);
			 delay(20); 
			if ( digitalRead(p1[ledID%2])==0) 
			{
				led_light[ledID] = 0x00;
			}
			else
				led_light[ledID] = 0x01;
			break;
		}
	case 2://p0.1 = HIGH p1.0 = LOW
		{
			pinMode(p0[1],OUTPUT);
			pinMode(p1[0],OUTPUT);

			digitalWrite(p0[1], LOW);
			digitalWrite(p1[0], HIGH);

			SetledInput(p1[ledID%2]);//set high impedance state
			 digitalWrite(p1[ledID%2],LOW);
			 delay(20); 
			if ( digitalRead(p1[ledID%2])==0) 
			{
				led_light[ledID] = 0x00;
			}
			else
				led_light[ledID] = 0x01;
			break;
		}
	case 3://p0.1 = HIGH p1.1 = LOW
		{
			
			pinMode(p0[1],OUTPUT);
			pinMode(p1[1],OUTPUT);

			digitalWrite(p0[1], LOW);
			digitalWrite(p1[1], HIGH);
			
			SetledInput(p1[ledID%2]);//set high impedance state
			 digitalWrite(p1[ledID%2],LOW);
			  delay(20);
			if ( digitalRead(p1[ledID%2])==0) 
			{
				led_light[ledID] = 0x00;
			}
			else
				led_light[ledID] = 0x01;
			break;
		}
	case 4://p0.2 = HIGH p1.0 = LOW
		{
			pinMode(p0[2],OUTPUT);
			pinMode(p1[0],OUTPUT);

			digitalWrite(p0[2], LOW);
			digitalWrite(p1[0], HIGH);
		
			SetledInput(p1[ledID%2]);//set high impedance state
			 digitalWrite(p1[ledID%2],LOW);
			  delay(20);
			if ( digitalRead(p1[ledID%2])==0) 
			{
				led_light[ledID] = 0x00;
			}
			else
				led_light[ledID] = 0x01;
			break;
		}
	case 5://p0.2 = HIGH p1.1 = LOW
		{
			pinMode(p0[2],OUTPUT);
			pinMode(p1[1],OUTPUT);

			digitalWrite(p0[2], LOW);
			digitalWrite(p1[1], HIGH);
			
			SetledInput(p1[ledID%2]);//set high impedance state
			 digitalWrite(p1[ledID%2],LOW);
			 delay(20); 
			if ( digitalRead(p1[ledID%2])==0) 
			{
				led_light[ledID] = 0x00;
			}
			else
				led_light[ledID] = 0x01;
			break;
		}
	case 6://p0.3 = HIGH p1.0 = LOW
		{
			pinMode(p0[3],OUTPUT);
			pinMode(p1[0],OUTPUT);

			digitalWrite(p0[3], LOW);
			digitalWrite(p1[0], HIGH);

			SetledInput(p1[ledID%2]);//set high impedance state
			 digitalWrite(p1[ledID%2],LOW);
			  delay(20);
			if ( digitalRead(p1[ledID%2])==0) 
			{
				led_light[ledID] = 0x00;
			}
			else
				led_light[ledID] = 0x01;
			break;
		}
	case 7://p0.3 = HIGH p1.1 = LOW
		{
			pinMode(p0[3],OUTPUT);
			pinMode(p1[1],OUTPUT);

			digitalWrite(p0[3], LOW);
			digitalWrite(p1[1], HIGH);

			SetledInput(p1[ledID%2]);//set high impedance state
			 digitalWrite(p1[ledID%2],LOW);
			  delay(20);
			if ( digitalRead(p1[ledID%2])==0) 
			{
				led_light[ledID] = 0x00;
			}
			else
				led_light[ledID] = 0x001;
			break;
		}
	default:break;
	}
}

void SetledInput(int ledID) //set high impedance state and reading data
{
	pinMode(p1[ledID],INPUT);
}

void ledstate(void) //light led on and off
{
	for (int i = 0; i < 8; i++)
	{
		if (led_light[i] ==1)
		{
			//light on the relevant led
		
			//set the columns to high electrical level,rows to low electrical level
			digitalWrite(p0[i/2], HIGH);
			digitalWrite(p1[i%2], LOW);

			//set the relevant led to output state
			pinMode(p0[i/2],OUTPUT); //column
			pinMode(p1[i%2],OUTPUT); //row
		}
		else
		{

			//set the columns to low electrical level,rows to high electrical level
			digitalWrite(p0[i/2], LOW);
			digitalWrite(p1[i%2], LOW);

                        //set the relevant led to iutput state
			pinMode(p0[i/2],INPUT); //column
			pinMode(p1[i%2],INPUT); //row
		}
	}
}
