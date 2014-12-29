/* Generated by Nim Compiler v0.10.0 */
/*   (c) 2014 Andreas Rumpf */
/* The generated code is subject to the original license. */
#define NIM_INTBITS 64
#include "nimbase.h"

#include <string.h>

#include <sys/types.h>

#include <unistd.h>

#include <setjmp.h>

#include <errno.h>

#include <fcntl.h>

#include <stdio.h>

#include <sys/wait.h>

#include <stdlib.h>
typedef struct NimStringDesc NimStringDesc;
typedef struct TGenericSeq TGenericSeq;
typedef struct processobj139402 processobj139402;
typedef struct stringtableobj130012 stringtableobj130012;
typedef struct TNimObject TNimObject;
typedef struct TNimType TNimType;
typedef struct TNimNode TNimNode;
typedef struct streamobj134035 streamobj134035;
typedef struct TY118408 TY118408;
typedef struct tcell44735 tcell44735;
typedef struct tcellseq44751 tcellseq44751;
typedef struct tgcheap46816 tgcheap46816;
typedef struct tcellset44747 tcellset44747;
typedef struct tpagedesc44743 tpagedesc44743;
typedef struct tmemregion27010 tmemregion27010;
typedef struct tsmallchunk26240 tsmallchunk26240;
typedef struct tllchunk27004 tllchunk27004;
typedef struct tbigchunk26242 tbigchunk26242;
typedef struct tintset26217 tintset26217;
typedef struct ttrunk26213 ttrunk26213;
typedef struct tavlnode27008 tavlnode27008;
typedef struct tgcstat46814 tgcstat46814;
typedef struct Exception Exception;
typedef struct TSafePoint TSafePoint;
typedef struct keyvaluepairseq130010 keyvaluepairseq130010;
typedef struct keyvaluepair130008 keyvaluepair130008;
typedef struct tstartprocessdata140951 tstartprocessdata140951;
typedef struct filestreamobj134742 filestreamobj134742;
typedef struct TY140202 TY140202;
typedef struct tbasechunk26238 tbasechunk26238;
typedef struct tfreecell26230 tfreecell26230;
struct  TGenericSeq  {
NI len;
NI reserved;
};
struct  NimStringDesc  {
  TGenericSeq Sup;
NIM_CHAR data[SEQ_DECL_SIZE];
};
typedef NU8 TY210607[32];
typedef int TY141022[2];
typedef N_NIMCALL_PTR(void, TY3089) (void* p, NI op);
typedef N_NIMCALL_PTR(void*, TY3094) (void* p);
struct  TNimType  {
NI size;
NU8 kind;
NU8 flags;
TNimType* base;
TNimNode* node;
void* finalizer;
TY3089 marker;
TY3094 deepcopy;
};
struct  TNimObject  {
TNimType* m_type;
};
struct  processobj139402  {
  TNimObject Sup;
int Inhandle;
int Outhandle;
int Errhandle;
streamobj134035* Instream;
streamobj134035* Outstream;
streamobj134035* Errstream;
pid_t Id;
int Exitcode;
};
struct  TNimNode  {
NU8 kind;
NI offset;
TNimType* typ;
NCSTRING name;
NI len;
TNimNode** sons;
};
typedef NimStringDesc* TY207063[3];
struct  tcell44735  {
NI Refcount;
TNimType* Typ;
};
struct  tcellseq44751  {
NI Len;
NI Cap;
tcell44735** D;
};
struct  tcellset44747  {
NI Counter;
NI Max;
tpagedesc44743* Head;
tpagedesc44743** Data;
};
typedef tsmallchunk26240* TY27022[512];
typedef ttrunk26213* ttrunkbuckets26215[256];
struct  tintset26217  {
ttrunkbuckets26215 Data;
};
struct  tmemregion27010  {
NI Minlargeobj;
NI Maxlargeobj;
TY27022 Freesmallchunks;
tllchunk27004* Llmem;
NI Currmem;
NI Maxmem;
NI Freemem;
NI Lastsize;
tbigchunk26242* Freechunkslist;
tintset26217 Chunkstarts;
tavlnode27008* Root;
tavlnode27008* Deleted;
tavlnode27008* Last;
tavlnode27008* Freeavlnodes;
};
struct  tgcstat46814  {
NI Stackscans;
NI Cyclecollections;
NI Maxthreshold;
NI Maxstacksize;
NI Maxstackcells;
NI Cycletablesize;
NI64 Maxpause;
};
struct  tgcheap46816  {
void* Stackbottom;
NI Cyclethreshold;
tcellseq44751 Zct;
tcellseq44751 Decstack;
tcellset44747 Cycleroots;
tcellseq44751 Tempstack;
NI Recgclock;
tmemregion27010 Region;
tgcstat46814 Stat;
};
typedef NimStringDesc* TY196301[1];
struct  Exception  {
  TNimObject Sup;
Exception* parent;
NCSTRING name;
NimStringDesc* message;
NimStringDesc* trace;
};
typedef struct {
N_NIMCALL_PTR(NIM_BOOL, ClPrc) (Exception* e, void* ClEnv);
void* ClEnv;
} TY14609;
struct  TSafePoint  {
TSafePoint* prev;
NI status;
jmp_buf context;
NIM_BOOL hasRaiseAction;
TY14609 raiseAction;
};
struct keyvaluepair130008 {
NimStringDesc* Field0;
NimStringDesc* Field1;
};
struct  stringtableobj130012  {
  TNimObject Sup;
NI Counter;
keyvaluepairseq130010* Data;
NU8 Mode;
};
struct  tstartprocessdata140951  {
NCSTRING Syscommand;
NCSTRING* Sysargs;
NCSTRING* Sysenv;
NCSTRING Workingdir;
TY141022 Pstdin;
TY141022 Pstdout;
TY141022 Pstderr;
TY141022 Perrorpipe;
NIM_BOOL Optionpousepath;
NIM_BOOL Optionpoparentstreams;
NIM_BOOL Optionpostderrtostdout;
};
typedef NimStringDesc* TY257532[1];
typedef struct {
N_NIMCALL_PTR(void, ClPrc) (NI idx, void* ClEnv);
void* ClEnv;
} TY202627;
typedef N_CLOSURE_PTR(void, TMP4181) (NI idx);
typedef N_CLOSURE_PTR(void, TMP4182) (NI idx);
typedef N_CLOSURE_PTR(void, TMP4183) (NI idx);
typedef N_NIMCALL_PTR(void, TY134036) (streamobj134035* s);
typedef N_NIMCALL_PTR(NIM_BOOL, TY134040) (streamobj134035* s);
typedef N_NIMCALL_PTR(void, TY134044) (streamobj134035* s, NI pos);
typedef N_NIMCALL_PTR(NI, TY134049) (streamobj134035* s);
typedef N_NIMCALL_PTR(NI, TY134053) (streamobj134035* s, void* buffer, NI buflen);
typedef N_NIMCALL_PTR(void, TY134059) (streamobj134035* s, void* buffer, NI buflen);
typedef N_NIMCALL_PTR(void, TY134065) (streamobj134035* s);
struct  streamobj134035  {
  TNimObject Sup;
TY134036 Closeimpl;
TY134040 Atendimpl;
TY134044 Setpositionimpl;
TY134049 Getpositionimpl;
TY134053 Readdataimpl;
TY134059 Writedataimpl;
TY134065 Flushimpl;
};
typedef NI TY26220[8];
struct  tpagedesc44743  {
tpagedesc44743* Next;
NI Key;
TY26220 Bits;
};
struct  tbasechunk26238  {
NI Prevsize;
NI Size;
NIM_BOOL Used;
};
struct  tsmallchunk26240  {
  tbasechunk26238 Sup;
tsmallchunk26240* Next;
tsmallchunk26240* Prev;
tfreecell26230* Freelist;
NI Free;
NI Acc;
NF Data;
};
struct  tllchunk27004  {
NI Size;
NI Acc;
tllchunk27004* Next;
};
struct  tbigchunk26242  {
  tbasechunk26238 Sup;
tbigchunk26242* Next;
tbigchunk26242* Prev;
NI Align;
NF Data;
};
struct  ttrunk26213  {
ttrunk26213* Next;
NI Key;
TY26220 Bits;
};
typedef tavlnode27008* TY27014[2];
struct  tavlnode27008  {
TY27014 Link;
NI Key;
NI Upperbound;
NI Level;
};
struct  filestreamobj134742  {
  streamobj134035 Sup;
FILE* F;
};
struct  tfreecell26230  {
tfreecell26230* Next;
NI Zerofield;
};
struct TY118408 {
  TGenericSeq Sup;
  NimStringDesc* data[SEQ_DECL_SIZE];
};
struct keyvaluepairseq130010 {
  TGenericSeq Sup;
  keyvaluepair130008 data[SEQ_DECL_SIZE];
};
struct TY140202 {
  TGenericSeq Sup;
  processobj139402* data[SEQ_DECL_SIZE];
};
N_NIMCALL(NimStringDesc*, nospquoteShellPosix)(NimStringDesc* s);
N_NIMCALL(NimStringDesc*, copyString)(NimStringDesc* src);
N_NIMCALL(NIM_BOOL, allcharsinset_96479)(NimStringDesc* s, TY210607 theset);
static N_INLINE(void, appendString)(NimStringDesc* dest, NimStringDesc* src);
N_NIMCALL(NimStringDesc*, nsuReplaceStr)(NimStringDesc* s, NimStringDesc* sub, NimStringDesc* by);
N_NIMCALL(NimStringDesc*, rawNewString)(NI space);
N_NIMCALL(processobj139402*, nospstartProcess)(NimStringDesc* command, NimStringDesc* workingdir, NimStringDesc** args, NI argsLen0, stringtableobj130012* env, NU8 options);
N_NIMCALL(void, nimGCvisit)(void* d, NI op);
N_NIMCALL(void, TMP2831)(void* p, NI op);
N_NIMCALL(void*, newObj)(TNimType* typ, NI size);
N_NIMCALL(void, raiseoserror_113609)(NI32 errorcode);
N_NIMCALL(NI32, oslasterror_113641)(void);
N_NIMCALL(void*, newSeq)(TNimType* typ, NI len);
N_NIMCALL(NimStringDesc*, copyStringRC1)(NimStringDesc* src);
static N_INLINE(void, nimGCunrefNoCycle)(void* p);
static N_INLINE(tcell44735*, usrtocell_48446)(void* usr);
static N_INLINE(void, rtladdzct_50004)(tcell44735* c);
N_NOINLINE(void, addzct_48417)(tcellseq44751* s, tcell44735* c);
N_NIMCALL(TGenericSeq*, incrSeq)(TGenericSeq* seq, NI elemsize);
N_NIMCALL(NCSTRING*, alloccstringarray_13201)(NimStringDesc** a, NI aLen0);
static N_INLINE(void, pushSafePoint)(TSafePoint* s);
N_NIMCALL(NCSTRING*, envtocstringarray_140855)(void);
N_NIMCALL(void, getenvvarsc_118602)(void);
N_NIMCALL(NI, nsuFindChar)(NimStringDesc* s, NIM_CHAR sub, NI start);
N_NIMCALL(NimStringDesc*, copyStrLast)(NimStringDesc* s, NI start_74628, NI last);
N_NIMCALL(NimStringDesc*, copyStrLast)(NimStringDesc* s, NI first, NI last);
N_NIMCALL(NimStringDesc*, copyStr)(NimStringDesc* s, NI start);
N_NIMCALL(NimStringDesc*, copyStr)(NimStringDesc* s, NI first);
N_NOCONV(void*, alloc0_5817)(NI size);
N_NOCONV(void*, alloc_5801)(NI size);
N_NIMCALL(NCSTRING*, envtocstringarray_140806)(stringtableobj130012* t);
N_NIMCALL(NI, nstlen)(stringtableobj130012* t);
N_NIMCALL(pid_t, startprocessauxfork_141001)(tstartprocessdata140951* data);
N_CDECL(void, startprocessafterfork_141004)(tstartprocessdata140951* data);
N_NIMCALL(void, startprocessfail_141825)(tstartprocessdata140951* data);
N_NOINLINE(void, nosraiseOSError)(NimStringDesc* msg);
N_NIMCALL(NimStringDesc*, cstrToNimstr)(NCSTRING str);
static N_INLINE(void, popSafePoint)(void);
N_NIMCALL(void, reraiseException)(void);
N_NIMCALL(NimStringDesc*, nsuJoinSep)(NimStringDesc** a, NI aLen0, NimStringDesc* sep);
N_NIMCALL(void, dealloccstringarray_13254)(NCSTRING* a);
N_NIMCALL(void, createstream_142339)(streamobj134035** stream, int* handle, NU8 filemode);
N_NIMCALL(NIM_BOOL, open_12411)(FILE** f, int filehandle, NU8 mode);
N_NIMCALL(filestreamobj134742*, newfilestream_134814)(FILE* f);
N_NIMCALL(void, unsureAsgnRef)(void** dest, void* src);
N_NIMCALL(NI, ncpicountProcessors)(void);
N_NIMCALL(void, TMP4179)(void* p, NI op);
N_NIMCALL(processobj139402*, startcmd_139644)(NimStringDesc* command, NU8 options);
static N_INLINE(void, asgnRef)(void** dest, void* src);
static N_INLINE(void, incref_50825)(tcell44735* c);
static N_INLINE(NIM_BOOL, canbecycleroot_48467)(tcell44735* c);
static N_INLINE(void, rtladdcycleroot_49229)(tcell44735* c);
N_NOINLINE(void, incl_45471)(tcellset44747* s, tcell44735* cell);
static N_INLINE(void, decref_50404)(tcell44735* c);
N_NIMCALL(void, nossleep)(NI milsecs);
N_NIMCALL(NIM_BOOL, nosprunning)(processobj139402* p);
N_NIMCALL(NI, nospwaitForExit)(processobj139402* p, NI timeout);
N_NIMCALL(void, nospclose)(processobj139402* p);
N_NIMCALL(void, close_134093)(streamobj134035* s);
STRING_LITERAL(TMP1783, "\'\'", 2);
static NIM_CONST TY210607 TMP1784 = {
0x00, 0x00, 0x00, 0x00, 0x20, 0xE8, 0xFF, 0x27,
0xFF, 0xFF, 0xFF, 0x87, 0xFE, 0xFF, 0xFF, 0x07,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}
;
STRING_LITERAL(TMP1785, "\'", 1);
STRING_LITERAL(TMP1786, "\'\"\'\"\'", 5);
STRING_LITERAL(TMP2832, "/bin/sh", 7);
STRING_LITERAL(TMP2833, "-c", 2);
STRING_LITERAL(TMP2835, "=", 1);
STRING_LITERAL(TMP2838, " ", 1);
STRING_LITERAL(TMP2839, "", 0);
static NIM_CONST TY202627 TMP4180 = {NIM_NIL,NIM_NIL};
extern TNimType NTI3211; /* RootObj */
TNimType NTI139402; /* ProcessObj */
extern TNimType NTI12208; /* FileHandle */
extern TNimType NTI134033; /* Stream */
extern TNimType NTI104462; /* TPid */
extern TNimType NTI5611; /* cint */
TNimType NTI139404; /* Process */
extern TNimType NTI118408; /* seq[string] */
extern tgcheap46816 gch_46844;
extern TSafePoint* exchandler_16043;
extern TY118408* environment_118409;
TNimType NTI140202; /* seq[Process] */

