#!/usr/local/bin/tcsh
#################################################################
#								#
# Copyright (c) 2017 YottaDB LLC. and/or its subsidiaries.	#
# All rights reserved.						#
#								#
#	This source code contains the intellectual property	#
#	of its copyright holder(s), and is made available	#
#	under a license.  If you do not know the terms of	#
#	the license, please stop and do not read further.	#
#								#
#################################################################
# Note that this is based on cre_coll_sl_reverse.csh under $gtmtst/com
#create collation shared libraries for a "reverse" sequence ([1-255] -> [255-1])
# two arguments, $1-> sequence, 2-> c module
setenv cur_dir `pwd`
cp $gtm_tst/$tst/inref/"$2".c $cur_dir
$gt_cc_compiler $gtt_cc_shl_options -I$gtm_inc $cur_dir/"$2".c
$gt_ld_shl_linker ${gt_ld_option_output}$cur_dir/lib"$2"${gt_ld_shl_suffix} $gt_ld_shl_options $cur_dir/"$2".o -lc
set col_n = "gtm_collate_$1"
setenv $col_n "$cur_dir/lib"$2"${gt_ld_shl_suffix}"
setenv gtm_local_collate $1
