
#include "externals/faker/Name.h"
#include <gtest/gtest.h>
#include <string>

// Demonstrate some basic assertions.
TEST(FAKER, FAKER) {
  // Expect equality.
  std::string name = Faker::Name::name();
  std::cout << name << std::endl;
  EXPECT_EQ(7 * 6, 42);
}
