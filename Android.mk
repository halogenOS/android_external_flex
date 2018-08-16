LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

$(HOST_OUT_EXECUTABLES)/flex: PRIVATE_PATH := $(LOCAL_PATH)
$(HOST_OUT_EXECUTABLES)/flex:
	@cd $(PRIVATE_PATH) && \
	  ./autogen.sh && \
	  ./configure --prefix=/usr && \
	  make -C lib && \
	  make -j4 flex
	echo "Install: $@"
	mv $(PRIVATE_PATH)/flex $@
	$@ --version

.PHONY: host-flex-binary
host-flex-binary: $(HOST_OUT_EXECUTABLES)/flex

