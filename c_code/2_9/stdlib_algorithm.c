/* Generated by Nim Compiler v0.13.0 */
/*   (c) 2015 Andreas Rumpf */
/* The generated code is subject to the original license. */
#define NIM_INTBITS 64

#include "nimbase.h"
typedef struct Tsym215822 Tsym215822;
typedef struct Tsymseq215792 Tsymseq215792;
typedef struct TGenericSeq TGenericSeq;
typedef struct TNimType TNimType;
typedef struct TNimNode TNimNode;
typedef struct NimStringDesc NimStringDesc;
typedef struct TY125202 TY125202;
typedef struct Indexentry328126 Indexentry328126;
typedef struct TY330853 TY330853;
typedef struct Tidobj190006 Tidobj190006;
typedef struct TNimObject TNimObject;
typedef struct Ttypeseq215824 Ttypeseq215824;
typedef struct Tscope215816 Tscope215816;
typedef struct TY215925 TY215925;
typedef struct Tstrtable215794 Tstrtable215794;
typedef struct Ttype215828 Ttype215828;
typedef struct Tident190012 Tident190012;
typedef struct Tlineinfo183337 Tlineinfo183337;
typedef struct Tnode215790 Tnode215790;
typedef struct Tloc215804 Tloc215804;
typedef struct Ropeobj170006 Ropeobj170006;
typedef struct Tlib215808 Tlib215808;
typedef struct Tnodeseq215784 Tnodeseq215784;
typedef struct Tinstantiation215812 Tinstantiation215812;
typedef struct Tlistentry135010 Tlistentry135010;
typedef struct TY215913 TY215913;
typedef struct {
N_NIMCALL_PTR(NI, ClPrc) (Tsym215822* x_370850, Tsym215822* y_370852, void* ClEnv);
void* ClEnv;
} TY370848;
struct  TGenericSeq  {
NI len;
NI reserved;
};
typedef N_NIMCALL_PTR(void, TY3489) (void* p, NI op);
typedef N_NIMCALL_PTR(void*, TY3494) (void* p);
struct  TNimType  {
NI size;
NU8 kind;
NU8 flags;
TNimType* base;
TNimNode* node;
void* finalizer;
TY3489 marker;
TY3494 deepcopy;
};
struct  TNimNode  {
NU8 kind;
NI offset;
TNimType* typ;
NCSTRING name;
NI len;
TNimNode** sons;
};
typedef N_CLOSURE_PTR(NI, TMP2773) (Tsym215822* x_370905, Tsym215822* y_370907);
typedef N_CLOSURE_PTR(NI, TMP2774) (Tsym215822* x_370905, Tsym215822* y_370907);
struct  NimStringDesc  {
  TGenericSeq Sup;
NIM_CHAR data[SEQ_DECL_SIZE];
};
typedef struct {
N_NIMCALL_PTR(NI, ClPrc) (NimStringDesc* x_331475, NimStringDesc* y_331477, void* ClEnv);
void* ClEnv;
} TY331473;
typedef N_CLOSURE_PTR(NI, TMP5199) (NimStringDesc* x_331530, NimStringDesc* y_331532);
typedef N_CLOSURE_PTR(NI, TMP5200) (NimStringDesc* x_331530, NimStringDesc* y_331532);
typedef struct {
N_NIMCALL_PTR(NI, ClPrc) (Indexentry328126* x_329575, Indexentry328126* y_329577, void* ClEnv);
void* ClEnv;
} TY329573;
struct  Indexentry328126  {
NimStringDesc* keyword;
NimStringDesc* link;
NimStringDesc* linktitle;
NimStringDesc* linkdesc;
};
typedef N_CLOSURE_PTR(NI, TMP5203) (Indexentry328126* x_329630, Indexentry328126* y_329632);
typedef N_CLOSURE_PTR(NI, TMP5204) (Indexentry328126* x_329630, Indexentry328126* y_329632);
struct  TNimObject  {
TNimType* m_type;
};
struct  Tidobj190006  {
  TNimObject Sup;
NI id;
};
struct  Tstrtable215794  {
NI counter;
Tsymseq215792* data;
};
struct  Tlineinfo183337  {
NI16 line;
NI16 col;
NI32 fileindex;
};
struct  Tloc215804  {
NU8 k;
NU8 s;
NU16 flags;
Ttype215828* t;
Ropeobj170006* r;
Ropeobj170006* heaproot;
};
struct  Tsym215822  {
  Tidobj190006 Sup;
NU8 kind;
union{
struct {Ttypeseq215824* typeinstcache;
Tscope215816* typscope;
} S1;
struct {TY215925* procinstcache;
Tsym215822* gcunsafetyreason;
} S2;
struct {TY215925* usedgenerics;
Tstrtable215794 tab;
} S3;
struct {Tsym215822* guard;
NI bitsize;
} S4;
} kindU;
NU8 magic;
Ttype215828* typ;
Tident190012* name;
Tlineinfo183337 info;
Tsym215822* owner;
NU32 flags;
Tnode215790* ast;
NU32 options;
NI position;
NI offset;
Tloc215804 loc;
Tlib215808* annex;
Tnode215790* constraint;
};
struct  Tscope215816  {
NI depthlevel;
Tstrtable215794 symbols;
Tnodeseq215784* usingsyms;
Tscope215816* parent;
};
struct  Ttype215828  {
  Tidobj190006 Sup;
NU8 kind;
NU8 callconv;
NU32 flags;
Ttypeseq215824* sons;
Tnode215790* n;
Tsym215822* owner;
Tsym215822* sym;
Tsym215822* destructor;
Tsym215822* deepcopy;
Tsym215822* assignment;
NI64 size;
NI16 align;
NI16 locklevel;
Tloc215804 loc;
};
struct  Tident190012  {
  Tidobj190006 Sup;
NimStringDesc* s;
Tident190012* next;
NI h;
};
struct  Tnode215790  {
Ttype215828* typ;
Tlineinfo183337 info;
NU16 flags;
NU8 kind;
union{
struct {NI64 intval;
} S1;
struct {NF floatval;
} S2;
struct {NimStringDesc* strval;
} S3;
struct {Tsym215822* sym;
} S4;
struct {Tident190012* ident;
} S5;
struct {Tnodeseq215784* sons;
} S6;
} kindU;
NimStringDesc* comment;
};
struct  Ropeobj170006  {
  TNimObject Sup;
Ropeobj170006* left;
Ropeobj170006* right;
NI length;
NimStringDesc* data;
};
struct  Tlistentry135010  {
  TNimObject Sup;
Tlistentry135010* prev;
Tlistentry135010* next;
};
struct  Tlib215808  {
  Tlistentry135010 Sup;
NU8 kind;
NIM_BOOL generated;
NIM_BOOL isoverriden;
Ropeobj170006* name;
Tnode215790* path;
};
struct  Tinstantiation215812  {
Tsym215822* sym;
Ttypeseq215824* concretetypes;
TY215913* usedby;
NI compilesid;
};
struct Tsymseq215792 {
  TGenericSeq Sup;
  Tsym215822* data[SEQ_DECL_SIZE];
};
struct TY125202 {
  TGenericSeq Sup;
  NimStringDesc* data[SEQ_DECL_SIZE];
};
struct TY330853 {
  TGenericSeq Sup;
  Indexentry328126 data[SEQ_DECL_SIZE];
};
struct Ttypeseq215824 {
  TGenericSeq Sup;
  Ttype215828* data[SEQ_DECL_SIZE];
};
struct TY215925 {
  TGenericSeq Sup;
  Tinstantiation215812* data[SEQ_DECL_SIZE];
};
struct Tnodeseq215784 {
  TGenericSeq Sup;
  Tnode215790* data[SEQ_DECL_SIZE];
};
struct TY215913 {
  TGenericSeq Sup;
  NI32 data[SEQ_DECL_SIZE];
};
N_NIMCALL(void*, newSeq)(TNimType* typ, NI len);
N_NIMCALL(void, merge_370886)(Tsym215822** a, NI aLen0, Tsym215822** b, NI bLen0, NI lo, NI m, NI hi, TY370848 cmp, NU8 order);
static N_INLINE(NI, HEX2A_326008)(NI x, NU8 order);
N_NIMCALL(void, unsureAsgnRef)(void** dest, void* src);
N_NIMCALL(void, merge_331511)(NimStringDesc** a, NI aLen0, NimStringDesc** b, NI bLen0, NI lo, NI m, NI hi, TY331473 cmp, NU8 order);
N_NIMCALL(void, merge_329611)(Indexentry328126* a, NI aLen0, Indexentry328126* b, NI bLen0, NI lo, NI m, NI hi, TY329573 cmp, NU8 order);
N_NIMCALL(void, HEX3CHEX2D_328409)(Indexentry328126* a, Indexentry328126* b);
extern TNimType NTI215792; /* TSymSeq */
extern TNimType NTI104; /* int */
TNimType NTI326021; /* range -1..0(int) */
extern TNimType NTI125202; /* seq[string] */
extern TNimType NTI330853; /* seq[IndexEntry] */

