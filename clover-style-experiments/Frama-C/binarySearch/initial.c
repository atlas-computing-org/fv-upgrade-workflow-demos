#include <stddef.h>

int BinarySearch(int a[], int length, int key) {
  int lo = 0;
  int hi = length;
  
  while (lo < hi) {
    int mid = (lo + hi) / 2;
    if (a[mid] < key) {
      lo = mid + 1;
    } else {
      hi = mid;
    }
  }
  
  return lo;
}

