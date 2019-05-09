-- scripts from Cynthia Vinzant's talk at Nonlinear Algebra Bootcamp (Sep 5-12, 2018)
-- https://brown.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=41e68e4a-2442-47db-b7ad-a94d012a2361
-- run in terminal: < M2 --script NLA_exmaples.m2
-- everything is printed through stdio, no need for emacs settings
-- But on Mac, try M2 with emacs, e.g. Aquamacs on MAC

restart
R = QQ[x,y,z];
A = matrix{{1,x,y}, {x,1,z}, {y,z,1}};
<< "Spectrahedra defining matrix at hand" << A << endl;

min2 = minors(2,A);
<< "dim minor 2: " << dim min2 << endl;
<< "deg minor 2: " << degree min2 << endl;
<< "minimal primes min 2: " << minimalPrimes min2 << endl;

f = det(A);
<< "det(A): " << f << endl;

-- calculating the dual of the spectrahedra S (a convex body)
-- the algebraic boundary of the S* (dual set of S)
-- Zariski closure of the boundary
S = QQ[x,y,z,a,b,c];
f = sub(f, S)

-- what linear function gives the normal of the tangent hyperplanes of ∂S (boundary of S)?
-- This will give us a surface on (a,b,c)
-- require the gradient linear function align the gradient of det(f), where f == 0 defines ∂S
-- Put them in a matrix, and we require that matrix to be rank 1
-- or equivalently, the 2x2 minors have det 0
sing = ideal(f, diff(x,f), diff(y,f), diff(z,f));

I = minors(2, matrix{{a,b,c}, {diff(x,f), diff(y,z), diff(z,f)}});
I = I + ideal(a*x + b*y + c*z + 1, f);
<< "rank1 matrix defining I: " << I << endl;

-- avoid singular points
I = saturate(I, sing);
<< "I saturate sing: " << I << endl;

J = eliminate(I,{x,y,z})
<< "after elimination: " << J << endl;
-- should give us: ideal(a^2 b^2 + a^2 c^2 + b^2 c^2 - 2*a*b*c)
