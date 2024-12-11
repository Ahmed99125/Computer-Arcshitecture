#include <stdio.h>

int min(int arr[10]) {
  int mn = arr[0];
  for (int i = 1; i < 8; i++) {
    if (mn - arr[i] > 0) {
      mn = arr[i];
    }
  }
  return mn;
}

int main() {
  int arr[10] = {5, 10, 24, 28, 19, 23, 1, 9, 34, 23};
  printf("The minimum number is: %d", min(arr));

  return 0;
}