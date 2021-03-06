/* Generated by Nim Compiler v0.17.0 */
/*   (c) 2017 Andreas Rumpf */
/* The generated code is subject to the original license. */
#define NIM_NEW_MANGLING_RULES
#define NIM_INTBITS 64

#include "nimbase.h"
#include <string.h>
#undef linux
#undef near
typedef struct NimStringDesc NimStringDesc;
typedef struct TGenericSeq TGenericSeq;
typedef struct TY_UV3llMMYFckfui8YMBuUZA TY_UV3llMMYFckfui8YMBuUZA;
typedef struct TY_7q7q3E6Oj24ZNVJb9aonhAg TY_7q7q3E6Oj24ZNVJb9aonhAg;
struct  TGenericSeq  {
NI len;
NI reserved;
};
struct  NimStringDesc  {
  TGenericSeq Sup;
NIM_CHAR data[SEQ_DECL_SIZE];
};
struct TY_UV3llMMYFckfui8YMBuUZA {
NimStringDesc* Field0;
NimStringDesc* Field1;
};
struct TY_7q7q3E6Oj24ZNVJb9aonhAg {
NimStringDesc* Field0;
NimStringDesc* Field1;
NimStringDesc* Field2;
};
N_NIMCALL(NimStringDesc*, copyString)(NimStringDesc* src);
N_NIMCALL(void, nossplitPath)(NimStringDesc* path, TY_UV3llMMYFckfui8YMBuUZA* Result);
N_NIMCALL(NimStringDesc*, copyStrLast)(NimStringDesc* s, NI start, NI last);
N_NIMCALL(NimStringDesc*, copyStrLast)(NimStringDesc* s, NI first, NI last);
N_NIMCALL(void, unsureAsgnRef)(void** dest, void* src);
N_NIMCALL(NimStringDesc*, copyStr)(NimStringDesc* s, NI start);
N_NIMCALL(NimStringDesc*, copyStr)(NimStringDesc* s, NI first);
N_NIMCALL(NI, searchExtPos_GvT9b2csQmLzVANEJ9bdAuNA)(NimStringDesc* path);
static N_INLINE(void, appendString)(NimStringDesc* dest, NimStringDesc* src);
static N_INLINE(void, copyMem_E1xtACub5WcDa3vbrIXbwgsystem)(void* dest, void* source, NI size);
N_NIMCALL(NimStringDesc*, normExt_3yxSdoh5oykvpUqYYeaz2g)(NimStringDesc* ext);
static N_INLINE(void, appendChar)(NimStringDesc* dest, NIM_CHAR c);
N_NIMCALL(NimStringDesc*, rawNewString)(NI space);
N_NIMCALL(NimStringDesc*, nosjoinPath)(NimStringDesc* head, NimStringDesc* tail);
N_NIMCALL(NI, parentDirPos_GvT9b2csQmLzVANEJ9bdAuNA_2)(NimStringDesc* path);
N_NIMCALL(NI, cmp_xEnKsp9cfvO7Do9cTYXo8eJw)(NimStringDesc* x, NimStringDesc* y);
N_NIMCALL(NI, nsuCmpIgnoreCase)(NimStringDesc* a, NimStringDesc* b);
STRING_LITERAL(TM_jvWQYw9bcuYhftfPX2ynPeg_2, "", 0);

N_NIMCALL(void, nossplitPath)(NimStringDesc* path, TY_UV3llMMYFckfui8YMBuUZA* Result) {
	NI sepPos;
	sepPos = ((NI) -1);
	{
		NI i;
		NI colontmp_;
		NI res;
		i = (NI)0;
		colontmp_ = (NI)0;
		colontmp_ = (NI)((path ? path->Sup.len : 0) - ((NI) 1));
		res = colontmp_;
		{
			while (1) {
				if (!(((NI) 0) <= res)) goto LA3;
				i = res;
				{
					if (!(((NU8)(path->data[i])) == ((NU8)(47)) || ((NU8)(path->data[i])) == ((NU8)(47)))) goto LA6_;
					sepPos = i;
					goto LA1;
				}
				LA6_: ;
				res -= ((NI) 1);
			} LA3: ;
		}
	} LA1: ;
	{
		if (!(((NI) 0) <= sepPos)) goto LA10_;
		unsureAsgnRef((void**) (&(*Result).Field0), copyStrLast(path, ((NI) 0), (NI)(sepPos - ((NI) 1))));
		unsureAsgnRef((void**) (&(*Result).Field1), copyStr(path, (NI)(sepPos + ((NI) 1))));
	}
	goto LA8_;
	LA10_: ;
	{
		unsureAsgnRef((void**) (&(*Result).Field0), copyString(((NimStringDesc*) &TM_jvWQYw9bcuYhftfPX2ynPeg_2)));
		unsureAsgnRef((void**) (&(*Result).Field1), copyString(path));
	}
	LA8_: ;
}

