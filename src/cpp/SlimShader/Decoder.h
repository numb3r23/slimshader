#pragma once

#include "stdafx.h"
#include <cstdint>
#include <string>

using namespace std;

namespace SlimShader
{
	uint32_t decode(uint32_t token, uint8_t start, uint8_t end);

	template <class T>
	T decode(uint32_t token, uint8_t start, uint8_t end);
};