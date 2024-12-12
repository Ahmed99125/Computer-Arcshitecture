#include <stdio.h>

float average(const int arr[10]) {
  float avg = 0;
  for (int i = 0; i < 10; i++) {
    avg += arr[i];
  }
  avg /= 10.0;

  return avg;
}

int main() {
  int arr[10] = {8, 2, 6, 4, 8, 10, 12, 14, 9, 15};
  printf("The average is: %f", average(arr));

  return 0;
}
