/* Generated by Nim Compiler v0.10.0 */
/*   (c) 2014 Andreas Rumpf */
/* The generated code is subject to the original license. */
#define NIM_INTBITS 32
#include "nimbase.h"

#include <stdio.h>
typedef struct tnode223819 tnode223819;
typedef struct NimStringDesc NimStringDesc;
typedef struct TGenericSeq TGenericSeq;
typedef struct ttype223855 ttype223855;
typedef struct tlineinfo194539 tlineinfo194539;
typedef struct tsym223849 tsym223849;
typedef struct tident199021 tident199021;
typedef struct tnodeseq223813 tnodeseq223813;
typedef struct tllstream210204 tllstream210204;
typedef struct tidobj199015 tidobj199015;
typedef struct TNimObject TNimObject;
typedef struct TNimType TNimType;
typedef struct TNimNode TNimNode;
typedef struct ttypeseq223851 ttypeseq223851;
typedef struct tloc223833 tloc223833;
typedef struct trope176009 trope176009;
typedef struct tscope223843 tscope223843;
typedef struct TY223950 TY223950;
typedef struct tinstantiation223839 tinstantiation223839;
typedef struct tstrtable223823 tstrtable223823;
typedef struct tsymseq223821 tsymseq223821;
typedef struct tlib223837 tlib223837;
typedef struct TY223939 TY223939;
typedef struct tlistentry126022 tlistentry126022;
struct  TGenericSeq  {
NI len;
NI reserved;
};
struct  NimStringDesc  {
  TGenericSeq Sup;
NIM_CHAR data[SEQ_DECL_SIZE];
};
struct  tlineinfo194539  {
NI16 Line;
NI16 Col;
NI32 Fileindex;
};
struct  tnode223819  {
ttype223855* Typ;
tlineinfo194539 Info;
NU16 Flags;
NU8 Kind;
union {
struct {NI64 Intval;
} S1;
struct {NF Floatval;
} S2;
struct {NimStringDesc* Strval;
} S3;
struct {tsym223849* Sym;
} S4;
struct {tident199021* Ident;
} S5;
struct {tnodeseq223813* Sons;
} S6;
} kindU;
NimStringDesc* Comment;
};
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
struct  tidobj199015  {
  TNimObject Sup;
NI Id;
};
struct  tloc223833  {
NU8 K;
NU8 S;
NU8 Flags;
ttype223855* T;
trope176009* R;
trope176009* Heaproot;
};
struct  ttype223855  {
  tidobj199015 Sup;
NU8 Kind;
NU8 Callconv;
NU32 Flags;
ttypeseq223851* Sons;
tnode223819* N;
tsym223849* Owner;
tsym223849* Sym;
tsym223849* Destructor;
tsym223849* Deepcopy;
NI64 Size;
NI16 Align;
NI16 Locklevel;
tloc223833 Loc;
};
struct  tstrtable223823  {
NI Counter;
tsymseq223821* Data;
};
struct  tsym223849  {
  tidobj199015 Sup;
NU8 Kind;
union {
struct {ttypeseq223851* Typeinstcache;
tscope223843* Typscope;
} S1;
struct {TY223950* Procinstcache;
tscope223843* Scope;
} S2;
struct {TY223950* Usedgenerics;
tstrtable223823 Tab;
} S3;
struct {tsym223849* Guard;
} S4;
} kindU;
NU16 Magic;
ttype223855* Typ;
tident199021* Name;
tlineinfo194539 Info;
tsym223849* Owner;
NU32 Flags;
tnode223819* Ast;
NU32 Options;
NI Position;
NI Offset;
tloc223833 Loc;
tlib223837* Annex;
tnode223819* Constraint;
};
struct  tident199021  {
  tidobj199015 Sup;
NimStringDesc* S;
tident199021* Next;
NI H;
};
struct  tllstream210204  {
  TNimObject Sup;
NU8 Kind;
FILE* F;
NimStringDesc* S;
NI Rd;
NI Wr;
NI Lineoffset;
};
struct  TNimNode  {
NU8 kind;
NI offset;
TNimType* typ;
NCSTRING name;
NI len;
TNimNode** sons;
};
struct  trope176009  {
  TNimObject Sup;
trope176009* Left;
trope176009* Right;
NI Length;
NimStringDesc* Data;
};
struct  tscope223843  {
NI Depthlevel;
tstrtable223823 Symbols;
tnodeseq223813* Usingsyms;
tscope223843* Parent;
};
struct  tinstantiation223839  {
tsym223849* Sym;
ttypeseq223851* Concretetypes;
TY223939* Usedby;
};
struct  tlistentry126022  {
  TNimObject Sup;
tlistentry126022* Prev;
tlistentry126022* Next;
};
struct  tlib223837  {
  tlistentry126022 Sup;
NU8 Kind;
NIM_BOOL Generated;
NIM_BOOL Isoverriden;
trope176009* Name;
tnode223819* Path;
};
struct tnodeseq223813 {
  TGenericSeq Sup;
  tnode223819* data[SEQ_DECL_SIZE];
};
struct ttypeseq223851 {
  TGenericSeq Sup;
  ttype223855* data[SEQ_DECL_SIZE];
};
struct TY223950 {
  TGenericSeq Sup;
  tinstantiation223839* data[SEQ_DECL_SIZE];
};
struct tsymseq223821 {
  TGenericSeq Sup;
  tsym223849* data[SEQ_DECL_SIZE];
};
struct TY223939 {
  TGenericSeq Sup;
  NI32 data[SEQ_DECL_SIZE];
};
N_NIMCALL(tnode223819*, getarg_255057)(tnode223819* n, NimStringDesc* name, NI pos);
static N_INLINE(NI, sonslen_224252)(tnode223819* n);
N_NIMCALL(void, invalidpragma_255047)(tnode223819* n);
N_NIMCALL(void, localerror_196938)(tlineinfo194539 info, NU16 msg, NimStringDesc* arg);
N_NIMCALL(NimStringDesc*, rendertree_248057)(tnode223819* n, NU8 renderflags);
N_NIMCALL(NIM_BOOL, identeq_199493)(tident199021* id, NimStringDesc* name);
N_NIMCALL(NimStringDesc*, copyString)(NimStringDesc* src);
N_NIMCALL(NimStringDesc*, strarg_255029)(tnode223819* n, NimStringDesc* name, NI pos, NimStringDesc* default_255034);
N_NIMCALL(NIM_BOOL, boolarg_255038)(tnode223819* n, NimStringDesc* name, NI pos, NIM_BOOL default_255043);
N_NIMCALL(tllstream210204*, llstreamopen_210220)(NimStringDesc* data);
N_NIMCALL(NimStringDesc*, rawNewString)(NI space);
N_NIMCALL(NimStringDesc*, rawNewString)(NI cap);
N_NIMCALL(NIM_BOOL, llstreamreadline_210264)(tllstream210204* s, NimStringDesc** line);
N_NIMCALL(NimStringDesc*, nsuStrip)(NimStringDesc* s, NIM_BOOL leading, NIM_BOOL trailing);
N_NIMCALL(NIM_BOOL, nsuStartsWith)(NimStringDesc* s, NimStringDesc* prefix);
N_NIMCALL(void, llstreamwriteln_210300)(tllstream210204* s, NimStringDesc* data);
N_NIMCALL(void, llstreamclose_210250)(tllstream210204* s);
N_NIMCALL(NimStringDesc*, nsuReplaceStr)(NimStringDesc* s, NimStringDesc* sub, NimStringDesc* by);
STRING_LITERAL(TMP1339, "startswith", 10);
STRING_LITERAL(TMP1340, "", 0);
STRING_LITERAL(TMP1341, "true", 4);
STRING_LITERAL(TMP1342, "false", 5);
STRING_LITERAL(TMP1343, "leading", 7);
STRING_LITERAL(TMP1344, "trailing", 8);
STRING_LITERAL(TMP1345, "sub", 3);
STRING_LITERAL(TMP1346, "by", 2);

