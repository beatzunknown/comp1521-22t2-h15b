#include <stdio.h>
#include <stdint.h>

uint32_t six_middle_bits(uint32_t u) {
	// 0000000000000 111111 0000000000000
	// 0000000000000 0000000000000 111111 
	// 111111
	return (u >> 13) & 0x3F; // 0x3F = 0b111111
}