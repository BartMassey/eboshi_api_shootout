impls := $(shell find . -maxdepth 1 -mindepth 1 ! -name 'bin' ! -name 'test' ! -name '.git' ! -name '.idea' -type d | cut -b3-)
.PHONY: $(impls)

all: $(impls)

define makerule
$1:
	@bin/test $1
endef

$(foreach _,${impls},$(eval $(call makerule,$_)))