static N_INLINE(void, appendString)(NimStringDesc* dest, NimStringDesc* src) {
	memcpy(((NCSTRING) (&(*dest).data[((*dest).Sup.len)- 0])), ((NCSTRING) ((*src).data)), (NI64)((*src).Sup.len + 1));
	(*dest).Sup.len += (*src).Sup.len;
}

N_NIMCALL(NimStringDesc*, nospquoteShellPosix)(NimStringDesc* s) {
	NimStringDesc* result;
	NIM_BOOL safe;
	result = 0;
	{
		if (!(s->Sup.len == 0)) goto LA3;
		result = copyString(((NimStringDesc*) &TMP1783));
		goto BeforeRet;
	}
	LA3: ;
	safe = allcharsinset_96479(s, TMP1784);
	{
		if (!safe) goto LA7;
		result = copyString(s);
		goto BeforeRet;
	}
	goto LA5;
	LA7: ;
	{
		NimStringDesc* LOC10;
		NimStringDesc* LOC11;
		LOC10 = 0;
		LOC11 = 0;
		LOC11 = nsuReplaceStr(s, ((NimStringDesc*) &TMP1785), ((NimStringDesc*) &TMP1786));
		LOC10 = rawNewString(LOC11->Sup.len + 2);
appendString(LOC10, ((NimStringDesc*) &TMP1785));
appendString(LOC10, LOC11);
appendString(LOC10, ((NimStringDesc*) &TMP1785));
		result = LOC10;
		goto BeforeRet;
	}
	LA5: ;
	BeforeRet: ;
	return result;
}