static N_INLINE(NI, HEX2A_326008)(NI x, NU8 order) {
	NI result;
	NI y;
	result = 0;
	y = (NI)(((NI) (order)) - ((NI) 1));
	result = (NI)((NI)(x ^ ((NI) (y))) - ((NI) (y)));
	return result;
}

N_NIMCALL(void, merge_370886)(Tsym215822** a, NI aLen0, Tsym215822** b, NI bLen0, NI lo, NI m, NI hi, TY370848 cmp, NU8 order) {
	NI j;
	NI bb;
	NI i;
	NI k;
{	{
		NI LOC3;
		NI LOC4;
		LOC3 = 0;
		LOC3 = cmp.ClEnv? cmp.ClPrc(a[m], a[(NI)(m + ((NI) 1))], cmp.ClEnv):((TMP2773)(cmp.ClPrc))(a[m], a[(NI)(m + ((NI) 1))]);
		LOC4 = 0;
		LOC4 = HEX2A_326008(LOC3, order);
		if (!(LOC4 <= ((NI) 0))) goto LA5;
		goto BeforeRet;
	}
	LA5: ;
	j = lo;
	bb = ((NI) 0);
	{
		while (1) {
			if (!(j <= m)) goto LA8;
			unsureAsgnRef((void**) (&b[bb]), a[j]);
			bb += ((NI) 1);
			j += ((NI) 1);
		} LA8: ;
	}
	i = ((NI) 0);
	k = lo;
	{
		while (1) {
			NIM_BOOL LOC11;
			LOC11 = 0;
			LOC11 = (k < j);
			if (!(LOC11)) goto LA12;
			LOC11 = (j <= hi);
			LA12: ;
			if (!LOC11) goto LA10;
			{
				NI LOC15;
				NI LOC16;
				LOC15 = 0;
				LOC15 = cmp.ClEnv? cmp.ClPrc(b[i], a[j], cmp.ClEnv):((TMP2774)(cmp.ClPrc))(b[i], a[j]);
				LOC16 = 0;
				LOC16 = HEX2A_326008(LOC15, order);
				if (!(LOC16 <= ((NI) 0))) goto LA17;
				unsureAsgnRef((void**) (&a[k]), b[i]);
				i += ((NI) 1);
			}
			goto LA13;
			LA17: ;
			{
				unsureAsgnRef((void**) (&a[k]), a[j]);
				j += ((NI) 1);
			}
			LA13: ;
			k += ((NI) 1);
		} LA10: ;
	}
	{
		while (1) {
			if (!(k < j)) goto LA21;
			unsureAsgnRef((void**) (&a[k]), b[i]);
			k += ((NI) 1);
			i += ((NI) 1);
		} LA21: ;
	}
	}BeforeRet: ;
}