N_NIMCALL(NimStringDesc*, nosextractFilename)(NimStringDesc* path) {
	NimStringDesc* result;
	result = (NimStringDesc*)0;
	{
		NIM_BOOL T3_;
		T3_ = (NIM_BOOL)0;
		T3_ = ((path ? path->Sup.len : 0) == ((NI) 0));
		if (T3_) goto LA4_;
		T3_ = (((NU8)(path->data[(NI)((path ? path->Sup.len : 0) - ((NI) 1))])) == ((NU8)(47)) || ((NU8)(path->data[(NI)((path ? path->Sup.len : 0) - ((NI) 1))])) == ((NU8)(47)));
		LA4_: ;
		if (!T3_) goto LA5_;
		result = copyString(((NimStringDesc*) &TM_jvWQYw9bcuYhftfPX2ynPeg_2));
	}
	goto LA1_;
	LA5_: ;
	{
		TY_UV3llMMYFckfui8YMBuUZA T8_;
		memset((void*)(&T8_), 0, sizeof(T8_));
		nossplitPath(path, (&T8_));
		result = copyString(T8_.Field1);
	}
	LA1_: ;
	return result;
}

N_NIMCALL(NI, searchExtPos_GvT9b2csQmLzVANEJ9bdAuNA)(NimStringDesc* path) {
	NI result;
	result = (NI)0;
	result = ((NI) -1);
	{
		NI i;
		NI colontmp_;
		NI res;
		i = (NI)0;
		colontmp_ = (NI)0;
		colontmp_ = (NI)((path ? path->Sup.len : 0) - ((NI) 1));
		res = colontmp_;
		{
			while (1) {
				if (!(((NI) 1) <= res)) goto LA3;
				i = res;
				{
					if (!((NU8)(path->data[i]) == (NU8)(46))) goto LA6_;
					result = i;
					goto LA1;
				}
				goto LA4_;
				LA6_: ;
				{
					if (!(((NU8)(path->data[i])) == ((NU8)(47)) || ((NU8)(path->data[i])) == ((NU8)(47)))) goto LA9_;
					goto LA1;
				}
				goto LA4_;
				LA9_: ;
				LA4_: ;
				res -= ((NI) 1);
			} LA3: ;
		}
	} LA1: ;
	return result;
}

static N_INLINE(void, copyMem_E1xtACub5WcDa3vbrIXbwgsystem)(void* dest, void* source, NI size) {
	void* T1_;
	T1_ = (void*)0;
	T1_ = memcpy(dest, source, ((size_t) (size)));
}

static N_INLINE(void, appendString)(NimStringDesc* dest, NimStringDesc* src) {
	copyMem_E1xtACub5WcDa3vbrIXbwgsystem(((void*) ((&(*dest).data[((*dest).Sup.len)- 0]))), ((void*) ((*src).data)), ((NI) ((NI)((*src).Sup.len + ((NI) 1)))));
	(*dest).Sup.len += (*src).Sup.len;
}

static N_INLINE(void, appendChar)(NimStringDesc* dest, NIM_CHAR c) {
	(*dest).data[((*dest).Sup.len)- 0] = c;
	(*dest).data[((NI)((*dest).Sup.len + ((NI) 1)))- 0] = 0;
	(*dest).Sup.len += ((NI) 1);
}

N_NIMCALL(NimStringDesc*, normExt_3yxSdoh5oykvpUqYYeaz2g)(NimStringDesc* ext) {
	NimStringDesc* result;
	result = (NimStringDesc*)0;
	{
		NIM_BOOL T3_;
		T3_ = (NIM_BOOL)0;
		T3_ = ((ext) && (ext)->Sup.len == 0);
		if (T3_) goto LA4_;
		T3_ = ((NU8)(ext->data[((NI) 0)]) == (NU8)(46));
		LA4_: ;
		if (!T3_) goto LA5_;
		result = copyString(ext);
	}
	goto LA1_;
	LA5_: ;
	{
		NimStringDesc* T8_;
		T8_ = (NimStringDesc*)0;
		T8_ = rawNewString(ext->Sup.len + 1);
appendChar(T8_, 46);
appendString(T8_, ext);
		result = T8_;
	}
	LA1_: ;
	return result;
}