static N_INLINE(NI, sonslen_224252)(tnode223819* n) {
	NI result;
	result = 0;
	{
		if (!(*n).kindU.S6.Sons == 0) goto LA3;
		result = 0;
	}
	goto LA1;
	LA3: ;
	{
		result = (*n).kindU.S6.Sons->Sup.len;
	}
	LA1: ;
	return result;
}

N_NIMCALL(void, invalidpragma_255047)(tnode223819* n) {
	NimStringDesc* LOC1;
	LOC1 = 0;
	LOC1 = rendertree_248057(n, 4);
	localerror_196938((*n).Info, ((NU16) 163), LOC1);
}

N_NIMCALL(tnode223819*, getarg_255057)(tnode223819* n, NimStringDesc* name, NI pos) {
	tnode223819* result;
	result = 0;
	result = NIM_NIL;
	{
		if (!((*n).Kind >= ((NU8) 1) && (*n).Kind <= ((NU8) 23))) goto LA3;
		goto BeforeRet;
	}
	LA3: ;
	{
		NI i_255089;
		NI HEX3Atmp_255235;
		NI LOC6;
		NI res_255238;
		i_255089 = 0;
		HEX3Atmp_255235 = 0;
		LOC6 = 0;
		LOC6 = sonslen_224252(n);
		HEX3Atmp_255235 = (NI32)(LOC6 - 1);
		res_255238 = 1;
		{
			while (1) {
				if (!(res_255238 <= HEX3Atmp_255235)) goto LA8;
				i_255089 = res_255238;
				{
					if (!((*(*n).kindU.S6.Sons->data[i_255089]).Kind == ((NU8) 33))) goto LA11;
					{
						if (!!(((*(*(*n).kindU.S6.Sons->data[i_255089]).kindU.S6.Sons->data[0]).Kind == ((NU8) 2)))) goto LA15;
						invalidpragma_255047(n);
					}
					LA15: ;
					{
						NIM_BOOL LOC19;
						LOC19 = 0;
						LOC19 = identeq_199493((*(*(*n).kindU.S6.Sons->data[i_255089]).kindU.S6.Sons->data[0]).kindU.S5.Ident, name);
						if (!LOC19) goto LA20;
						result = (*(*n).kindU.S6.Sons->data[i_255089]).kindU.S6.Sons->data[1];
						goto BeforeRet;
					}
					LA20: ;
				}
				goto LA9;
				LA11: ;
				{
					if (!(i_255089 == pos)) goto LA23;
					result = (*n).kindU.S6.Sons->data[i_255089];
					goto BeforeRet;
				}
				goto LA9;
				LA23: ;
				LA9: ;
				res_255238 += 1;
			} LA8: ;
		}
	}
	BeforeRet: ;
	return result;
}

