TEST_COLLECTIONS        = vecadd rocfft rocsparse hipblas rocblas 
RUN_TEST_COLLECTIONS   := $(addprefix run., $(TEST_COLLECTIONS))
CLEAN_TEST_COLLECTIONS := $(addprefix clean., $(TEST_COLLECTIONS))

.PHONY: all run clean $(TEST_COLLECTIONS) $(RUN_TEST_COLLECTIONS) $(CLEAN_TEST_COLLECTIONS)

$(TEST_COLLECTIONS):
	+make -C $@ all

$(RUN_TEST_COLLECTIONS):
	+make -C $(shell echo $@ | sed "s,run.,,g") run

$(CLEAN_TEST_COLLECTIONS):
	+make -C $(shell echo $@ | sed "s,clean.,,g") clean

all: $(TEST_COLLECTIONS)

run: $(RUN_TEST_COLLECTIONS)

clean: $(CLEAN_TEST_COLLECTIONS)