N_NIMCALL(void, sort_370841)(Tsym215822** a, NI aLen0, TY370848 cmp, NU8 order) {
	NI n;
	Tsymseq215792* b;
	NI s;
	n = aLen0;
	b = 0;
	b = (Tsymseq215792*) newSeq((&NTI215792), ((NI) ((NI)(n / ((NI) 2)))));
	s = ((NI) 1);
	{
		while (1) {
			NI m;
			if (!(s < n)) goto LA2;
			m = (NI)((NI)(n - ((NI) 1)) - s);
			{
				while (1) {
					if (!(((NI) 0) <= m)) goto LA4;
					merge_370886(a, aLen0, b->data, b->Sup.len, (((NI)((NI)(m - s) + ((NI) 1)) >= ((NI) 0)) ? (NI)((NI)(m - s) + ((NI) 1)) : ((NI) 0)), m, (NI)(m + s), cmp, order);
					m -= (NI)(s * ((NI) 2));
				} LA4: ;
			}
			s = (NI)(s * ((NI) 2));
		} LA2: ;
	}
}

N_NIMCALL(void, merge_331511)(NimStringDesc** a, NI aLen0, NimStringDesc** b, NI bLen0, NI lo, NI m, NI hi, TY331473 cmp, NU8 order) {
	NI j;
	NI bb;
	NI i;
	NI k;
{	{
		NI LOC3;
		NI LOC4;
		LOC3 = 0;
		LOC3 = cmp.ClEnv? cmp.ClPrc(a[m], a[(NI)(m + ((NI) 1))], cmp.ClEnv):((TMP5199)(cmp.ClPrc))(a[m], a[(NI)(m + ((NI) 1))]);
		LOC4 = 0;
		LOC4 = HEX2A_326008(LOC3, order);
		if (!(LOC4 <= ((NI) 0))) goto LA5;
		goto BeforeRet;
	}
	LA5: ;
	j = lo;
	bb = ((NI) 0);
	{
		while (1) {
			if (!(j <= m)) goto LA8;
			unsureAsgnRef((void**) (&b[bb]), a[j]);
			bb += ((NI) 1);
			j += ((NI) 1);
		} LA8: ;
	}
	i = ((NI) 0);
	k = lo;
	{
		while (1) {
			NIM_BOOL LOC11;
			LOC11 = 0;
			LOC11 = (k < j);
			if (!(LOC11)) goto LA12;
			LOC11 = (j <= hi);
			LA12: ;
			if (!LOC11) goto LA10;
			{
				NI LOC15;
				NI LOC16;
				LOC15 = 0;
				LOC15 = cmp.ClEnv? cmp.ClPrc(b[i], a[j], cmp.ClEnv):((TMP5200)(cmp.ClPrc))(b[i], a[j]);
				LOC16 = 0;
				LOC16 = HEX2A_326008(LOC15, order);
				if (!(LOC16 <= ((NI) 0))) goto LA17;
				unsureAsgnRef((void**) (&a[k]), b[i]);
				i += ((NI) 1);
			}
			goto LA13;
			LA17: ;
			{
				unsureAsgnRef((void**) (&a[k]), a[j]);
				j += ((NI) 1);
			}
			LA13: ;
			k += ((NI) 1);
		} LA10: ;
	}
	{
		while (1) {
			if (!(k < j)) goto LA21;
			unsureAsgnRef((void**) (&a[k]), b[i]);
			k += ((NI) 1);
			i += ((NI) 1);
		} LA21: ;
	}
	}BeforeRet: ;
}

