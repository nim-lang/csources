/* Generated by Nim Compiler v0.20.0 */
/*   (c) 2019 Andreas Rumpf */
/* The generated code is subject to the original license. */
#define NIM_INTBITS 64

#include "nimbase.h"
#undef LANGUAGE_C
#undef MIPSEB
#undef MIPSEL
#undef PPC
#undef R3000
#undef R4000
#undef i386
#undef linux
#undef mips
#undef near
#undef far
#undef powerpc
#undef unix
#define nimfr_(x, y)
#define nimln_(x, y)
static N_INLINE(NI, divInt)(NI a, NI b);
N_NOINLINE(void, raiseDivByZero)(void);
N_NOINLINE(void, raiseOverflow)(void);
static N_INLINE(NI, addInt)(NI a, NI b);
N_NIMCALL(NI, mulInt)(NI a, NI b);
NI gFrontEndId_gyRrMPnY7JyC6tAu9bCfGng;

static N_INLINE(NI, divInt)(NI a, NI b) {
	NI result;
{	result = (NI)0;
	{
		if (!(b == ((NI) 0))) goto LA3_;
		raiseDivByZero();
	}
	LA3_: ;
	{
		NIM_BOOL T7_;
		T7_ = (NIM_BOOL)0;
		T7_ = (a == ((NI) (IL64(-9223372036854775807) - IL64(1))));
		if (!(T7_)) goto LA8_;
		T7_ = (b == ((NI) -1));
		LA8_: ;
		if (!T7_) goto LA9_;
		raiseOverflow();
	}
	LA9_: ;
	result = (NI)(a / b);
	goto BeforeRet_;
	}BeforeRet_: ;
	return result;
}

static N_INLINE(NI, addInt)(NI a, NI b) {
	NI result;
{	result = (NI)0;
	result = (NI)((NU64)(a) + (NU64)(b));
	{
		NIM_BOOL T3_;
		T3_ = (NIM_BOOL)0;
		T3_ = (((NI) 0) <= (NI)(result ^ a));
		if (T3_) goto LA4_;
		T3_ = (((NI) 0) <= (NI)(result ^ b));
		LA4_: ;
		if (!T3_) goto LA5_;
		goto BeforeRet_;
	}
	LA5_: ;
	raiseOverflow();
	}BeforeRet_: ;
	return result;
}

N_LIB_PRIVATE N_NIMCALL(void, idSynchronizationPoint_o9blMKDNUEgfiqOxiffy8Tw)(NI idRange) {
	NI TM_OcNXKFm0N2ybP5hO0iXdjw_2;
	NI TM_OcNXKFm0N2ybP5hO0iXdjw_3;
	NI TM_OcNXKFm0N2ybP5hO0iXdjw_4;
	NI TM_OcNXKFm0N2ybP5hO0iXdjw_5;
	TM_OcNXKFm0N2ybP5hO0iXdjw_2 = divInt(gFrontEndId_gyRrMPnY7JyC6tAu9bCfGng, idRange);
	TM_OcNXKFm0N2ybP5hO0iXdjw_3 = addInt((NI)(TM_OcNXKFm0N2ybP5hO0iXdjw_2), ((NI) 1));
	TM_OcNXKFm0N2ybP5hO0iXdjw_4 = mulInt((NI)(TM_OcNXKFm0N2ybP5hO0iXdjw_3), idRange);
	TM_OcNXKFm0N2ybP5hO0iXdjw_5 = addInt((NI)(TM_OcNXKFm0N2ybP5hO0iXdjw_4), ((NI) 1));
	gFrontEndId_gyRrMPnY7JyC6tAu9bCfGng = (NI)(TM_OcNXKFm0N2ybP5hO0iXdjw_5);
}