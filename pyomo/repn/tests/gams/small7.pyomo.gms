$offdigit

EQUATIONS
	c1
	c2
	c3
	c4
	c5
	c6
	c7
	c8
	c9
	c10
	c11
	c12
	c13
	c14
	c15
	c16
	c17
	c18
	c19
	c20
	c21
	c22
	c23
	c24
	c25;

VARIABLES
	GAMS_OBJECTIVE
	x1
	x2
	x3;

c1.. (1/(2.0))*0.5*x1*(x2 + (-1)*x3) =e= 2.0 ;
c2.. x1*(1/(2.0))*(1/(2.0))*(x2 + (-1)*x3) =e= 2.0 ;
c3.. x1*(x2 + (-1)*x3)*(1/(2.0))*0.5 =e= 2.0 ;
c4.. x1*(x2*(1/(2.0))*0.5 - x3*(1/(2.0))*0.5) =e= 2.0 ;
c5.. x1*(x2 + (-1)*x3)*(1/(2.0))*0.5 =e= 2.0 ;
c6.. x1*(x2 + (-1)*x3) + (-4.0)*(2.0) =e= 0.0 ;
c7.. (1/(2.0*(2.0)))*x1*(x2 + (-1)*x3) =e= 2.0 ;
c8.. x1*(1/((2.0)*(2.0)))*(x2 + (-1)*x3) =e= 2.0 ;
c9.. x1*(x2 + (-1)*x3)*(1/(2.0*(2.0))) =e= 2.0 ;
c10.. x1*(x2*(1/(2.0*(2.0))) - x3*(1/(2.0*(2.0)))) =e= 2.0 ;
c11.. x1*(x2 + (-1)*x3)*(1/(2.0*(2.0))) =e= 2.0 ;
c12.. x1*(x2 + (-1)*x3) + (-4.0)*(2.0) =e= 0.0 ;
c13.. (1/((2.0) + 2.0))*x1*(x2 + (-1)*x3) =e= 2.0 ;
c14.. x1*(1/((2.0) + (2.0)))*(x2 + (-1)*x3) =e= 2.0 ;
c15.. x1*(x2 + (-1)*x3)*(1/((2.0) + 2.0)) =e= 2.0 ;
c16.. x1*(x2*(1/((2.0) + 2.0)) - x3*(1/((2.0) + 2.0))) =e= 2.0 ;
c17.. x1*(x2 + (-1)*x3)*(1/((2.0) + 2.0)) =e= 2.0 ;
c18.. x1*(x2 + (-1)*x3) - 2.0*((2.0) + 2.0) =e= 0.0 ;
c19.. (1/power(((2.0) + 2.0), 2))*x1*(x2 + (-1)*x3) =e= 2.0 ;
c20.. x1*(1/power(((2.0) + (2.0)), 2))*(x2 + (-1)*x3) =e= 2.0 ;
c21.. x1*(x2 + (-1)*x3)*(1/power(((2.0) + 2.0), 2)) =e= 2.0 ;
c22.. x1*(x2*(1/power(((2.0) + 2.0), 2)) - x3*(1/power(((2.0) + 2.0), 2))) =e= 2.0 ;
c23.. x1*(x2 + (-1)*x3)*(1/power(((2.0) + 2.0), 2)) =e= 2.0 ;
c24.. x1*(x2 + (-1)*x3) - 2.0*power(((2.0) + 2.0), 2) =e= 0.0 ;
c25.. GAMS_OBJECTIVE =e= x2 ;

x1.lo = -1.0;
x1.up = 1.0;
x1.l = 3.0;
x2.lo = -1.0;
x2.up = 1.0;
x2.l = 1.0;
x3.lo = -1.0;
x3.up = 1.0;
x3.l = 2.0;

MODEL GAMS_MODEL /all/ ;
SOLVE GAMS_MODEL USING nlp minimizing GAMS_OBJECTIVE;

Scalars MODELSTAT 'model status', SOLVESTAT 'solve status';
MODELSTAT = GAMS_MODEL.modelstat;
SOLVESTAT = GAMS_MODEL.solvestat;

Scalar OBJEST 'best objective', OBJVAL 'objective value';
OBJEST = GAMS_MODEL.objest;
OBJVAL = GAMS_MODEL.objval;

Scalar NUMVAR 'number of variables';
NUMVAR = GAMS_MODEL.numvar

Scalar NUMEQU 'number of equations';
NUMEQU = GAMS_MODEL.numequ

Scalar NUMDVAR 'number of discrete variables';
NUMDVAR = GAMS_MODEL.numdvar

Scalar NUMNZ 'number of nonzeros';
NUMNZ = GAMS_MODEL.numnz

Scalar ETSOLVE 'time to execute solve statement';
ETSOLVE = GAMS_MODEL.etsolve