N_NIMCALL(NIM_CHAR, chararg_255020)(tnode223819* n, NimStringDesc* name, NI pos, NIM_CHAR default_255025) {
	NIM_CHAR result;
	tnode223819* x;
	result = 0;
	x = getarg_255057(n, name, pos);
	{
		if (!(x == NIM_NIL)) goto LA3;
		result = default_255025;
	}
	goto LA1;
	LA3: ;
	{
		if (!((*x).Kind == ((NU8) 5))) goto LA6;
		result = ((NIM_CHAR) (((NI) (((NI) ((*x).kindU.S1.Intval))))));
	}
	goto LA1;
	LA6: ;
	{
		invalidpragma_255047(n);
	}
	LA1: ;
	return result;
}

N_NIMCALL(NimStringDesc*, strarg_255029)(tnode223819* n, NimStringDesc* name, NI pos, NimStringDesc* default_255034) {
	NimStringDesc* result;
	tnode223819* x;
	result = 0;
	x = getarg_255057(n, name, pos);
	{
		if (!(x == NIM_NIL)) goto LA3;
		result = copyString(default_255034);
	}
	goto LA1;
	LA3: ;
	{
		if (!((*x).Kind >= ((NU8) 20) && (*x).Kind <= ((NU8) 22))) goto LA6;
		result = copyString((*x).kindU.S3.Strval);
	}
	goto LA1;
	LA6: ;
	{
		invalidpragma_255047(n);
	}
	LA1: ;
	return result;
}