N_NIMCALL(NimStringDesc*, nospquoteShell)(NimStringDesc* s) {
	NimStringDesc* result;
	result = 0;
	result = nospquoteShellPosix(s);
	goto BeforeRet;
	BeforeRet: ;
	return result;
}
N_NIMCALL(void, TMP2831)(void* p, NI op) {
	processobj139402* a;
	a = (processobj139402*)p;
	nimGCvisit((void*)(*a).Instream, op);
	nimGCvisit((void*)(*a).Outstream, op);
	nimGCvisit((void*)(*a).Errstream, op);
}

static N_INLINE(tcell44735*, usrtocell_48446)(void* usr) {
	tcell44735* result;
	result = 0;
	result = ((tcell44735*) ((NI)((NU64)(((NI) (usr))) - (NU64)(((NI)sizeof(tcell44735))))));
	return result;
}

static N_INLINE(void, rtladdzct_50004)(tcell44735* c) {
	addzct_48417(&gch_46844.Zct, c);
}

static N_INLINE(void, nimGCunrefNoCycle)(void* p) {
	tcell44735* c;
	c = usrtocell_48446(p);
	{
		(*c).Refcount -= 8;
		if (!((NU64)((*c).Refcount) < (NU64)(8))) goto LA3;
		rtladdzct_50004(c);
	}
	LA3: ;
}

static N_INLINE(void, pushSafePoint)(TSafePoint* s) {
	(*s).hasRaiseAction = NIM_FALSE;
	(*s).prev = exchandler_16043;
	exchandler_16043 = s;
}