N_NIMCALL(NimStringDesc*, noschangeFileExt)(NimStringDesc* filename, NimStringDesc* ext) {
	NimStringDesc* result;
	NI extPos;
	result = (NimStringDesc*)0;
	extPos = searchExtPos_GvT9b2csQmLzVANEJ9bdAuNA(filename);
	{
		NimStringDesc* T5_;
		NimStringDesc* T6_;
		if (!(extPos < ((NI) 0))) goto LA3_;
		T5_ = (NimStringDesc*)0;
		T6_ = (NimStringDesc*)0;
		T6_ = normExt_3yxSdoh5oykvpUqYYeaz2g(ext);
		T5_ = rawNewString(filename->Sup.len + T6_->Sup.len + 0);
appendString(T5_, filename);
appendString(T5_, T6_);
		result = T5_;
	}
	goto LA1_;
	LA3_: ;
	{
		NimStringDesc* T8_;
		NimStringDesc* T9_;
		NimStringDesc* T10_;
		T8_ = (NimStringDesc*)0;
		T9_ = (NimStringDesc*)0;
		T9_ = copyStrLast(filename, ((NI) 0), (NI)(extPos - ((NI) 1)));
		T10_ = (NimStringDesc*)0;
		T10_ = normExt_3yxSdoh5oykvpUqYYeaz2g(ext);
		T8_ = rawNewString(T9_->Sup.len + T10_->Sup.len + 0);
appendString(T8_, T9_);
appendString(T8_, T10_);
		result = T8_;
	}
	LA1_: ;
	return result;
}

N_NIMCALL(NimStringDesc*, nosjoinPath)(NimStringDesc* head, NimStringDesc* tail) {
	NimStringDesc* result;
	result = (NimStringDesc*)0;
	{
		if (!((head ? head->Sup.len : 0) == ((NI) 0))) goto LA3_;
		result = copyString(tail);
	}
	goto LA1_;
	LA3_: ;
	{
		if (!(((NU8)(head->data[(NI)((head ? head->Sup.len : 0) - ((NI) 1))])) == ((NU8)(47)) || ((NU8)(head->data[(NI)((head ? head->Sup.len : 0) - ((NI) 1))])) == ((NU8)(47)))) goto LA6_;
		{
			NimStringDesc* T12_;
			NimStringDesc* T13_;
			if (!(((NU8)(tail->data[((NI) 0)])) == ((NU8)(47)) || ((NU8)(tail->data[((NI) 0)])) == ((NU8)(47)))) goto LA10_;
			T12_ = (NimStringDesc*)0;
			T13_ = (NimStringDesc*)0;
			T13_ = copyStr(tail, ((NI) 1));
			T12_ = rawNewString(head->Sup.len + T13_->Sup.len + 0);
appendString(T12_, head);
appendString(T12_, T13_);
			result = T12_;
		}
		goto LA8_;
		LA10_: ;
		{
			NimStringDesc* T15_;
			T15_ = (NimStringDesc*)0;
			T15_ = rawNewString(head->Sup.len + tail->Sup.len + 0);
appendString(T15_, head);
appendString(T15_, tail);
			result = T15_;
		}
		LA8_: ;
	}
	goto LA1_;
	LA6_: ;
	{
		{
			NimStringDesc* T21_;
			if (!(((NU8)(tail->data[((NI) 0)])) == ((NU8)(47)) || ((NU8)(tail->data[((NI) 0)])) == ((NU8)(47)))) goto LA19_;
			T21_ = (NimStringDesc*)0;
			T21_ = rawNewString(head->Sup.len + tail->Sup.len + 0);
appendString(T21_, head);
appendString(T21_, tail);
			result = T21_;
		}
		goto LA17_;
		LA19_: ;
		{
			NimStringDesc* T23_;
			T23_ = (NimStringDesc*)0;
			T23_ = rawNewString(head->Sup.len + tail->Sup.len + 1);
appendString(T23_, head);
appendChar(T23_, 47);
appendString(T23_, tail);
			result = T23_;
		}
		LA17_: ;
	}
	LA1_: ;
	return result;
}

N_NIMCALL(NimStringDesc*, slash__lXoMhn1ZYc9cAJa9bfA61msg)(NimStringDesc* head, NimStringDesc* tail) {
	NimStringDesc* result;
{	result = (NimStringDesc*)0;
	result = nosjoinPath(head, tail);
	goto BeforeRet_;
	}BeforeRet_: ;
	return result;
}

