#include "mcsos/kmem.h"

#define M8_BOOT_HEAP_SIZE (64u * 1024u)
static unsigned char m8_boot_heap[M8_BOOT_HEAP_SIZE] __attribute__((aligned(4096)));

static void m8_heap_bootstrap(void) {
    int rc = kmem_init(m8_boot_heap, sizeof(m8_boot_heap));
    if (rc != 0) {
        kernel_panic("M8 kmem_init failed");
    }

    void *probe = kmem_alloc(128);
    if (probe == 0) {
        kernel_panic("M8 kmem_alloc probe failed");
    }

    if (kmem_free_checked(probe) != 0) {
        kernel_panic("M8 kmem_free_checked probe failed");
    }

    kmem_stats_t st;
    kmem_get_stats(&st);
    klog_info("M8 kmem initialized: total=%zu free=%zu largest=%zu blocks=%zu",
              st.total_bytes, st.free_bytes, st.largest_free, st.block_count);
}