N_NIMCALL(NCSTRING*, envtocstringarray_140855)(void) {
	NCSTRING* result;
	NI counter;
	void* LOC5;
	NI i;
	result = 0;
	counter = 0;
	{
		NimStringDesc* key_140859;
		NimStringDesc* val_140860;
		key_140859 = 0;
		val_140860 = 0;
		getenvvarsc_118602();
		{
			NI i_140895;
			NI HEX3Atmp_140897;
			NI res_140899;
			i_140895 = 0;
			HEX3Atmp_140897 = 0;
			HEX3Atmp_140897 = (environment_118409->Sup.len-1);
			res_140899 = 0;
			{
				while (1) {
					NI p_140901;
					if (!(res_140899 <= HEX3Atmp_140897)) goto LA4;
					i_140895 = res_140899;
					p_140901 = nsuFindChar(environment_118409->data[i_140895], 61, 0);
					key_140859 = copyStrLast(environment_118409->data[i_140895], 0, (NI64)(p_140901 - 1));
					val_140860 = copyStr(environment_118409->data[i_140895], (NI64)(p_140901 + 1));
					counter += 1;
					res_140899 += 1;
				} LA4: ;
			}
		}
	}
	LOC5 = 0;
	LOC5 = alloc0_5817((NI64)((NI64)(counter + 1) * 8));
	result = ((NCSTRING*) (LOC5));
	i = 0;
	{
		NimStringDesc* key_140875;
		NimStringDesc* val_140876;
		key_140875 = 0;
		val_140876 = 0;
		getenvvarsc_118602();
		{
			NI i_140914;
			NI HEX3Atmp_140916;
			NI res_140918;
			i_140914 = 0;
			HEX3Atmp_140916 = 0;
			HEX3Atmp_140916 = (environment_118409->Sup.len-1);
			res_140918 = 0;
			{
				while (1) {
					NI p_140920;
					NimStringDesc* x;
					NimStringDesc* LOC10;
					void* LOC11;
					if (!(res_140918 <= HEX3Atmp_140916)) goto LA9;
					i_140914 = res_140918;
					p_140920 = nsuFindChar(environment_118409->data[i_140914], 61, 0);
					key_140875 = copyStrLast(environment_118409->data[i_140914], 0, (NI64)(p_140920 - 1));
					val_140876 = copyStr(environment_118409->data[i_140914], (NI64)(p_140920 + 1));
					LOC10 = 0;
					LOC10 = rawNewString(key_140875->Sup.len + val_140876->Sup.len + 1);
appendString(LOC10, key_140875);
appendString(LOC10, ((NimStringDesc*) &TMP2835));
appendString(LOC10, val_140876);
					x = LOC10;
					LOC11 = 0;
					LOC11 = alloc_5801((NI64)(x->Sup.len + 1));
					result[(i)- 0] = ((NCSTRING) (LOC11));
					memcpy(((void*) (result[(i)- 0])), ((void*) (&x->data[0])), (NI64)(x->Sup.len + 1));
					i += 1;
					res_140918 += 1;
				} LA9: ;
			}
		}
	}
	return result;
}

N_NIMCALL(NCSTRING*, envtocstringarray_140806)(stringtableobj130012* t) {
	NCSTRING* result;
	NI LOC1;
	void* LOC2;
	NI i;
	result = 0;
	LOC1 = 0;
	LOC1 = nstlen(t);
	LOC2 = 0;
	LOC2 = alloc0_5817((NI64)((NI64)(LOC1 + 1) * 8));
	result = ((NCSTRING*) (LOC2));
	i = 0;
	{
		NimStringDesc* key_140812;
		NimStringDesc* val_140813;
		key_140812 = 0;
		val_140813 = 0;
		{
			NI h_140835;
			NI HEX3Atmp_140837;
			NI res_140839;
			h_140835 = 0;
			HEX3Atmp_140837 = 0;
			HEX3Atmp_140837 = ((*t).Data->Sup.len-1);
			res_140839 = 0;
			{
				while (1) {
					if (!(res_140839 <= HEX3Atmp_140837)) goto LA6;
					h_140835 = res_140839;
					{
						NimStringDesc* x;
						NimStringDesc* LOC11;
						void* LOC12;
						if (!!((*t).Data->data[h_140835].Field0 == 0)) goto LA9;
						key_140812 = (*t).Data->data[h_140835].Field0;
						val_140813 = (*t).Data->data[h_140835].Field1;
						LOC11 = 0;
						LOC11 = rawNewString(key_140812->Sup.len + val_140813->Sup.len + 1);
appendString(LOC11, key_140812);
appendString(LOC11, ((NimStringDesc*) &TMP2835));
appendString(LOC11, val_140813);
						x = LOC11;
						LOC12 = 0;
						LOC12 = alloc_5801((NI64)(x->Sup.len + 1));
						result[(i)- 0] = ((NCSTRING) (LOC12));
						memcpy(((void*) (result[(i)- 0])), ((void*) (&x->data[0])), (NI64)(x->Sup.len + 1));
						i += 1;
					}
					LA9: ;
					res_140839 += 1;
				} LA6: ;
			}
		}
	}
	return result;
}

N_NIMCALL(void, startprocessfail_141825)(tstartprocessdata140951* data) {
	int error;
	NI LOC1;
	error = errno;
	LOC1 = 0;
	LOC1 = write((*data).Perrorpipe[(1)- 0], ((void*) (&error)), 4);
	_exit(1);
}

N_CDECL(void, startprocessafterfork_141004)(tstartprocessdata140951* data) {
	int LOC42;
	int LOC43;
	{
		int LOC5;
		int LOC11;
		int LOC17;
		if (!!((*data).Optionpoparentstreams)) goto LA3;
		LOC5 = 0;
		LOC5 = close((*data).Pstdin[(1)- 0]);
		{
			int LOC8;
			LOC8 = 0;
			LOC8 = dup2((*data).Pstdin[(0)- 0], ((int) 0));
			if (!(LOC8 < ((NI32) 0))) goto LA9;
			startprocessfail_141825(data);
		}
		LA9: ;
		LOC11 = 0;
		LOC11 = close((*data).Pstdout[(0)- 0]);
		{
			int LOC14;
			LOC14 = 0;
			LOC14 = dup2((*data).Pstdout[(1)- 0], ((int) 1));
			if (!(LOC14 < ((NI32) 0))) goto LA15;
			startprocessfail_141825(data);
		}
		LA15: ;
		LOC17 = 0;
		LOC17 = close((*data).Pstderr[(0)- 0]);
		{
			if (!(*data).Optionpostderrtostdout) goto LA20;
			{
				int LOC24;
				LOC24 = 0;
				LOC24 = dup2((*data).Pstdout[(1)- 0], ((int) 2));
				if (!(LOC24 < ((NI32) 0))) goto LA25;
				startprocessfail_141825(data);
			}
			LA25: ;
		}
		goto LA18;
		LA20: ;
		{
			{
				int LOC30;
				LOC30 = 0;
				LOC30 = dup2((*data).Pstderr[(1)- 0], ((int) 2));
				if (!(LOC30 < ((NI32) 0))) goto LA31;
				startprocessfail_141825(data);
			}
			LA31: ;
		}
		LA18: ;
	}
	LA3: ;
	{
		if (!(0 < strlen((*data).Workingdir))) goto LA35;
		{
			int LOC39;
			LOC39 = 0;
			LOC39 = chdir((*data).Workingdir);
			if (!(LOC39 < ((NI32) 0))) goto LA40;
			startprocessfail_141825(data);
		}
		LA40: ;
	}
	LA35: ;
	LOC42 = 0;
	LOC42 = close((*data).Perrorpipe[(0)- 0]);
	LOC43 = 0;
	LOC43 = fcntl((*data).Perrorpipe[(1)- 0], F_SETFD, FD_CLOEXEC);
	{
		int LOC48;
		if (!(*data).Optionpousepath) goto LA46;
		LOC48 = 0;
		LOC48 = execvpe((*data).Syscommand, (*data).Sysargs, (*data).Sysenv);
	}
	goto LA44;
	LA46: ;
	{
		int LOC50;
		LOC50 = 0;
		LOC50 = execve((*data).Syscommand, (*data).Sysargs, (*data).Sysenv);
	}
	LA44: ;
	startprocessfail_141825(data);
}

