#include <stdio.h>

float average(float arr[10]) {
  float avg = 0;
  for (int i = 0; i < 10; i++) {
    avg += arr[i];
  }
  avg /= 10.0;

  return avg;
}

int main() {
  float arr[10] = {8.0, 2.0, 6.0, 4.0, 8.0, 10.0, 12.0, 14.0, 9.0, 15.0};
  printf("The average is: %f", average(arr));

  return 0;
}