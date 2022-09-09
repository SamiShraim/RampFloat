#include "RampFloat.cpp"
#include <gtest/gtest.h>
#include <iostream>

TEST(TestRampFloat, Positiveramp) {
  float TaskPeriod = 1;
  RampFloat ramp1(TaskPeriod);

  ASSERT_EQ(10, ramp1.Step(50.0, 10.0, false)); // positave ramp
  ASSERT_EQ(20, ramp1.Step(50.0, 10.0, false));
  ASSERT_EQ(40, ramp1.Step(50.0, 20.0, false));
  ASSERT_EQ(50, ramp1.Step(50.0, 20.0, false));
  ASSERT_EQ(50, ramp1.Step(50.0, 10.0, false));
  /////////
  ASSERT_EQ(40, ramp1.Step(0.0, 10.0, false)); // Negative  ramp
  ASSERT_EQ(30, ramp1.Step(0.0, 10.0, false));
  ASSERT_EQ(10, ramp1.Step(0.0, 20.0, false));
  ASSERT_EQ(0.0, ramp1.Step(0.0, 20.0, false));
  ////////
  ASSERT_EQ(100.0, ramp1.Step(100, 100.0, true)); // set input to 100

  ASSERT_EQ(140.0, ramp1.Step(200, 40.0, false)); // ramping to 200
  ASSERT_EQ(180.0, ramp1.Step(200, 40.0, false));
  ASSERT_EQ(200.0, ramp1.Step(200, 40.0, false));
}

int main(int argc, char **argv) {
  testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}