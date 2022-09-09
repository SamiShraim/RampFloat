#pragma once

// system library Global variable

class RampFloat {

public:
  RampFloat(float &TaskPeriod) : TaskPeriod(TaskPeriod) {}
  float Step(float input, float Speed, bool Reset);

private:
  bool InputToHighLow{};
  float OldOutput{};
  float TempSpeed{};
  float &TaskPeriod;
  float Output;
};
