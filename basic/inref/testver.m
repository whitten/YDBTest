;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;								;
; Copyright (c) 2017-2018 YottaDB LLC. and/or its subsidiaries.	;
; All rights reserved.						;
;								;
;	This source code contains the intellectual property	;
;	of its copyright holder(s), and is made available	;
;	under a license.  If you do not know the terms of	;
;	the license, please stop and do not read further.	;
;								;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
testver	;
	;
	; Construct version from $ZVERSION & $ZYRELEASE
	;
	set gtmverno=$ztrnlnm("gtm_verno")
	if gtmverno'["V9" do
	.	set zv=$translate($piece($zversion," ",2),".-")
	.	set zyre=$translate($piece($zyrelease," ",2),".-")
	.	set testver=$zconvert(zv_"_"_zyre,"U")
	else  set testver=gtmverno
	if testver=gtmverno write "Passed the version test",!
	else                write "Should be ",gtmverno," but is ",testver,!
	quit