static N_INLINE(void, popSafePoint)(void) {
	exchandler_16043 = (*exchandler_16043).prev;
}

N_NIMCALL(pid_t, startprocessauxfork_141001)(tstartprocessdata140951* data) {
	pid_t result;
	TSafePoint TMP2837;
	result = 0;
	{
		int LOC3;
		NI32 LOC6;
		LOC3 = 0;
		LOC3 = pipe((*data).Perrorpipe);
		if (!!((LOC3 == ((NI32) 0)))) goto LA4;
		LOC6 = 0;
		LOC6 = oslasterror_113641();
		raiseoserror_113609(LOC6);
	}
	LA4: ;
	pushSafePoint(&TMP2837);
	TMP2837.status = _setjmp(TMP2837.context);
	if (TMP2837.status == 0) {
		pid_t volatile pid;
		tstartprocessdata140951 volatile datacopy;
		int LOC12;
		int volatile error;
		NI volatile sizeread;
		int LOC24;
		pid = 0;
		datacopy = (*data);
		pid = fork();
		{
			if (!(pid == 0)) goto LA10;
			startprocessafterfork_141004(&datacopy);
			_exit(1);
		}
		LA10: ;
		LOC12 = 0;
		LOC12 = close((*data).Perrorpipe[(1)- 0]);
		{
			NI32 LOC17;
			if (!(pid < 0)) goto LA15;
			LOC17 = 0;
			LOC17 = oslasterror_113641();
			raiseoserror_113609(LOC17);
		}
		LA15: ;
		error = 0;
		sizeread = read((*data).Perrorpipe[(0)- 0], ((void*) (&error)), 4);
		{
			NCSTRING LOC22;
			NimStringDesc* LOC23;
			if (!(sizeread == 4)) goto LA20;
			LOC22 = 0;
			LOC22 = strerror(error);
			LOC23 = 0;
			LOC23 = cstrToNimstr(LOC22);
			nosraiseOSError(LOC23);
		}
		LA20: ;
		result = pid;
		popSafePoint();
		LOC24 = 0;
		LOC24 = close((*data).Perrorpipe[(0)- 0]);
		goto BeforeRet;
		popSafePoint();
	}
	else {
		popSafePoint();
	}
	{
		int LOC27;
		LOC27 = 0;
		LOC27 = close((*data).Perrorpipe[(0)- 0]);
	}
	if (TMP2837.status != 0) reraiseException();
	BeforeRet: ;
	return result;
}

