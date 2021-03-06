$gtm_tst/com/dbcreate.csh mumps . -key=255 -rec=500
$MUPIP set -file mumps.dat $tst_jnl_str >&! jnl_on.log
$grep "GTM-I-JNLSTATE" jnl_on.log |& sort -f
$GTM << XXX
set ^a="a"
set ^aa="aa"
set ^b="b"
h
XXX
$gtm_tst/com/dbcheck.csh

echo "MUPIP journal  -extract ^a"
$MUPIP journal  -extract  -forward  -global="^a" mumps.mjl
grep "\^a" mumps.mjf > /dev/null
if ($status) echo "ERROR select ^a failed from per2422"
grep "\^aa" mumps.mjf > /dev/null
if !($status) echo "ERROR incorrectly selected ^aa from per2422"
grep "\^b" mumps.mjf > /dev/null
if !($status) echo "ERROR incorrectly selected ^b from per2422"
mv mumps.mjf mumps.mjf_1

echo "MUPIP journal  -extract ^a,^b"
$MUPIP journal -extract -forward -global="^a,^b" mumps.mjl
grep "\^a" mumps.mjf > /dev/null
if ($status) echo "ERROR select ^a failed from per2422"
grep "\^aa" mumps.mjf > /dev/null
if !($status) echo "ERROR incorrectly selected ^aa from per2422"
grep "\^b" mumps.mjf > /dev/null
if ($status) echo "ERROR select ^b failed from per2422"
mv mumps.mjf mumps.mjf_2

echo "MUPIP journal  -extract ^a*"
$MUPIP journal -extract -forward -global="^a*" mumps.mjl
grep "\^a" mumps.mjf > /dev/null
if ($status) echo "ERROR select ^a failed from per2422"
grep "\^aa" mumps.mjf > /dev/null
if ($status) echo "ERROR select ^aa failed from per2422"
grep "\^b" mumps.mjf > /dev/null
if !($status) echo "ERROR incorrectly selected ^b from per2422"
mv mumps.mjf mumps.mjf_3

echo "MUPIP journal  -extract ~^a:"
$MUPIP journal -extract -forward -global="~^a" mumps.mjl
grep "\^a=" mumps.mjf > /dev/null
if !($status) echo "ERROR incorrectly selected ^a  from per2422"
grep "\^aa" mumps.mjf > /dev/null
if ($status) echo "ERROR select ^aa failed from per2422"
grep "\^b" mumps.mjf > /dev/null
if ($status) echo "ERROR select ^b failed from per2422"
