char *rfidVal[5] = {"uibh87gb8dc8dcgt","klg34fxcfiietrkoohih","frdcr34rfedvkphel","erg34rvedvtrhuws","wergfvw34fiuvdv4r"};
int i;
void main()
{

 UART1_Init(9600);
 Delay_ms(50);


 while(1)
 {
  for(i = 0; i<5; i++)
  {
   UART1_Write_Text(rfidVal[i]);
   UART1_Write_Text("\n");
   Delay_ms(3000);
  }

  }
 }