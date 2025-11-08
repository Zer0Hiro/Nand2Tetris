load AdderSub.hdl,
output-file AdderSub.out,
compare-to AdderSub.cmp,
output-list a%B3.1.3 b%B3.1.3 control%B3.1.3 cIn%B3.1.3 res%B3.1.3 cOut%B3.1.3;

set a 0,
set b 0,
set cIn 0,
set control 0,
eval,
output;

set cIn 1,
set control 0,
eval,
output;

set b 1,
set control 0,
set cIn 0,
eval,
output;

set cIn 1,
set control 0,
eval,
output;

set a 1,
set b 0,
set cIn 0,
set control 0,
eval,
output;

set cIn 1,
set control 0,
eval,
output;

set b 1,
set cIn 0,
set control 0,
eval,
output;

set cIn 1,
set control 0,
eval,
output;

set a 0,
set b 0,
set cIn 0,
set control 1,
eval,
output;

set cIn 1,
set control 1,
eval,
output;

set b 1,
set control 1,
set cIn 0,
eval,
output;

set cIn 1,
set control 1,
eval,
output;

set a 1,
set b 0,
set cIn 0,
set control 1,
eval,
output;

set cIn 1,
set control 1,
eval,
output;

set b 1,
set cIn 0,
set control 1,
eval,
output;

set cIn 1,
set control 1,
eval,
output;

