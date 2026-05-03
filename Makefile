# MCSOS 260502 aggregate Makefile
.PHONY: verify clean m6 m7 m8 m9 m10 m11 m12 m13 m14 m15 m16
verify: m6 m7 m8 m9 m10 m11 m12 m13 m14 m15 m16

m6:
	$(MAKE) -f Makefile.m6.example CC=clang HOSTCC=clang check
m7:
	$(MAKE) -f Makefile.m7.example CC=clang HOSTCC=clang check
m8:
	$(MAKE) -f Makefile.m8 m8-all CC=clang
m9:
	$(MAKE) -f Makefile.m9 m9-all
m10:
	$(MAKE) -f Makefile.m10 test
m11:
	$(MAKE) -f Makefile.m11 all
m12:
	$(MAKE) -f Makefile.m12 all CC=clang HOSTCC=clang
m13:
	$(MAKE) -f Makefile.m13 m13-all CC=clang CLANG=clang
m14:
	$(MAKE) -f Makefile.m14 all CC=clang CLANG=clang
m15:
	$(MAKE) -f Makefile.m15 m15-all CC=clang
m16:
	$(MAKE) -f Makefile.m16 all CLANG=clang

clean:
	rm -rf build artifacts evidence/verification
