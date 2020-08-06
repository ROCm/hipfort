#include <stddef.h>
#include <stdio.h>
/**
 * \brief add an offset (in bytes) to a `type(c_ptr)`.
 */
void* inc_c_ptr(void *ptr, ptrdiff_t diff_in_bytes) {
  return ptr+diff_in_bytes;
}
