# SPDX-License-Identifier: GPL-2.0
vendor := $(src)

# What build.config.qcom.dtbs of soc-repo sets for the Bazel dtb build: the
# soc-repo dt-bindings, and symbols in every dtb so overlays can apply
export DTC_INCLUDE += $(abspath $(if $(filter /%,$(KCONFIG_EXT_PREFIX)),,$(srctree)/)$(KCONFIG_EXT_PREFIX)include)
export DTC_FLAGS += -@

ifneq "$(wildcard $(vendor)/qcom)" ""
	subdir-y += qcom
endif
