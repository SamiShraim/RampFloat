#include "RampFloat.h"

float RampFloat::Step(float input, float Speed, bool Reset) {

  TempSpeed = (Speed * TaskPeriod); // net1

  if (input > OldOutput) // net2
  {
    if ((OldOutput + TempSpeed) > input) {
      InputToHighLow = true;
    } else {
      Output = OldOutput + TempSpeed;
      InputToHighLow = false;
    }
    goto End;
  }
  if ((input < OldOutput)) // net 3
  {
    if ((OldOutput - TempSpeed) < input) {
      InputToHighLow = true;
    } else {
      Output = OldOutput - TempSpeed;
      InputToHighLow = false;
    }
  }

End:
  if (InputToHighLow || Reset) // net 4
  {
    Output = input;
  }
  OldOutput = Output; // net 5

  return Output;
};
