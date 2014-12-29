/* Generated by Nim Compiler v0.10.0 */
/*   (c) 2014 Andreas Rumpf */
/* The generated code is subject to the original license. */
#define NIM_INTBITS 64
#include "nimbase.h"

#include <string.h>
typedef struct stringtableobj131012 stringtableobj131012;
typedef struct tident200021 tident200021;
typedef struct NimStringDesc NimStringDesc;
typedef struct TGenericSeq TGenericSeq;
typedef struct tidobj200015 tidobj200015;
typedef struct TNimObject TNimObject;
typedef struct TNimType TNimType;
typedef struct TNimNode TNimNode;
typedef struct keyvaluepairseq131010 keyvaluepairseq131010;
typedef struct keyvaluepair131008 keyvaluepair131008;
typedef struct tcell44735 tcell44735;
typedef struct tcellset44747 tcellset44747;
typedef struct tgcheap46816 tgcheap46816;
typedef struct tcellseq44751 tcellseq44751;
typedef struct tpagedesc44743 tpagedesc44743;
typedef struct tmemregion27010 tmemregion27010;
typedef struct tsmallchunk26240 tsmallchunk26240;
typedef struct tllchunk27004 tllchunk27004;
typedef struct tbigchunk26242 tbigchunk26242;
typedef struct tintset26217 tintset26217;
typedef struct ttrunk26213 ttrunk26213;
typedef struct tavlnode27008 tavlnode27008;
typedef struct tgcstat46814 tgcstat46814;
typedef struct tinfocpu174463 tinfocpu174463;
typedef struct tinfoos174048 tinfoos174048;
typedef struct TY119408 TY119408;
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
struct  tidobj200015  {
  TNimObject Sup;
NI Id;
};
struct  tident200021  {
  tidobj200015 Sup;
NimStringDesc* S;
tident200021* Next;
NI H;
};
struct keyvaluepair131008 {
NimStringDesc* Field0;
NimStringDesc* Field1;
};
struct  stringtableobj131012  {
  TNimObject Sup;
NI Counter;
keyvaluepairseq131010* Data;
NU8 Mode;
};
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
struct tinfocpu174463 {
NimStringDesc* Field0;
NI Field1;
NU8 Field2;
NI Field3;
NI Field4;
};
typedef tinfocpu174463 TY174481[14];
typedef NimStringDesc* TY174475[2];
struct tinfoos174048 {
NimStringDesc* Field0;
NimStringDesc* Field1;
NimStringDesc* Field2;
NimStringDesc* Field3;
NimStringDesc* Field4;
NimStringDesc* Field5;
NimStringDesc* Field6;
NimStringDesc* Field7;
NimStringDesc* Field8;
NimStringDesc* Field9;
NimStringDesc* Field10;
NimStringDesc* Field11;
NU8 Field12;
};
typedef tinfoos174048 TY174070[23];
struct  TNimNode  {
NU8 kind;
NI offset;
TNimType* typ;
NCSTRING name;
NI len;
TNimNode** sons;
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
struct  tfreecell26230  {
tfreecell26230* Next;
NI Zerofield;
};
struct keyvaluepairseq131010 {
  TGenericSeq Sup;
  keyvaluepair131008 data[SEQ_DECL_SIZE];
};
struct TY119408 {
  TGenericSeq Sup;
  NimStringDesc* data[SEQ_DECL_SIZE];
};
N_NIMCALL(NIM_BOOL, isdefined_201036)(NimStringDesc* symbol);
N_NIMCALL(NIM_BOOL, nsthasKey)(stringtableobj131012* t, NimStringDesc* key);
N_NIMCALL(NimStringDesc*, nstGet)(stringtableobj131012* t, NimStringDesc* key);
static N_INLINE(NIM_BOOL, eqStrings)(NimStringDesc* a, NimStringDesc* b);
N_NIMCALL(stringtableobj131012*, nstnewStringTable)(NU8 mode);
static N_INLINE(void, asgnRef)(void** dest, void* src);
static N_INLINE(void, incref_50825)(tcell44735* c);
static N_INLINE(NIM_BOOL, canbecycleroot_48467)(tcell44735* c);
static N_INLINE(void, rtladdcycleroot_49229)(tcell44735* c);
N_NOINLINE(void, incl_45471)(tcellset44747* s, tcell44735* cell);
static N_INLINE(tcell44735*, usrtocell_48446)(void* usr);
static N_INLINE(void, decref_50404)(tcell44735* c);
static N_INLINE(void, rtladdzct_50004)(tcell44735* c);
N_NOINLINE(void, addzct_48417)(tcellseq44751* s, tcell44735* c);
N_NIMCALL(void, definesymbol_201009)(NimStringDesc* symbol);
N_NIMCALL(void, nstPut)(stringtableobj131012* t, NimStringDesc* key, NimStringDesc* val);
N_NIMCALL(void, declaresymbol_201018)(NimStringDesc* symbol);
static N_INLINE(void, appendString)(NimStringDesc* dest, NimStringDesc* src);
N_NIMCALL(NimStringDesc*, nimIntToStr)(NI x);
N_NIMCALL(NimStringDesc*, rawNewString)(NI space);
N_NIMCALL(NimStringDesc*, nsuNormalize)(NimStringDesc* s);
STRING_LITERAL(TMP1384, "true", 4);
STRING_LITERAL(TMP1430, "nimrod", 6);
STRING_LITERAL(TMP1431, "nimhygiene", 10);
STRING_LITERAL(TMP1432, "niminheritable", 14);
STRING_LITERAL(TMP1433, "nimmixin", 8);
STRING_LITERAL(TMP1434, "nimeffects", 10);
STRING_LITERAL(TMP1435, "nimbabel", 8);
STRING_LITERAL(TMP1436, "nimcomputedgoto", 15);
STRING_LITERAL(TMP1437, "nimunion", 8);
STRING_LITERAL(TMP1438, "nimnewshared", 12);
STRING_LITERAL(TMP1439, "nimrequiresnimframe", 19);
STRING_LITERAL(TMP1440, "nimparsebiggestfloatmagic", 25);
STRING_LITERAL(TMP1441, "nimalias", 8);
STRING_LITERAL(TMP1442, "nimlocks", 8);
STRING_LITERAL(TMP1443, "unknown", 7);
STRING_LITERAL(TMP1444, "cpu", 3);
extern NIM_CONST TY174481 cpu_174480;
extern NIM_CONST TY174475 endiantostr_174474;
extern NIM_CONST TY174070 os_174069;
STRING_LITERAL(TMP1447, "x86", 3);
STRING_LITERAL(TMP1448, "itanium", 7);
STRING_LITERAL(TMP1449, "x8664", 5);
STRING_LITERAL(TMP1450, "msdos", 5);
STRING_LITERAL(TMP1451, "mswindows", 9);
STRING_LITERAL(TMP1452, "win32", 5);
STRING_LITERAL(TMP1453, "unix", 4);
STRING_LITERAL(TMP1454, "posix", 5);
STRING_LITERAL(TMP1455, "sunos", 5);
STRING_LITERAL(TMP1456, "bsd", 3);
STRING_LITERAL(TMP1457, "macintosh", 9);
STRING_LITERAL(TMP1458, "RISCOS", 6);
STRING_LITERAL(TMP1459, "doslike", 7);
STRING_LITERAL(TMP1460, "hpux", 4);
STRING_LITERAL(TMP1461, "mac", 3);
STRING_LITERAL(TMP1462, "hppa", 4);
STRING_LITERAL(TMP1463, "hp9000", 6);
STRING_LITERAL(TMP1464, "hp9000s300", 10);
STRING_LITERAL(TMP1465, "hp9000s700", 10);
STRING_LITERAL(TMP1466, "hp9000s800", 10);
STRING_LITERAL(TMP1467, "hp9000s820", 10);
STRING_LITERAL(TMP1468, "ELATE", 5);
STRING_LITERAL(TMP1469, "sparcv9", 7);
STRING_LITERAL(TMP1470, "ecmascript", 10);
STRING_LITERAL(TMP1471, "js", 2);
STRING_LITERAL(TMP1472, "nimrodvm", 8);
STRING_LITERAL(TMP1473, "nimffi", 6);
STRING_LITERAL(TMP1474, "nimdoc", 6);
STRING_LITERAL(TMP1475, "cpp", 3);
STRING_LITERAL(TMP1476, "objc", 4);
STRING_LITERAL(TMP1477, "gcc", 3);
STRING_LITERAL(TMP1478, "llvmgcc", 7);
STRING_LITERAL(TMP1479, "clang", 5);
STRING_LITERAL(TMP1480, "lcc", 3);
STRING_LITERAL(TMP1481, "bcc", 3);
STRING_LITERAL(TMP1482, "dmc", 3);
STRING_LITERAL(TMP1483, "wcc", 3);
STRING_LITERAL(TMP1484, "vcc", 3);
STRING_LITERAL(TMP1485, "tcc", 3);
STRING_LITERAL(TMP1486, "pcc", 3);
STRING_LITERAL(TMP1487, "ucc", 3);
STRING_LITERAL(TMP1488, "icl", 3);
STRING_LITERAL(TMP1489, "boehmgc", 7);
STRING_LITERAL(TMP1490, "gcmarkandsweep", 14);
STRING_LITERAL(TMP1491, "gcgenerational", 14);
STRING_LITERAL(TMP1492, "nogc", 4);
STRING_LITERAL(TMP1493, "gcUseBitvectors", 15);
STRING_LITERAL(TMP1494, "endb", 4);
STRING_LITERAL(TMP1495, "profiler", 8);
STRING_LITERAL(TMP1496, "executable", 10);
STRING_LITERAL(TMP1497, "guiapp", 6);
STRING_LITERAL(TMP1498, "consoleapp", 10);
STRING_LITERAL(TMP1499, "library", 7);
STRING_LITERAL(TMP1500, "dll", 3);
STRING_LITERAL(TMP1501, "staticlib", 9);
STRING_LITERAL(TMP1502, "quick", 5);
STRING_LITERAL(TMP1503, "release", 7);
STRING_LITERAL(TMP1504, "debug", 5);
STRING_LITERAL(TMP1505, "useWinAnsi", 10);
STRING_LITERAL(TMP1506, "useFork", 7);
STRING_LITERAL(TMP1507, "useNimRtl", 9);
STRING_LITERAL(TMP1508, "useMalloc", 9);
STRING_LITERAL(TMP1509, "useRealtimeGC", 13);
STRING_LITERAL(TMP1510, "ssl", 3);
STRING_LITERAL(TMP1511, "memProfiler", 11);
STRING_LITERAL(TMP1512, "nodejs", 6);
STRING_LITERAL(TMP1513, "kwin", 4);
STRING_LITERAL(TMP1514, "nimfix", 6);
STRING_LITERAL(TMP1515, "usesysassert", 12);
STRING_LITERAL(TMP1516, "usegcassert", 11);
STRING_LITERAL(TMP1517, "tinyC", 5);
STRING_LITERAL(TMP1518, "useFFI", 6);
STRING_LITERAL(TMP1519, "useStdoutAsStdmsg", 17);
STRING_LITERAL(TMP1520, "createNimRtl", 12);
STRING_LITERAL(TMP1521, "booting", 7);
STRING_LITERAL(TMP1522, "fulldebug", 9);
STRING_LITERAL(TMP1523, "corruption", 10);
STRING_LITERAL(TMP1524, "nimsuperops", 11);
STRING_LITERAL(TMP1525, "noSignalHandler", 15);
STRING_LITERAL(TMP1526, "useGnuReadline", 14);
STRING_LITERAL(TMP1527, "noCaas", 6);
STRING_LITERAL(TMP1528, "noDocGen", 8);
STRING_LITERAL(TMP1529, "noBusyWaiting", 13);
STRING_LITERAL(TMP1530, "nativeStackTrace", 16);
STRING_LITERAL(TMP1531, "useNodeIds", 10);
STRING_LITERAL(TMP1532, "selftest", 8);
STRING_LITERAL(TMP1533, "reportMissedDeadlines", 21);
STRING_LITERAL(TMP1534, "avoidTimeMachine", 16);
STRING_LITERAL(TMP1535, "useClone", 8);
STRING_LITERAL(TMP1536, "ignoreAllocationSize", 20);
STRING_LITERAL(TMP1537, "debugExecProcesses", 18);
STRING_LITERAL(TMP1538, "pcreDll", 7);
STRING_LITERAL(TMP1539, "useLipzipSrc", 12);
STRING_LITERAL(TMP1540, "preventDeadlocks", 16);
STRING_LITERAL(TMP1541, "UNICODE", 7);
STRING_LITERAL(TMP1542, "winUnicode", 10);
STRING_LITERAL(TMP1543, "trackGcHeaders", 14);
STRING_LITERAL(TMP1544, "posixRealtime", 13);
STRING_LITERAL(TMP1545, "nimStdSetjmp", 12);
STRING_LITERAL(TMP1546, "nimRawSetjmp", 12);
STRING_LITERAL(TMP1547, "nimSigSetjmp", 12);
NIM_CONST struct {
  TGenericSeq Sup;
  NimStringDesc* data[101];
} CNSTSEQ1549 = {{101, 101}, {((NimStringDesc*) &TMP1447),
((NimStringDesc*) &TMP1448),
((NimStringDesc*) &TMP1449),
((NimStringDesc*) &TMP1450),
((NimStringDesc*) &TMP1451),
((NimStringDesc*) &TMP1452),
((NimStringDesc*) &TMP1453),
((NimStringDesc*) &TMP1454),
((NimStringDesc*) &TMP1455),
((NimStringDesc*) &TMP1456),
((NimStringDesc*) &TMP1457),
((NimStringDesc*) &TMP1458),
((NimStringDesc*) &TMP1459),
((NimStringDesc*) &TMP1460),
((NimStringDesc*) &TMP1461),
((NimStringDesc*) &TMP1462),
((NimStringDesc*) &TMP1463),
((NimStringDesc*) &TMP1464),
((NimStringDesc*) &TMP1465),
((NimStringDesc*) &TMP1466),
((NimStringDesc*) &TMP1467),
((NimStringDesc*) &TMP1468),
((NimStringDesc*) &TMP1469),
((NimStringDesc*) &TMP1470),
((NimStringDesc*) &TMP1471),
((NimStringDesc*) &TMP1472),
((NimStringDesc*) &TMP1473),
((NimStringDesc*) &TMP1474),
((NimStringDesc*) &TMP1475),
((NimStringDesc*) &TMP1476),
((NimStringDesc*) &TMP1477),
((NimStringDesc*) &TMP1478),
((NimStringDesc*) &TMP1479),
((NimStringDesc*) &TMP1480),
((NimStringDesc*) &TMP1481),
((NimStringDesc*) &TMP1482),
((NimStringDesc*) &TMP1483),
((NimStringDesc*) &TMP1484),
((NimStringDesc*) &TMP1485),
((NimStringDesc*) &TMP1486),
((NimStringDesc*) &TMP1487),
((NimStringDesc*) &TMP1488),
((NimStringDesc*) &TMP1489),
((NimStringDesc*) &TMP1490),
((NimStringDesc*) &TMP1491),
((NimStringDesc*) &TMP1492),
((NimStringDesc*) &TMP1493),
((NimStringDesc*) &TMP1494),
((NimStringDesc*) &TMP1495),
((NimStringDesc*) &TMP1496),
((NimStringDesc*) &TMP1497),
((NimStringDesc*) &TMP1498),
((NimStringDesc*) &TMP1499),
((NimStringDesc*) &TMP1500),
((NimStringDesc*) &TMP1501),
((NimStringDesc*) &TMP1502),
((NimStringDesc*) &TMP1503),
((NimStringDesc*) &TMP1504),
((NimStringDesc*) &TMP1505),
((NimStringDesc*) &TMP1506),
((NimStringDesc*) &TMP1507),
((NimStringDesc*) &TMP1508),
((NimStringDesc*) &TMP1509),
((NimStringDesc*) &TMP1510),
((NimStringDesc*) &TMP1511),
((NimStringDesc*) &TMP1512),
((NimStringDesc*) &TMP1513),
((NimStringDesc*) &TMP1514),
((NimStringDesc*) &TMP1515),
((NimStringDesc*) &TMP1516),
((NimStringDesc*) &TMP1517),
((NimStringDesc*) &TMP1518),
((NimStringDesc*) &TMP1519),
((NimStringDesc*) &TMP1520),
((NimStringDesc*) &TMP1521),
((NimStringDesc*) &TMP1522),
((NimStringDesc*) &TMP1523),
((NimStringDesc*) &TMP1524),
((NimStringDesc*) &TMP1525),
((NimStringDesc*) &TMP1526),
((NimStringDesc*) &TMP1527),
((NimStringDesc*) &TMP1528),
((NimStringDesc*) &TMP1529),
((NimStringDesc*) &TMP1530),
((NimStringDesc*) &TMP1531),
((NimStringDesc*) &TMP1532),
((NimStringDesc*) &TMP1533),
((NimStringDesc*) &TMP1534),
((NimStringDesc*) &TMP1535),
((NimStringDesc*) &TMP1536),
((NimStringDesc*) &TMP1537),
((NimStringDesc*) &TMP1538),
((NimStringDesc*) &TMP1539),
((NimStringDesc*) &TMP1540),
((NimStringDesc*) &TMP1541),
((NimStringDesc*) &TMP1542),
((NimStringDesc*) &TMP1543),
((NimStringDesc*) &TMP1544),
((NimStringDesc*) &TMP1545),
((NimStringDesc*) &TMP1546),
((NimStringDesc*) &TMP1547)}};
NIM_CONST TY119408* additionalsymbols_201142 = ((TY119408*)&CNSTSEQ1549);
STRING_LITERAL(TMP1549, "emulatedthreadvars", 18);
STRING_LITERAL(TMP1680, "false", 5);
stringtableobj131012* gsymbols_201004;
extern tgcheap46816 gch_46844;
extern NU8 targetcpu_174587;
extern NU8 targetos_174589;

static N_INLINE(NIM_BOOL, eqStrings)(NimStringDesc* a, NimStringDesc* b) {
	NIM_BOOL result;
	NIM_BOOL LOC11;
	int LOC13;
	result = 0;
	{
		if (!(a == b)) goto LA3;
		result = NIM_TRUE;
		goto BeforeRet;
	}
	LA3: ;
	{
		NIM_BOOL LOC7;
		LOC7 = 0;
		LOC7 = (a == NIM_NIL);
		if (LOC7) goto LA8;
		LOC7 = (b == NIM_NIL);
		LA8: ;
		if (!LOC7) goto LA9;
		result = NIM_FALSE;
		goto BeforeRet;
	}
	LA9: ;
	LOC11 = 0;
	LOC11 = ((*a).Sup.len == (*b).Sup.len);
	if (!(LOC11)) goto LA12;
	LOC13 = 0;
	LOC13 = memcmp(((NCSTRING) ((*a).data)), ((NCSTRING) ((*b).data)), (NI64)((*a).Sup.len * 1));
	LOC11 = (LOC13 == ((NI32) 0));
	LA12: ;
	result = LOC11;
	goto BeforeRet;
	BeforeRet: ;
	return result;
}

N_NIMCALL(NIM_BOOL, isdefined_201036)(NimStringDesc* symbol) {
	NIM_BOOL result;
	result = 0;
	{
		NIM_BOOL LOC3;
		NimStringDesc* LOC6;
		LOC3 = 0;
		LOC3 = nsthasKey(gsymbols_201004, symbol);
		if (!LOC3) goto LA4;
		LOC6 = 0;
		LOC6 = nstGet(gsymbols_201004, symbol);
		result = eqStrings(LOC6, ((NimStringDesc*) &TMP1384));
	}
	LA4: ;
	return result;
}

N_NIMCALL(NIM_BOOL, isdefined_201046)(tident200021* symbol) {
	NIM_BOOL result;
	result = 0;
	result = isdefined_201036((*symbol).S);
	return result;
}

N_NIMCALL(NI, countdefinedsymbols_201098)(void) {
	NI result;
	result = 0;
	result = 0;
	{
		NimStringDesc* key_201101;
		NimStringDesc* val_201102;
		key_201101 = 0;
		val_201102 = 0;
		{
			NI h_201119;
			NI HEX3Atmp_201121;
			NI res_201123;
			h_201119 = 0;
			HEX3Atmp_201121 = 0;
			HEX3Atmp_201121 = ((*gsymbols_201004).Data->Sup.len-1);
			res_201123 = 0;
			{
				while (1) {
					if (!(res_201123 <= HEX3Atmp_201121)) goto LA4;
					h_201119 = res_201123;
					{
						if (!!((*gsymbols_201004).Data->data[h_201119].Field0 == 0)) goto LA7;
						key_201101 = (*gsymbols_201004).Data->data[h_201119].Field0;
						val_201102 = (*gsymbols_201004).Data->data[h_201119].Field1;
						{
							if (!eqStrings(val_201102, ((NimStringDesc*) &TMP1384))) goto LA11;
							result += 1;
						}
						LA11: ;
					}
					LA7: ;
					res_201123 += 1;
				} LA4: ;
			}
		}
	}
	return result;
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

static N_INLINE(tcell44735*, usrtocell_48446)(void* usr) {
	tcell44735* result;
	result = 0;
	result = ((tcell44735*) ((NI)((NU64)(((NI) (usr))) - (NU64)(((NI)sizeof(tcell44735))))));
	return result;
}

static N_INLINE(void, rtladdzct_50004)(tcell44735* c) {
	addzct_48417(&gch_46844.Zct, c);
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

N_NIMCALL(void, definesymbol_201009)(NimStringDesc* symbol) {
	nstPut(gsymbols_201004, symbol, ((NimStringDesc*) &TMP1384));
}

N_NIMCALL(void, declaresymbol_201018)(NimStringDesc* symbol) {
	nstPut(gsymbols_201004, symbol, ((NimStringDesc*) &TMP1443));
}

static N_INLINE(void, appendString)(NimStringDesc* dest, NimStringDesc* src) {
	memcpy(((NCSTRING) (&(*dest).data[((*dest).Sup.len)- 0])), ((NCSTRING) ((*src).data)), (NI64)((*src).Sup.len + 1));
	(*dest).Sup.len += (*src).Sup.len;
}

N_NIMCALL(void, initdefines_201146)(void) {
	NimStringDesc* LOC25;
	NimStringDesc* LOC26;
	NimStringDesc* LOC27;
	asgnRef((void**) &gsymbols_201004, nstnewStringTable(((NU8) 2)));
	definesymbol_201009(((NimStringDesc*) &TMP1430));
	definesymbol_201009(((NimStringDesc*) &TMP1431));
	definesymbol_201009(((NimStringDesc*) &TMP1432));
	definesymbol_201009(((NimStringDesc*) &TMP1433));
	definesymbol_201009(((NimStringDesc*) &TMP1434));
	definesymbol_201009(((NimStringDesc*) &TMP1435));
	definesymbol_201009(((NimStringDesc*) &TMP1436));
	definesymbol_201009(((NimStringDesc*) &TMP1437));
	definesymbol_201009(((NimStringDesc*) &TMP1438));
	definesymbol_201009(((NimStringDesc*) &TMP1439));
	definesymbol_201009(((NimStringDesc*) &TMP1440));
	definesymbol_201009(((NimStringDesc*) &TMP1441));
	definesymbol_201009(((NimStringDesc*) &TMP1442));
	{
		NU8 c_201192;
		NU8 res_201428;
		c_201192 = 0;
		res_201428 = ((NU8) 1);
		{
			while (1) {
				NimStringDesc* LOC4;
				NimStringDesc* LOC5;
				NimStringDesc* LOC6;
				if (!(res_201428 <= ((NU8) 14))) goto LA3;
				c_201192 = res_201428;
				LOC4 = 0;
				LOC5 = 0;
				LOC5 = nimIntToStr(cpu_174480[(c_201192)- 1].Field4);
				LOC4 = rawNewString(LOC5->Sup.len + 3);
appendString(LOC4, ((NimStringDesc*) &TMP1444));
appendString(LOC4, LOC5);
				declaresymbol_201018(LOC4);
				LOC6 = 0;
				LOC6 = nsuNormalize(endiantostr_174474[(cpu_174480[(c_201192)- 1].Field2)- 0]);
				declaresymbol_201018(LOC6);
				declaresymbol_201018(cpu_174480[(c_201192)- 1].Field0);
				res_201428 += 1;
			} LA3: ;
		}
	}
	{
		NU8 o_201237;
		NU8 res_201433;
		o_201237 = 0;
		res_201433 = ((NU8) 1);
		{
			while (1) {
				if (!(res_201433 <= ((NU8) 23))) goto LA9;
				o_201237 = res_201433;
				declaresymbol_201018(os_174069[(o_201237)- 1].Field0);
				res_201433 += 1;
			} LA9: ;
		}
	}
	{
		NimStringDesc* a_201411;
		NI i_201438;
		NI l_201440;
		a_201411 = 0;
		i_201438 = 0;
		l_201440 = 101;
		{
			while (1) {
				if (!(i_201438 < l_201440)) goto LA12;
				a_201411 = additionalsymbols_201142->data[i_201438];
				declaresymbol_201018(a_201411);
				i_201438 += 1;
			} LA12: ;
		}
	}
	switch (targetcpu_174587) {
	case ((NU8) 1):
	{
		definesymbol_201009(((NimStringDesc*) &TMP1447));
	}
	break;
	case ((NU8) 8):
	{
		definesymbol_201009(((NimStringDesc*) &TMP1448));
	}
	break;
	case ((NU8) 9):
	{
		definesymbol_201009(((NimStringDesc*) &TMP1449));
	}
	break;
	default:
	{
	}
	break;
	}
	switch (targetos_174589) {
	case ((NU8) 1):
	{
		definesymbol_201009(((NimStringDesc*) &TMP1450));
	}
	break;
	case ((NU8) 2):
	{
		definesymbol_201009(((NimStringDesc*) &TMP1451));
		definesymbol_201009(((NimStringDesc*) &TMP1452));
	}
	break;
	case ((NU8) 4):
	case ((NU8) 5):
	case ((NU8) 6):
	case ((NU8) 8):
	case ((NU8) 13):
	case ((NU8) 14):
	case ((NU8) 16):
	case ((NU8) 12):
	case ((NU8) 20):
	{
		definesymbol_201009(((NimStringDesc*) &TMP1453));
		definesymbol_201009(((NimStringDesc*) &TMP1454));
	}
	break;
	case ((NU8) 7):
	{
		definesymbol_201009(((NimStringDesc*) &TMP1455));
		definesymbol_201009(((NimStringDesc*) &TMP1453));
		definesymbol_201009(((NimStringDesc*) &TMP1454));
	}
	break;
	case ((NU8) 9):
	case ((NU8) 10):
	case ((NU8) 11):
	{
		definesymbol_201009(((NimStringDesc*) &TMP1453));
		definesymbol_201009(((NimStringDesc*) &TMP1456));
		definesymbol_201009(((NimStringDesc*) &TMP1454));
	}
	break;
	case ((NU8) 18):
	{
		definesymbol_201009(((NimStringDesc*) &TMP1457));
	}
	break;
	case ((NU8) 19):
	{
		definesymbol_201009(((NimStringDesc*) &TMP1457));
		definesymbol_201009(((NimStringDesc*) &TMP1453));
		definesymbol_201009(((NimStringDesc*) &TMP1454));
	}
	break;
	default:
	{
	}
	break;
	}
	LOC25 = 0;
	LOC26 = 0;
	LOC26 = nimIntToStr(cpu_174480[(targetcpu_174587)- 1].Field4);
	LOC25 = rawNewString(LOC26->Sup.len + 3);
appendString(LOC25, ((NimStringDesc*) &TMP1444));
appendString(LOC25, LOC26);
	definesymbol_201009(LOC25);
	LOC27 = 0;
	LOC27 = nsuNormalize(endiantostr_174474[(cpu_174480[(targetcpu_174587)- 1].Field2)- 0]);
	definesymbol_201009(LOC27);
	definesymbol_201009(cpu_174480[(targetcpu_174587)- 1].Field0);
	definesymbol_201009(os_174069[(targetos_174589)- 1].Field0);
	declaresymbol_201018(((NimStringDesc*) &TMP1549));
	{
		if (!((os_174069[(targetos_174589)- 1].Field12 &(1<<((((NU8) 3))&7)))!=0)) goto LA30;
		definesymbol_201009(((NimStringDesc*) &TMP1549));
	}
	LA30: ;
	switch (targetos_174589) {
	case ((NU8) 7):
	case ((NU8) 9):
	case ((NU8) 10):
	case ((NU8) 11):
	case ((NU8) 19):
	{
		definesymbol_201009(((NimStringDesc*) &TMP1546));
	}
	break;
	default:
	{
	}
	break;
	}
}

N_NIMCALL(void, undefsymbol_201027)(NimStringDesc* symbol) {
	nstPut(gsymbols_201004, symbol, ((NimStringDesc*) &TMP1680));
}

N_NIMCALL(NIM_BOOL, isdeclared_201056)(tident200021* symbol) {
	NIM_BOOL result;
	result = 0;
	result = nsthasKey(gsymbols_201004, (*symbol).S);
	return result;
}
NIM_EXTERNC N_NOINLINE(void, HEX00_condsymsInit)(void) {
}

NIM_EXTERNC N_NOINLINE(void, HEX00_condsymsDatInit)(void) {
}
