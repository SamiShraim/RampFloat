#include "RampFloat.cpp"
#include <iostream>

int main(int argc, char **argv) {

  float TaskPeriod = 1;
  float &ref1{TaskPeriod};
  RampFloat ramp11(ref1);
  ramp11.Step(50.0, 40.0, false);
  ramp11.Step(50.0, 20.0, false);
  std::cout << ramp11.Step(50.0, 30.0, false);
  return 0;
}