N_NIMCALL(processobj139402*, nospstartProcess)(NimStringDesc* command, NimStringDesc* workingdir, NimStringDesc** args, NI argsLen0, stringtableobj130012* env, NU8 options) {
	processobj139402* result;
	TY141022 pstdin;
	TY141022 pstdout;
	TY141022 pstderr;
	NimStringDesc* syscommand;
	TY118408* sysargsraw;
	pid_t pid;
	NCSTRING* sysargs;
	TSafePoint TMP2834;
	result = 0;
	memset((void*)pstdin, 0, sizeof(pstdin));
	memset((void*)pstdout, 0, sizeof(pstdout));
	memset((void*)pstderr, 0, sizeof(pstderr));
	result = (processobj139402*) newObj((&NTI139404), sizeof(processobj139402));
	(*result).Sup.m_type = (&NTI139402);
	(*result).Exitcode = ((int) -3);
	{
		if (!!(((options &(1<<((((NU8) 4))&7)))!=0))) goto LA3;
		{
			NIM_BOOL LOC7;
			NIM_BOOL LOC8;
			int LOC9;
			int LOC11;
			int LOC13;
			NI32 LOC16;
			LOC7 = 0;
			LOC8 = 0;
			LOC9 = 0;
			LOC9 = pipe(pstdin);
			LOC8 = !((LOC9 == ((NI32) 0)));
			if (LOC8) goto LA10;
			LOC11 = 0;
			LOC11 = pipe(pstdout);
			LOC8 = !((LOC11 == ((NI32) 0)));
			LA10: ;
			LOC7 = LOC8;
			if (LOC7) goto LA12;
			LOC13 = 0;
			LOC13 = pipe(pstderr);
			LOC7 = !((LOC13 == ((NI32) 0)));
			LA12: ;
			if (!LOC7) goto LA14;
			LOC16 = 0;
			LOC16 = oslasterror_113641();
			raiseoserror_113609(LOC16);
		}
		LA14: ;
	}
	LA3: ;
	syscommand = 0;
	sysargsraw = 0;
	{
		TY207063 LOC21;
		NimStringDesc* LOC22;
		NimStringDesc* LOC23;
		NimStringDesc* LOC24;
		if (!((options &(1<<((((NU8) 2))&7)))!=0)) goto LA19;
		syscommand = copyString(((NimStringDesc*) &TMP2832));
		sysargsraw = (TY118408*) newSeq((&NTI118408), 3);
		memset((void*)LOC21, 0, sizeof(LOC21));
		LOC21[0] = copyString(syscommand);
		LOC21[1] = copyString(((NimStringDesc*) &TMP2833));
		LOC21[2] = copyString(command);
		LOC22 = 0;
		LOC22 = sysargsraw->data[0]; sysargsraw->data[0] = copyStringRC1(LOC21[0]);
		if (LOC22) nimGCunrefNoCycle(LOC22);
		LOC23 = 0;
		LOC23 = sysargsraw->data[1]; sysargsraw->data[1] = copyStringRC1(LOC21[1]);
		if (LOC23) nimGCunrefNoCycle(LOC23);
		LOC24 = 0;
		LOC24 = sysargsraw->data[2]; sysargsraw->data[2] = copyStringRC1(LOC21[2]);
		if (LOC24) nimGCunrefNoCycle(LOC24);
	}
	goto LA17;
	LA19: ;
	{
		TY196301 LOC26;
		NimStringDesc* LOC27;
		syscommand = copyString(command);
		sysargsraw = (TY118408*) newSeq((&NTI118408), 1);
		memset((void*)LOC26, 0, sizeof(LOC26));
		LOC26[0] = copyString(command);
		LOC27 = 0;
		LOC27 = sysargsraw->data[0]; sysargsraw->data[0] = copyStringRC1(LOC26[0]);
		if (LOC27) nimGCunrefNoCycle(LOC27);
		{
			NimStringDesc* arg_141230;
			NI i_141489;
			arg_141230 = 0;
			i_141489 = 0;
			{
				while (1) {
					NimStringDesc* LOC31;
					if (!(i_141489 < argsLen0)) goto LA30;
					arg_141230 = args[i_141489];
					sysargsraw = (TY118408*) incrSeq(&(sysargsraw)->Sup, sizeof(NimStringDesc*));
					LOC31 = 0;
					LOC31 = sysargsraw->data[sysargsraw->Sup.len-1]; sysargsraw->data[sysargsraw->Sup.len-1] = copyStringRC1(arg_141230);
					if (LOC31) nimGCunrefNoCycle(LOC31);
					i_141489 += 1;
				} LA30: ;
			}
		}
	}
	LA17: ;
	pid = 0;
	sysargs = alloccstringarray_13201(sysargsraw->data, sysargsraw->Sup.len);
	pushSafePoint(&TMP2834);
	TMP2834.status = _setjmp(TMP2834.context);
	if (TMP2834.status == 0) {
		NCSTRING* volatile sysenv;
		TSafePoint TMP2836;
		{
			if (!(env == NIM_NIL)) goto LA35;
			sysenv = envtocstringarray_140855();
		}
		goto LA33;
		LA35: ;
		{
			sysenv = envtocstringarray_140806(env);
		}
		LA33: ;
		pushSafePoint(&TMP2836);
		TMP2836.status = _setjmp(TMP2836.context);
		if (TMP2836.status == 0) {
			tstartprocessdata140951 volatile data;
			memset((void*)&data, 0, sizeof(data));
			data.Syscommand = syscommand->data;
			data.Sysargs = sysargs;
			data.Sysenv = sysenv;
			memcpy((void*)data.Pstdin, (NIM_CONST void*)pstdin, sizeof(data.Pstdin));
			memcpy((void*)data.Pstdout, (NIM_CONST void*)pstdout, sizeof(data.Pstdout));
			memcpy((void*)data.Pstderr, (NIM_CONST void*)pstderr, sizeof(data.Pstderr));
			data.Optionpoparentstreams = ((options &(1<<((((NU8) 4))&7)))!=0);
			data.Optionpousepath = ((options &(1<<((((NU8) 1))&7)))!=0);
			data.Optionpostderrtostdout = ((options &(1<<((((NU8) 3))&7)))!=0);
			data.Workingdir = workingdir->data;
			pid = startprocessauxfork_141001(&data);
			{
				NimStringDesc* LOC43;
				if (!((options &(1<<((((NU8) 0))&7)))!=0)) goto LA41;
				LOC43 = 0;
				LOC43 = nsuJoinSep(args, argsLen0, ((NimStringDesc*) &TMP2838));
				printf("%s%s%s\012", (command)->data, (((NimStringDesc*) &TMP2838))->data, (LOC43)->data);
			}
			LA41: ;
			(*result).Id = pid;
			{
				if (!((options &(1<<((((NU8) 4))&7)))!=0)) goto LA46;
				(*result).Inhandle = ((int) 0);
				(*result).Outhandle = ((int) 1);
				{
					if (!((options &(1<<((((NU8) 3))&7)))!=0)) goto LA50;
					(*result).Errhandle = (*result).Outhandle;
				}
				goto LA48;
				LA50: ;
				{
					(*result).Errhandle = ((int) 2);
				}
				LA48: ;
			}
			goto LA44;
			LA46: ;
			{
				int LOC60;
				int LOC61;
				int LOC62;
				(*result).Inhandle = pstdin[(1)- 0];
				(*result).Outhandle = pstdout[(0)- 0];
				{
					int LOC58;
					if (!((options &(1<<((((NU8) 3))&7)))!=0)) goto LA56;
					(*result).Errhandle = (*result).Outhandle;
					LOC58 = 0;
					LOC58 = close(pstderr[(0)- 0]);
				}
				goto LA54;
				LA56: ;
				{
					(*result).Errhandle = pstderr[(0)- 0];
				}
				LA54: ;
				LOC60 = 0;
				LOC60 = close(pstderr[(1)- 0]);
				LOC61 = 0;
				LOC61 = close(pstdin[(0)- 0]);
				LOC62 = 0;
				LOC62 = close(pstdout[(1)- 0]);
			}
			LA44: ;
			popSafePoint();
		}
		else {
			popSafePoint();
		}
		{
			dealloccstringarray_13254(sysenv);
		}
		if (TMP2836.status != 0) reraiseException();
		popSafePoint();
	}
	else {
		popSafePoint();
	}
	{
		dealloccstringarray_13254(sysargs);
	}
	if (TMP2834.status != 0) reraiseException();
	return result;
}

N_NIMCALL(processobj139402*, startcmd_139644)(NimStringDesc* command, NU8 options) {
	processobj139402* result;
	TY257532 LOC1;
	result = 0;
	memset((void*)LOC1, 0, sizeof(LOC1));
	result = nospstartProcess(command, ((NimStringDesc*) &TMP2839), LOC1, 0, NIM_NIL, (options | 4));
	return result;
}

N_NIMCALL(void, createstream_142339)(streamobj134035** stream, int* handle, NU8 filemode) {
	FILE* f;
	filestreamobj134742* LOC7;
	f = 0;
	{
		NIM_BOOL LOC3;
		NI32 LOC6;
		LOC3 = 0;
		LOC3 = open_12411(&f, (*handle), filemode);
		if (!!(LOC3)) goto LA4;
		LOC6 = 0;
		LOC6 = oslasterror_113641();
		raiseoserror_113609(LOC6);
	}
	LA4: ;
	LOC7 = 0;
	LOC7 = newfilestream_134814(f);
	unsureAsgnRef((void**) &(*stream), &LOC7->Sup);
}

N_NIMCALL(streamobj134035*, nospinputStream)(processobj139402* p) {
	streamobj134035* result;
	result = 0;
	{
		if (!((*p).Instream == NIM_NIL)) goto LA3;
		createstream_142339(&(*p).Instream, &(*p).Inhandle, ((NU8) 1));
	}
	LA3: ;
	result = (*p).Instream;
	goto BeforeRet;
	BeforeRet: ;
	return result;
}

N_NIMCALL(streamobj134035*, nospoutputStream)(processobj139402* p) {
	streamobj134035* result;
	result = 0;
	{
		if (!((*p).Outstream == NIM_NIL)) goto LA3;
		createstream_142339(&(*p).Outstream, &(*p).Outhandle, ((NU8) 0));
	}
	LA3: ;
	result = (*p).Outstream;
	goto BeforeRet;
	BeforeRet: ;
	return result;
}

