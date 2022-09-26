function [out]=RR_ln_7(x)
% function [out]=RR_ln_7(x)
% INPUT:  any x>0
% OUTPUT: ln(x), with about 7 digits of precision (or better)
% TEST:   x=(randn)^2, a=log(x), b=RR_ln_7(x), residual=norm(a-b)
% Renaissance Robotics codebase, Chapter 2, https://github.com/tbewley/RR
% Copyright 2022 by Thomas Bewley, distributed under BSD 3-Clause License.

ln2=0.693147180559945;
x_b=RR_float_to_bin(x); n=bin2dec(x_b(2:12))-1023; r=x/2^n;
y=(r-1)/(r+1); y2=y*y;
sum=0; ypower=1/y; for i=1:2:11; ypower=ypower*y2; sum=sum+ypower/i; end
out=n*ln2+2*sum;