N_NIMCALL(void, nossplitFile)(NimStringDesc* path, TY_7q7q3E6Oj24ZNVJb9aonhAg* Result) {
	{
		NIM_BOOL T3_;
		T3_ = (NIM_BOOL)0;
		T3_ = ((path ? path->Sup.len : 0) == ((NI) 0));
		if (T3_) goto LA4_;
		T3_ = (((NU8)(path->data[(NI)((path ? path->Sup.len : 0) - ((NI) 1))])) == ((NU8)(47)) || ((NU8)(path->data[(NI)((path ? path->Sup.len : 0) - ((NI) 1))])) == ((NU8)(47)));
		LA4_: ;
		if (!T3_) goto LA5_;
		unsureAsgnRef((void**) (&(*Result).Field0), copyString(path));
		unsureAsgnRef((void**) (&(*Result).Field1), copyString(((NimStringDesc*) &TM_jvWQYw9bcuYhftfPX2ynPeg_2)));
		unsureAsgnRef((void**) (&(*Result).Field2), copyString(((NimStringDesc*) &TM_jvWQYw9bcuYhftfPX2ynPeg_2)));
	}
	goto LA1_;
	LA5_: ;
	{
		NI sepPos;
		NI dotPos;
		sepPos = ((NI) -1);
		dotPos = (path ? path->Sup.len : 0);
		{
			NI i;
			NI colontmp_;
			NI res;
			i = (NI)0;
			colontmp_ = (NI)0;
			colontmp_ = (NI)((path ? path->Sup.len : 0) - ((NI) 1));
			res = colontmp_;
			{
				while (1) {
					if (!(((NI) 0) <= res)) goto LA10;
					i = res;
					{
						if (!((NU8)(path->data[i]) == (NU8)(46))) goto LA13_;
						{
							NIM_BOOL T17_;
							NIM_BOOL T18_;
							T17_ = (NIM_BOOL)0;
							T18_ = (NIM_BOOL)0;
							T18_ = (dotPos == (path ? path->Sup.len : 0));
							if (!(T18_)) goto LA19_;
							T18_ = (((NI) 0) < i);
							LA19_: ;
							T17_ = T18_;
							if (!(T17_)) goto LA20_;
							T17_ = !((((NU8)(path->data[(NI)(i - ((NI) 1))])) == ((NU8)(47)) || ((NU8)(path->data[(NI)(i - ((NI) 1))])) == ((NU8)(47))));
							LA20_: ;
							if (!T17_) goto LA21_;
							dotPos = i;
						}
						LA21_: ;
					}
					goto LA11_;
					LA13_: ;
					{
						if (!(((NU8)(path->data[i])) == ((NU8)(47)) || ((NU8)(path->data[i])) == ((NU8)(47)))) goto LA24_;
						sepPos = i;
						goto LA8;
					}
					goto LA11_;
					LA24_: ;
					LA11_: ;
					res -= ((NI) 1);
				} LA10: ;
			}
		} LA8: ;
		unsureAsgnRef((void**) (&(*Result).Field0), copyStrLast(path, ((NI) 0), (NI)(sepPos - ((NI) 1))));
		unsureAsgnRef((void**) (&(*Result).Field1), copyStrLast(path, (NI)(sepPos + ((NI) 1)), (NI)(dotPos - ((NI) 1))));
		unsureAsgnRef((void**) (&(*Result).Field2), copyStr(path, dotPos));
	}
	LA1_: ;
}

N_NIMCALL(NI, parentDirPos_GvT9b2csQmLzVANEJ9bdAuNA_2)(NimStringDesc* path) {
	NI result;
	NI q;
{	result = (NI)0;
	q = ((NI) 1);
	{
		NIM_BOOL T3_;
		T3_ = (NIM_BOOL)0;
		T3_ = (((NI) 1) <= (path ? path->Sup.len : 0));
		if (!(T3_)) goto LA4_;
		T3_ = (((NU8)(path->data[(NI)((path ? path->Sup.len : 0) - ((NI) 1))])) == ((NU8)(47)) || ((NU8)(path->data[(NI)((path ? path->Sup.len : 0) - ((NI) 1))])) == ((NU8)(47)));
		LA4_: ;
		if (!T3_) goto LA5_;
		q = ((NI) 2);
	}
	LA5_: ;
	{
		NI i;
		NI colontmp_;
		NI res;
		i = (NI)0;
		colontmp_ = (NI)0;
		colontmp_ = (NI)((path ? path->Sup.len : 0) - q);
		res = colontmp_;
		{
			while (1) {
				if (!(((NI) 0) <= res)) goto LA9;
				i = res;
				{
					if (!(((NU8)(path->data[i])) == ((NU8)(47)) || ((NU8)(path->data[i])) == ((NU8)(47)))) goto LA12_;
					result = i;
					goto BeforeRet_;
				}
				LA12_: ;
				res -= ((NI) 1);
			} LA9: ;
		}
	}
	result = ((NI) -1);
	}BeforeRet_: ;
	return result;
}