N_NIMCALL(NI, nospwaitForExit)(processobj139402* p, NI timeout) {
	NI result;
	result = 0;
	{
		if (!!(((*p).Exitcode == ((NI32) -3)))) goto LA3;
		result = ((NI) ((*p).Exitcode));
		goto BeforeRet;
	}
	LA3: ;
	{
		pid_t LOC7;
		NI32 LOC10;
		LOC7 = 0;
		LOC7 = waitpid((*p).Id, &(*p).Exitcode, ((int) 0));
		if (!(LOC7 < 0)) goto LA8;
		(*p).Exitcode = ((int) -3);
		LOC10 = 0;
		LOC10 = oslasterror_113641();
		raiseoserror_113609(LOC10);
	}
	LA8: ;
	result = (NI)((NU64)(((NI) ((*p).Exitcode))) >> (NU64)(8));
	BeforeRet: ;
	return result;
}

N_NIMCALL(NI, nospcountProcessors)(void) {
	NI result;
	result = 0;
	result = ncpicountProcessors();
	return result;
}

N_NIMCALL(NI, nospexecCmd)(NimStringDesc* command) {
	NI result;
	int LOC1;
	result = 0;
	LOC1 = 0;
	LOC1 = system(command->data);
	result = ((NI) (LOC1));
	return result;
}
N_NIMCALL(void, TMP4179)(void* p, NI op) {
	TY140202* a;
	NI LOC1;
	a = (TY140202*)p;
	LOC1 = 0;
	for (LOC1 = 0; LOC1 < a->Sup.len; LOC1++) {
	nimGCvisit((void*)a->data[LOC1], op);
	}
}

static N_INLINE(NIM_BOOL, canbecycleroot_48467)(tcell44735* c) {
	NIM_BOOL result;
	result = 0;
	result = !((((*(*c).Typ).flags &(1<<((((NU8) 1))&7)))!=0));
	return result;
}

static N_INLINE(void, rtladdcycleroot_49229)(tcell44735* c) {
	{
		if (!!((((NI) ((NI)((*c).Refcount & 3))) == 3))) goto LA3;
		(*c).Refcount = (NI)((NI)((*c).Refcount & -4) | 3);
		incl_45471(&gch_46844.Cycleroots, c);
	}
	LA3: ;
}

static N_INLINE(void, incref_50825)(tcell44735* c) {
	(*c).Refcount = (NI)((NU64)((*c).Refcount) + (NU64)(8));
	{
		NIM_BOOL LOC3;
		LOC3 = 0;
		LOC3 = canbecycleroot_48467(c);
		if (!LOC3) goto LA4;
		rtladdcycleroot_49229(c);
	}
	LA4: ;
}

static N_INLINE(void, decref_50404)(tcell44735* c) {
	{
		(*c).Refcount -= 8;
		if (!((NU64)((*c).Refcount) < (NU64)(8))) goto LA3;
		rtladdzct_50004(c);
	}
	goto LA1;
	LA3: ;
	{
		NIM_BOOL LOC6;
		LOC6 = 0;
		LOC6 = canbecycleroot_48467(c);
		if (!LOC6) goto LA7;
		rtladdcycleroot_49229(c);
	}
	goto LA1;
	LA7: ;
	LA1: ;
}

static N_INLINE(void, asgnRef)(void** dest, void* src) {
	{
		tcell44735* LOC5;
		if (!!((src == NIM_NIL))) goto LA3;
		LOC5 = 0;
		LOC5 = usrtocell_48446(src);
		incref_50825(LOC5);
	}
	LA3: ;
	{
		tcell44735* LOC10;
		if (!!(((*dest) == NIM_NIL))) goto LA8;
		LOC10 = 0;
		LOC10 = usrtocell_48446((*dest));
		decref_50404(LOC10);
	}
	LA8: ;
	(*dest) = src;
}

N_NIMCALL(NIM_BOOL, nosprunning)(processobj139402* p) {
	NIM_BOOL result;
	pid_t ret;
	result = 0;
	ret = waitpid((*p).Id, &(*p).Exitcode, WNOHANG);
	{
		if (!(ret == 0)) goto LA3;
		result = NIM_TRUE;
		goto BeforeRet;
	}
	LA3: ;
	result = (ret == (*p).Id);
	BeforeRet: ;
	return result;
}

N_NIMCALL(void, nospclose)(processobj139402* p) {
	int LOC13;
	int LOC14;
	int LOC15;
	{
		if (!!(((*p).Instream == NIM_NIL))) goto LA3;
		close_134093((*p).Instream);
	}
	LA3: ;
	{
		if (!!(((*p).Outstream == NIM_NIL))) goto LA7;
		close_134093((*p).Outstream);
	}
	LA7: ;
	{
		if (!!(((*p).Errstream == NIM_NIL))) goto LA11;
		close_134093((*p).Errstream);
	}
	LA11: ;
	LOC13 = 0;
	LOC13 = close((*p).Inhandle);
	LOC14 = 0;
	LOC14 = close((*p).Outhandle);
	LOC15 = 0;
	LOC15 = close((*p).Errhandle);
}