N_NIMCALL(NIM_BOOL, boolarg_255038)(tnode223819* n, NimStringDesc* name, NI pos, NIM_BOOL default_255043) {
	NIM_BOOL result;
	tnode223819* x;
	result = 0;
	x = getarg_255057(n, name, pos);
	{
		if (!(x == NIM_NIL)) goto LA3;
		result = default_255043;
	}
	goto LA1;
	LA3: ;
	{
		NIM_BOOL LOC6;
		LOC6 = 0;
		LOC6 = ((*x).Kind == ((NU8) 2));
		if (!(LOC6)) goto LA7;
		LOC6 = identeq_199493((*x).kindU.S5.Ident, ((NimStringDesc*) &TMP1341));
		LA7: ;
		if (!LOC6) goto LA8;
		result = NIM_TRUE;
	}
	goto LA1;
	LA8: ;
	{
		NIM_BOOL LOC11;
		LOC11 = 0;
		LOC11 = ((*x).Kind == ((NU8) 2));
		if (!(LOC11)) goto LA12;
		LOC11 = identeq_199493((*x).kindU.S5.Ident, ((NimStringDesc*) &TMP1342));
		LA12: ;
		if (!LOC11) goto LA13;
		result = NIM_FALSE;
	}
	goto LA1;
	LA13: ;
	{
		invalidpragma_255047(n);
	}
	LA1: ;
	return result;
}

N_NIMCALL(tllstream210204*, filterstrip_255012)(tllstream210204* stdin_255014, NimStringDesc* filename, tnode223819* call) {
	tllstream210204* result;
	NimStringDesc* pattern;
	NIM_BOOL leading;
	NIM_BOOL trailing;
	NimStringDesc* line;
	result = 0;
	pattern = strarg_255029(call, ((NimStringDesc*) &TMP1339), 1, ((NimStringDesc*) &TMP1340));
	leading = boolarg_255038(call, ((NimStringDesc*) &TMP1343), 2, NIM_TRUE);
	trailing = boolarg_255038(call, ((NimStringDesc*) &TMP1344), 3, NIM_TRUE);
	result = llstreamopen_210220(((NimStringDesc*) &TMP1340));
	line = rawNewString(80);
	{
		while (1) {
			NIM_BOOL LOC3;
			NimStringDesc* stripped;
			LOC3 = 0;
			LOC3 = llstreamreadline_210264(stdin_255014, &line);
			if (!LOC3) goto LA2;
			stripped = nsuStrip(line, leading, trailing);
			{
				NIM_BOOL LOC6;
				LOC6 = 0;
				LOC6 = (pattern->Sup.len == 0);
				if (LOC6) goto LA7;
				LOC6 = nsuStartsWith(stripped, pattern);
				LA7: ;
				if (!LOC6) goto LA8;
				llstreamwriteln_210300(result, stripped);
			}
			goto LA4;
			LA8: ;
			{
				llstreamwriteln_210300(result, line);
			}
			LA4: ;
		} LA2: ;
	}
	llstreamclose_210250(stdin_255014);
	return result;
}

N_NIMCALL(tllstream210204*, filterreplace_255004)(tllstream210204* stdin_255006, NimStringDesc* filename, tnode223819* call) {
	tllstream210204* result;
	NimStringDesc* sub;
	NimStringDesc* by;
	NimStringDesc* line;
	result = 0;
	sub = strarg_255029(call, ((NimStringDesc*) &TMP1345), 1, ((NimStringDesc*) &TMP1340));
	{
		if (!(sub->Sup.len == 0)) goto LA3;
		invalidpragma_255047(call);
	}
	LA3: ;
	by = strarg_255029(call, ((NimStringDesc*) &TMP1346), 2, ((NimStringDesc*) &TMP1340));
	result = llstreamopen_210220(((NimStringDesc*) &TMP1340));
	line = rawNewString(80);
	{
		while (1) {
			NIM_BOOL LOC7;
			NimStringDesc* LOC8;
			LOC7 = 0;
			LOC7 = llstreamreadline_210264(stdin_255006, &line);
			if (!LOC7) goto LA6;
			LOC8 = 0;
			LOC8 = nsuReplaceStr(line, sub, by);
			llstreamwriteln_210300(result, LOC8);
		} LA6: ;
	}
	llstreamclose_210250(stdin_255006);
	return result;
}
NIM_EXTERNC N_NOINLINE(void, HEX00_filtersInit)(void) {
}

NIM_EXTERNC N_NOINLINE(void, HEX00_filtersDatInit)(void) {
}
