#include "RampFloat.h"

float RampFloat::Step(float Input, float Speed, bool Reset) {

  TempSpeed = (Speed * TaskPeriod); // net1

  if (Input > OldOutput) // net2
  {
    if ((OldOutput + TempSpeed) > Input) {
      InputToHighLow = true;
    } else {
      Output = OldOutput + TempSpeed;
      InputToHighLow = false;
    }
    goto End;
  }
  if ((Input < OldOutput)) // net 3
  {
    if ((OldOutput - TempSpeed) < Input) {
      InputToHighLow = true;
    } else {
      Output = OldOutput - TempSpeed;
      InputToHighLow = false;
    }
  }

End:
  if (InputToHighLow || Reset) // net 4
  {
    Output = Input;
  }
  OldOutput = Output; // net 5

  return Output;
  
};