N_NIMCALL(void, sort_331466)(NimStringDesc** a, NI aLen0, TY331473 cmp, NU8 order) {
	NI n;
	TY125202* b;
	NI s;
	n = aLen0;
	b = 0;
	b = (TY125202*) newSeq((&NTI125202), ((NI) ((NI)(n / ((NI) 2)))));
	s = ((NI) 1);
	{
		while (1) {
			NI m;
			if (!(s < n)) goto LA2;
			m = (NI)((NI)(n - ((NI) 1)) - s);
			{
				while (1) {
					if (!(((NI) 0) <= m)) goto LA4;
					merge_331511(a, aLen0, b->data, b->Sup.len, (((NI)((NI)(m - s) + ((NI) 1)) >= ((NI) 0)) ? (NI)((NI)(m - s) + ((NI) 1)) : ((NI) 0)), m, (NI)(m + s), cmp, order);
					m -= (NI)(s * ((NI) 2));
				} LA4: ;
			}
			s = (NI)(s * ((NI) 2));
		} LA2: ;
	}
}

N_NIMCALL(void, merge_329611)(Indexentry328126* a, NI aLen0, Indexentry328126* b, NI bLen0, NI lo, NI m, NI hi, TY329573 cmp, NU8 order) {
	NI j;
	NI bb;
	NI i;
	NI k;
{	{
		NI LOC3;
		NI LOC4;
		LOC3 = 0;
		LOC3 = cmp.ClEnv? cmp.ClPrc((&a[m]), (&a[(NI)(m + ((NI) 1))]), cmp.ClEnv):((TMP5203)(cmp.ClPrc))((&a[m]), (&a[(NI)(m + ((NI) 1))]));
		LOC4 = 0;
		LOC4 = HEX2A_326008(LOC3, order);
		if (!(LOC4 <= ((NI) 0))) goto LA5;
		goto BeforeRet;
	}
	LA5: ;
	j = lo;
	bb = ((NI) 0);
	{
		while (1) {
			if (!(j <= m)) goto LA8;
			HEX3CHEX2D_328409((&b[bb]), (&a[j]));
			bb += ((NI) 1);
			j += ((NI) 1);
		} LA8: ;
	}
	i = ((NI) 0);
	k = lo;
	{
		while (1) {
			NIM_BOOL LOC11;
			LOC11 = 0;
			LOC11 = (k < j);
			if (!(LOC11)) goto LA12;
			LOC11 = (j <= hi);
			LA12: ;
			if (!LOC11) goto LA10;
			{
				NI LOC15;
				NI LOC16;
				LOC15 = 0;
				LOC15 = cmp.ClEnv? cmp.ClPrc((&b[i]), (&a[j]), cmp.ClEnv):((TMP5204)(cmp.ClPrc))((&b[i]), (&a[j]));
				LOC16 = 0;
				LOC16 = HEX2A_326008(LOC15, order);
				if (!(LOC16 <= ((NI) 0))) goto LA17;
				HEX3CHEX2D_328409((&a[k]), (&b[i]));
				i += ((NI) 1);
			}
			goto LA13;
			LA17: ;
			{
				HEX3CHEX2D_328409((&a[k]), (&a[j]));
				j += ((NI) 1);
			}
			LA13: ;
			k += ((NI) 1);
		} LA10: ;
	}
	{
		while (1) {
			if (!(k < j)) goto LA21;
			HEX3CHEX2D_328409((&a[k]), (&b[i]));
			k += ((NI) 1);
			i += ((NI) 1);
		} LA21: ;
	}
	}BeforeRet: ;
}

