/* Generated by Nim Compiler v0.10.0 */
/*   (c) 2014 Andreas Rumpf */
/* The generated code is subject to the original license. */
#define NIM_INTBITS 32
#include "nimbase.h"

#include <string.h>
typedef struct NimStringDesc NimStringDesc;
typedef struct TGenericSeq TGenericSeq;
struct  TGenericSeq  {
NI len;
NI reserved;
};
struct  NimStringDesc  {
  TGenericSeq Sup;
NIM_CHAR data[SEQ_DECL_SIZE];
};
N_NIMCALL(NimStringDesc*, rawNewString)(NI space);
N_NIMCALL(NimStringDesc*, rawNewString)(NI cap);
N_NIMCALL(void, addescaped_387866)(NimStringDesc** result, NimStringDesc* s);
static N_INLINE(void, appendString)(NimStringDesc* dest, NimStringDesc* src);
N_NIMCALL(NimStringDesc*, resizeString)(NimStringDesc* dest, NI addlen);
N_NIMCALL(NimStringDesc*, addChar)(NimStringDesc* s, NIM_CHAR c);
STRING_LITERAL(TMP4622, "&lt;", 4);
STRING_LITERAL(TMP4623, "&gt;", 4);
STRING_LITERAL(TMP4624, "&amp;", 5);
STRING_LITERAL(TMP4625, "&quot;", 6);
STRING_LITERAL(TMP4626, "&#x27;", 6);
STRING_LITERAL(TMP4627, "&#x2F;", 6);

static N_INLINE(void, appendString)(NimStringDesc* dest, NimStringDesc* src) {
	memcpy(((NCSTRING) (&(*dest).data[((*dest).Sup.len)- 0])), ((NCSTRING) ((*src).data)), (NI32)((*src).Sup.len + 1));
	(*dest).Sup.len += (*src).Sup.len;
}

N_NIMCALL(void, addescaped_387866)(NimStringDesc** result, NimStringDesc* s) {
	{
		NIM_CHAR c_387871;
		NI i_387875;
		NI l_387877;
		c_387871 = 0;
		i_387875 = 0;
		l_387877 = s->Sup.len;
		{
			while (1) {
				if (!(i_387875 < l_387877)) goto LA3;
				c_387871 = s->data[i_387875];
				switch (((NU8)(c_387871))) {
				case 60:
				{
					(*result) = resizeString((*result), 4);
appendString((*result), ((NimStringDesc*) &TMP4622));
				}
				break;
				case 62:
				{
					(*result) = resizeString((*result), 4);
appendString((*result), ((NimStringDesc*) &TMP4623));
				}
				break;
				case 38:
				{
					(*result) = resizeString((*result), 5);
appendString((*result), ((NimStringDesc*) &TMP4624));
				}
				break;
				case 34:
				{
					(*result) = resizeString((*result), 6);
appendString((*result), ((NimStringDesc*) &TMP4625));
				}
				break;
				case 39:
				{
					(*result) = resizeString((*result), 6);
appendString((*result), ((NimStringDesc*) &TMP4626));
				}
				break;
				case 47:
				{
					(*result) = resizeString((*result), 6);
appendString((*result), ((NimStringDesc*) &TMP4627));
				}
				break;
				default:
				{
					(*result) = addChar((*result), c_387871);
				}
				break;
				}
				i_387875 += 1;
			} LA3: ;
		}
	}
}

N_NIMCALL(NimStringDesc*, escape_387893)(NimStringDesc* s) {
	NimStringDesc* result;
	result = 0;
	result = rawNewString(s->Sup.len);
	addescaped_387866(&result, s);
	return result;
}
NIM_EXTERNC N_NOINLINE(void, stdlib_xmltreeInit)(void) {
}

NIM_EXTERNC N_NOINLINE(void, stdlib_xmltreeDatInit)(void) {
}
