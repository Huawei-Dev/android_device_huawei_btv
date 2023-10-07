/*
 * Copyright (C) 2023 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <tinyxml2.h>
#include <new>

namespace tinyxml2 {

extern "C" {
void* _ZN8tinyxml211XMLDocumentC1Eb(XMLDocument* thisptr, bool processEntities) {
    return new (thisptr) XMLDocument(processEntities, PRESERVE_WHITESPACE);
	}
    }
}  // namespace tinyxml2
