#include <stdio.h>

int main() {

  int i, j, k;
  char c;

  struct Test {
    int a;
    char b;
  };

  for (i = 0; i < 10; i++) {
    if (i == 5) {
      do {
        for (j = 0; j < 5; j++) {
          switch (j) {
          case 1:
            printf("Hello");
            break;
          default:
            printf("World");
          }
        }
        k++;
      } while (k < 6);
    } else
      printf("Hi");
  }

  union Data {
    int x;
    char y;
  };

  for (i = 0; i < 20; i++) {
    if (i % 2 == 0)
      continue;
    else
      break;
  }

  return 0;
}