N_NIMCALL(void, sort_329566)(Indexentry328126* a, NI aLen0, TY329573 cmp, NU8 order) {
	NI n;
	TY330853* b;
	NI s;
	n = aLen0;
	b = 0;
	b = (TY330853*) newSeq((&NTI330853), ((NI) ((NI)(n / ((NI) 2)))));
	s = ((NI) 1);
	{
		while (1) {
			NI m;
			if (!(s < n)) goto LA2;
			m = (NI)((NI)(n - ((NI) 1)) - s);
			{
				while (1) {
					if (!(((NI) 0) <= m)) goto LA4;
					merge_329611(a, aLen0, b->data, b->Sup.len, (((NI)((NI)(m - s) + ((NI) 1)) >= ((NI) 0)) ? (NI)((NI)(m - s) + ((NI) 1)) : ((NI) 0)), m, (NI)(m + s), cmp, order);
					m -= (NI)(s * ((NI) 2));
				} LA4: ;
			}
			s = (NI)(s * ((NI) 2));
		} LA2: ;
	}
}
NIM_EXTERNC N_NOINLINE(void, stdlib_algorithmInit000)(void) {
}

NIM_EXTERNC N_NOINLINE(void, stdlib_algorithmDatInit000)(void) {
NTI326021.size = sizeof(NI);
NTI326021.kind = 20;
NTI326021.base = (&NTI104);
NTI326021.flags = 3;
}
