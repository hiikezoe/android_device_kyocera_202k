USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/kyocera/202k/BoardConfigVendor.mk

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := msm8960
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := krait
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_BOOTLOADER_BOARD_NAME := 202k

ENABLE_LOKI_RECOVERY := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_FSTAB := device/kyocera/202k/root/fstab.qcom
BOARD_CUSTOM_GRAPHICS := ../../../device/kyocera/202k/recovery/graphics.c ../../../device/kyocera/202k/recovery/graphics_overlay.c
TARGET_USERIMAGES_USE_EXT4 := true

BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 no_console_suspend=1 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 maxcpus=2
BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000
BOARD_WANTS_EMMC_BOOT := true

TARGET_KERNEL_CONFIG := msm8960_defconfig
TARGET_KERNEL_SOURCE := kernel/kyocera/202k

EXTRA_KERNEL_MODULES:
	make -C device/kyocera/202k/mmc_protect KDIR=$(KERNEL_OUT) PWD=$(PWD)/device/kyocera/202k/mmc_protect ARCH=$(TARGET_ARCH) $(ARM_CROSS_COMPILE)
	cp device/kyocera/202k/mmc_protect/mmc_protect.ko $(KERNEL_MODULES_OUT)
	cp device/kyocera/202k/mmc_protect/mmc_protect.ko $(TARGET_RECOVERY_ROOT_OUT)/sbin
TARGET_KERNEL_MODULES := EXTRA_KERNEL_MODULES

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00800000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00800000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 973078528
BOARD_USERDATAIMAGE_PARTITION_SIZE := 4370464768
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_HAS_NO_SELECT_BUTTON := true
