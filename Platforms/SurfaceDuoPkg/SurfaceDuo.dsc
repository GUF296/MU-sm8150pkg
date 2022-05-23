#
#  Copyright (c) 2011-2015, ARM Limited. All rights reserved.
#  Copyright (c) 2014, Linaro Limited. All rights reserved.
#  Copyright (c) 2015 - 2016, Intel Corporation. All rights reserved.
#  Copyright (c) 2018, Bingxing Wang. All rights reserved.
#
#  This program and the accompanying materials
#  are licensed and made available under the terms and conditions of the BSD License
#  which accompanies this distribution.  The full text of the license may be found at
#  http://opensource.org/licenses/bsd-license.php
#
#  THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
#  WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
#
#

################################################################################
#
# Defines Section - statements that will be processed to create a Makefile.
#
################################################################################
[Defines]
  PLATFORM_NAME                  = SurfaceDuo
  PLATFORM_GUID                  = b6325ac2-9f3f-4b1d-b129-ac7b35ddde60
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010005
  OUTPUT_DIRECTORY               = Build/SurfaceDuo-$(ARCH)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = SurfaceDuoPkg/SurfaceDuo.fdf

  DEFINE SECURE_BOOT_ENABLE           = TRUE
  DEFINE USE_SCREEN_FOR_SERIAL_OUTPUT = 1
  DEFINE USE_MEMORY_FOR_SERIAL_OUTPUT = 0

#
# Build ID Tables
#
#
#    0. Xiaomi Mix3 5g (andromeda)
#    1. Xiaomi Pad 5   (nabu)                                         
#    2. LG G8          (waiting...)
#    3. Xiaomi K20 Pro (raphael)
#    5. QRD 855        (msmnile-qrd)
#    6. Htc 5G Hub
#    7. Rog2
#

  DEFINE BUILD_DEVICE_ID	= 5

[BuildOptions.common]
!if $(USE_MEMORY_FOR_SERIAL_OUTPUT) == 1
  GCC:*_*_AARCH64_CC_FLAGS = -DSILICON_PLATFORM=8150
!else
  GCC:*_*_AARCH64_CC_FLAGS = -DSILICON_PLATFORM=8150 -DUSE_MEMORY_FOR_SERIAL_OUTPUT=1
!endif
  
[PcdsFixedAtBuild.common]

  # Platform-specific
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x80000000         # 6GB
  gArmTokenSpaceGuid.PcdSystemMemorySize|0x180000000        # 6GB
  
  #
  # Screen Resolution Config (Do Not Edit)
  #

#Mi MIX 3 5G
  !if $(BUILD_DEVICE_ID) == 0
	gSurfaceDuoPkgTokenSpaceGuid.PcdMipiFrameBufferWidth|1080
	gSurfaceDuoPkgTokenSpaceGuid.PcdMipiFrameBufferHeight|2340
  !endif
#Mi Pad5
  !if $(BUILD_DEVICE_ID) == 1
	gSurfaceDuoPkgTokenSpaceGuid.PcdMipiFrameBufferWidth|1600
	gSurfaceDuoPkgTokenSpaceGuid.PcdMipiFrameBufferHeight|2560
  !endif
#Mi K20 Pro
  !if $(BUILD_DEVICE_ID) == 3
	gSurfaceDuoPkgTokenSpaceGuid.PcdMipiFrameBufferWidth|1080
	gSurfaceDuoPkgTokenSpaceGuid.PcdMipiFrameBufferHeight|2340
  !endif
#QRD 855
  !if $(BUILD_DEVICE_ID) == 5
	gSurfaceDuoPkgTokenSpaceGuid.PcdMipiFrameBufferWidth|1440
	gSurfaceDuoPkgTokenSpaceGuid.PcdMipiFrameBufferHeight|2880
  !endif
#Htc 5G Hub
  !if $(BUILD_DEVICE_ID) == 6
	gSurfaceDuoPkgTokenSpaceGuid.PcdMipiFrameBufferWidth|720
	gSurfaceDuoPkgTokenSpaceGuid.PcdMipiFrameBufferHeight|1280
  !endif
#Rog2
  !if $(BUILD_DEVICE_ID) == 7
	gSurfaceDuoPkgTokenSpaceGuid.PcdMipiFrameBufferWidth|1080
	gSurfaceDuoPkgTokenSpaceGuid.PcdMipiFrameBufferHeight|2340
  !endif




!include SurfaceDuoPkg/Shared.dsc.inc
!include SurfaceDuoPkg/FrontpageDsc.inc