N_NIMCALL(NI, nospexecProcesses)(NimStringDesc** cmds, NI cmdsLen0, NU8 options_139800, NI n, TY202627 beforerunevent) {
	NI result;
	NU8 options;
	result = 0;
	options = (options_139800 & ~ 16);
	{
		TY140202* q;
		NI m;
		NI i;
		if (!(1 < n)) goto LA3;
		q = 0;
		q = (TY140202*) newSeq((&NTI140202), n);
		m = ((n <= cmdsLen0) ? n : cmdsLen0);
		{
			NI i_140241;
			NI HEX3Atmp_140513;
			NI res_140516;
			i_140241 = 0;
			HEX3Atmp_140513 = 0;
			HEX3Atmp_140513 = (NI64)(m - 1);
			res_140516 = 0;
			{
				while (1) {
					if (!(res_140516 <= HEX3Atmp_140513)) goto LA7;
					i_140241 = res_140516;
					{
						if (!!((beforerunevent.ClPrc == TMP4180.ClPrc && beforerunevent.ClEnv == TMP4180.ClEnv))) goto LA10;
						beforerunevent.ClEnv? beforerunevent.ClPrc(i_140241, beforerunevent.ClEnv):((TMP4181)(beforerunevent.ClPrc))(i_140241);
					}
					LA10: ;
					asgnRef((void**) &q->data[i_140241], startcmd_139644(cmds[i_140241], options));
					res_140516 += 1;
				} LA7: ;
			}
		}
		i = m;
		{
			while (1) {
				if (!(i <= (cmdsLen0-1))) goto LA13;
				nossleep(50);
				{
					NI r_140413;
					NI HEX3Atmp_140520;
					NI res_140523;
					r_140413 = 0;
					HEX3Atmp_140520 = 0;
					HEX3Atmp_140520 = (NI64)(n - 1);
					res_140523 = 0;
					{
						while (1) {
							if (!(res_140523 <= HEX3Atmp_140520)) goto LA16;
							r_140413 = res_140523;
							{
								NIM_BOOL LOC19;
								NI LOC22;
								LOC19 = 0;
								LOC19 = nosprunning(q->data[r_140413]);
								if (!!(LOC19)) goto LA20;
								LOC22 = 0;
								LOC22 = nospwaitForExit(q->data[r_140413], -1);
								result = ((LOC22 >= result) ? LOC22 : result);
								{
									if (!!((q->data[r_140413] == NIM_NIL))) goto LA25;
									nospclose(q->data[r_140413]);
								}
								LA25: ;
								{
									if (!!((beforerunevent.ClPrc == TMP4180.ClPrc && beforerunevent.ClEnv == TMP4180.ClEnv))) goto LA29;
									beforerunevent.ClEnv? beforerunevent.ClPrc(i, beforerunevent.ClEnv):((TMP4182)(beforerunevent.ClPrc))(i);
								}
								LA29: ;
								asgnRef((void**) &q->data[r_140413], startcmd_139644(cmds[i], options));
								i += 1;
								{
									if (!((cmdsLen0-1) < i)) goto LA33;
									goto LA14;
								}
								LA33: ;
							}
							LA20: ;
							res_140523 += 1;
						} LA16: ;
					}
				} LA14: ;
			} LA13: ;
		}
		{
			NI j_140466;
			NI HEX3Atmp_140526;
			NI res_140529;
			j_140466 = 0;
			HEX3Atmp_140526 = 0;
			HEX3Atmp_140526 = (NI64)(m - 1);
			res_140529 = 0;
			{
				while (1) {
					NI LOC38;
					if (!(res_140529 <= HEX3Atmp_140526)) goto LA37;
					j_140466 = res_140529;
					LOC38 = 0;
					LOC38 = nospwaitForExit(q->data[j_140466], -1);
					result = ((LOC38 >= result) ? LOC38 : result);
					{
						if (!!((q->data[j_140466] == NIM_NIL))) goto LA41;
						nospclose(q->data[j_140466]);
					}
					LA41: ;
					res_140529 += 1;
				} LA37: ;
			}
		}
	}
	goto LA1;
	LA3: ;
	{
		{
			NI i_140497;
			NI HEX3Atmp_140532;
			NI res_140535;
			i_140497 = 0;
			HEX3Atmp_140532 = 0;
			HEX3Atmp_140532 = (cmdsLen0-1);
			res_140535 = 0;
			{
				while (1) {
					processobj139402* p;
					NI LOC51;
					if (!(res_140535 <= HEX3Atmp_140532)) goto LA46;
					i_140497 = res_140535;
					{
						if (!!((beforerunevent.ClPrc == TMP4180.ClPrc && beforerunevent.ClEnv == TMP4180.ClEnv))) goto LA49;
						beforerunevent.ClEnv? beforerunevent.ClPrc(i_140497, beforerunevent.ClEnv):((TMP4183)(beforerunevent.ClPrc))(i_140497);
					}
					LA49: ;
					p = startcmd_139644(cmds[i_140497], options);
					LOC51 = 0;
					LOC51 = nospwaitForExit(p, -1);
					result = ((LOC51 >= result) ? LOC51 : result);
					nospclose(p);
					res_140535 += 1;
				} LA46: ;
			}
		}
	}
	LA1: ;
	return result;
}
NIM_EXTERNC N_NOINLINE(void, stdlib_osprocInit)(void) {
}

NIM_EXTERNC N_NOINLINE(void, stdlib_osprocDatInit)(void) {
static TNimNode* TMP2830[8];
static TNimNode TMP29[9];
NTI139402.size = sizeof(processobj139402);
NTI139402.kind = 17;
NTI139402.base = (&NTI3211);
TMP2830[0] = &TMP29[1];
TMP29[1].kind = 1;
TMP29[1].offset = offsetof(processobj139402, Inhandle);
TMP29[1].typ = (&NTI12208);
TMP29[1].name = "inHandle";
TMP2830[1] = &TMP29[2];
TMP29[2].kind = 1;
TMP29[2].offset = offsetof(processobj139402, Outhandle);
TMP29[2].typ = (&NTI12208);
TMP29[2].name = "outHandle";
TMP2830[2] = &TMP29[3];
TMP29[3].kind = 1;
TMP29[3].offset = offsetof(processobj139402, Errhandle);
TMP29[3].typ = (&NTI12208);
TMP29[3].name = "errHandle";
TMP2830[3] = &TMP29[4];
TMP29[4].kind = 1;
TMP29[4].offset = offsetof(processobj139402, Instream);
TMP29[4].typ = (&NTI134033);
TMP29[4].name = "inStream";
TMP2830[4] = &TMP29[5];
TMP29[5].kind = 1;
TMP29[5].offset = offsetof(processobj139402, Outstream);
TMP29[5].typ = (&NTI134033);
TMP29[5].name = "outStream";
TMP2830[5] = &TMP29[6];
TMP29[6].kind = 1;
TMP29[6].offset = offsetof(processobj139402, Errstream);
TMP29[6].typ = (&NTI134033);
TMP29[6].name = "errStream";
TMP2830[6] = &TMP29[7];
TMP29[7].kind = 1;
TMP29[7].offset = offsetof(processobj139402, Id);
TMP29[7].typ = (&NTI104462);
TMP29[7].name = "id";
TMP2830[7] = &TMP29[8];
TMP29[8].kind = 1;
TMP29[8].offset = offsetof(processobj139402, Exitcode);
TMP29[8].typ = (&NTI5611);
TMP29[8].name = "exitCode";
TMP29[0].len = 8; TMP29[0].kind = 2; TMP29[0].sons = &TMP2830[0];
NTI139402.node = &TMP29[0];
NTI139404.size = sizeof(processobj139402*);
NTI139404.kind = 22;
NTI139404.base = (&NTI139402);
NTI139404.marker = TMP2831;
NTI140202.size = sizeof(TY140202*);
NTI140202.kind = 24;
NTI140202.base = (&NTI139404);
NTI140202.marker = TMP4179;
}