N_NIMCALL(NimStringDesc*, nosparentDir)(NimStringDesc* path) {
	NimStringDesc* result;
	NI sepPos;
	result = (NimStringDesc*)0;
	sepPos = parentDirPos_GvT9b2csQmLzVANEJ9bdAuNA_2(path);
	{
		if (!(((NI) 0) <= sepPos)) goto LA3_;
		result = copyStrLast(path, ((NI) 0), (NI)(sepPos - ((NI) 1)));
	}
	goto LA1_;
	LA3_: ;
	{
		result = copyString(((NimStringDesc*) &TM_jvWQYw9bcuYhftfPX2ynPeg_2));
	}
	LA1_: ;
	return result;
}

N_NIMCALL(NimStringDesc*, nosjoinPathOpenArray)(NimStringDesc** parts, NI partsLen_0) {
	NimStringDesc* result;
	result = (NimStringDesc*)0;
	result = copyString(parts[((NI) 0)]);
	{
		NI i;
		NI colontmp_;
		NI res;
		i = (NI)0;
		colontmp_ = (NI)0;
		colontmp_ = (partsLen_0-1);
		res = ((NI) 1);
		{
			while (1) {
				if (!(res <= colontmp_)) goto LA3;
				i = res;
				result = nosjoinPath(result, parts[i]);
				res += ((NI) 1);
			} LA3: ;
		}
	}
	return result;
}

N_NIMCALL(NimStringDesc*, nosaddFileExt)(NimStringDesc* filename, NimStringDesc* ext) {
	NimStringDesc* result;
	NI extPos;
	result = (NimStringDesc*)0;
	extPos = searchExtPos_GvT9b2csQmLzVANEJ9bdAuNA(filename);
	{
		NimStringDesc* T5_;
		NimStringDesc* T6_;
		if (!(extPos < ((NI) 0))) goto LA3_;
		T5_ = (NimStringDesc*)0;
		T6_ = (NimStringDesc*)0;
		T6_ = normExt_3yxSdoh5oykvpUqYYeaz2g(ext);
		T5_ = rawNewString(filename->Sup.len + T6_->Sup.len + 0);
appendString(T5_, filename);
appendString(T5_, T6_);
		result = T5_;
	}
	goto LA1_;
	LA3_: ;
	{
		result = copyString(filename);
	}
	LA1_: ;
	return result;
}

N_NIMCALL(NIM_BOOL, nosisAbsolute)(NimStringDesc* path) {
	NIM_BOOL result;
	result = (NIM_BOOL)0;
	result = ((NU8)(path->data[((NI) 0)]) == (NU8)(47));
	return result;
}

N_NIMCALL(NimStringDesc*, nosunixToNativePath)(NimStringDesc* path, NimStringDesc* drive) {
	NimStringDesc* result;
	result = (NimStringDesc*)0;
	result = copyString(path);
	return result;
}

N_NIMCALL(NI, noscmpPaths)(NimStringDesc* pathA, NimStringDesc* pathB) {
	NI result;
	result = (NI)0;
	{
		if (!NIM_TRUE) goto LA3_;
		result = cmp_xEnKsp9cfvO7Do9cTYXo8eJw(pathA, pathB);
	}
	goto LA1_;
	LA3_: ;
	{
		result = nsuCmpIgnoreCase(pathA, pathB);
	}
	LA1_: ;
	return result;
}

N_NIMCALL(NIM_BOOL, nosisRootDir)(NimStringDesc* path) {
	NIM_BOOL result;
	NI T1_;
	result = (NIM_BOOL)0;
	T1_ = (NI)0;
	T1_ = parentDirPos_GvT9b2csQmLzVANEJ9bdAuNA_2(path);
	result = (T1_ < ((NI) 0));
	return result;
}
NIM_EXTERNC N_NOINLINE(void, stdlib_ospathsInit000)(void) {
}

NIM_EXTERNC N_NOINLINE(void, stdlib_ospathsDatInit000)(void) {
}

