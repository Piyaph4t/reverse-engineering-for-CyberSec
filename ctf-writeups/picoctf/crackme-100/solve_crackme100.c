#include <stdio.h>
#include <stdlib.h>
#include <string.h>
char reverse_char(char y, int i_1) {
  int a = i_1 % 255;

  // popcount
  int u = __builtin_popcount(a);

  int r = (y - 'a' - 2 * u) % 26;
  if (r < 0)
    r += 26;

  return (char)(r + 'a');
}

int main(int argc, char *argv[]) {

  char s[] = "apijaczhzgtfnyjgrdvqrjbmcurcmjczsvbwgdelvxxxjkyigy";

  size_t len = strlen(s);
  int n = 3;
  while (n--) {
    for (int i = 0; i < len; i++) {
      s[i] = reverse_char(s[i], i);
    }
  }
  printf("s = %s\n", s);

  return EXIT_SUCCESS;
}
