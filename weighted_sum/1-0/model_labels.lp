\* Source Pyomo model name=C2 *\

min 
oWeighted_Sum:
+3.858917959404183e-07 vTotal_Cost

s.t.

c_e_eWorkforce_A(0)_:
+1 vXh(0_0)
+1 vP(1_0)
-1 vD(0_0)
-1 vW(0_0)
= -1150

c_e_eWorkforce_A(1)_:
+1 vXh(0_1)
+1 vP(1_1)
-1 vD(0_1)
+0.95 vW(0_0)
-1 vW(0_1)
= 0

c_e_eWorkforce_A(2)_:
+1 vXh(0_2)
+1 vP(1_2)
-1 vD(0_2)
+0.95 vW(0_1)
-1 vW(0_2)
= 0

c_e_eWorkforce_B(0)_:
+1 vXh(1_0)
-1 vP(1_0)
+1 vP(2_0)
+0.5 vD(0_0)
-1 vD(1_0)
-1 vW(1_0)
= -1700

c_e_eWorkforce_B(1)_:
+1 vXh(1_1)
-1 vP(1_1)
+1 vP(2_1)
+0.5 vD(0_1)
-1 vD(1_1)
+0.95 vW(1_0)
-1 vW(1_1)
= 0

c_e_eWorkforce_B(2)_:
+1 vXh(1_2)
-1 vP(1_2)
+1 vP(2_2)
+0.5 vD(0_2)
-1 vD(1_2)
+0.95 vW(1_1)
-1 vW(1_2)
= 0

c_e_eWorkforce_C(0)_:
+1 vXh(2_0)
-1 vP(2_0)
+0.5 vD(1_0)
-1 vW(2_0)
= -2400

c_e_eWorkforce_C(1)_:
+1 vXh(2_1)
-1 vP(2_1)
+0.5 vD(1_1)
+0.9 vW(2_0)
-1 vW(2_1)
= 0

c_e_eWorkforce_C(2)_:
+1 vXh(2_2)
-1 vP(2_2)
+0.5 vD(1_2)
+0.9 vW(2_1)
-1 vW(2_2)
= 0

c_e_eRequirement(0_0)_:
+1 vW(0_0)
-1 vI(0_0)
+1 vO(0_0)
+0.5 vT(0_0)
= 1250

c_e_eRequirement(0_1)_:
+1 vW(0_1)
-1 vI(0_1)
+1 vO(0_1)
+0.5 vT(0_1)
= 1800

c_e_eRequirement(0_2)_:
+1 vW(0_2)
-1 vI(0_2)
+1 vO(0_2)
+0.5 vT(0_2)
= 2500

c_e_eRequirement(1_0)_:
+1 vW(1_0)
-1 vI(1_0)
+1 vO(1_0)
+0.5 vT(1_0)
= 1600

c_e_eRequirement(1_1)_:
+1 vW(1_1)
-1 vI(1_1)
+1 vO(1_1)
+0.5 vT(1_1)
= 2250

c_e_eRequirement(1_2)_:
+1 vW(1_2)
-1 vI(1_2)
+1 vO(1_2)
+0.5 vT(1_2)
= 3000

c_e_eRequirement(2_0)_:
+1 vW(2_0)
-1 vI(2_0)
+1 vO(2_0)
+0.5 vT(2_0)
= 1200

c_e_eRequirement(2_1)_:
+1 vW(2_1)
-1 vI(2_1)
+1 vO(2_1)
+0.5 vT(2_1)
= 750

c_e_eRequirement(2_2)_:
+1 vW(2_2)
-1 vI(2_2)
+1 vO(2_2)
+0.5 vT(2_2)
= 0

c_u_eHiring(0_0)_:
+1 vXh(0_0)
<= 600

c_u_eHiring(0_1)_:
+1 vXh(0_1)
<= 600

c_u_eHiring(0_2)_:
+1 vXh(0_2)
<= 600

c_u_eHiring(1_0)_:
+1 vXh(1_0)
<= 900

c_u_eHiring(1_1)_:
+1 vXh(1_1)
<= 900

c_u_eHiring(1_2)_:
+1 vXh(1_2)
<= 900

c_u_eHiring(2_0)_:
+1 vXh(2_0)
<= 500

c_u_eHiring(2_1)_:
+1 vXh(2_1)
<= 500

c_u_eHiring(2_2)_:
+1 vXh(2_2)
<= 500

c_u_eCtoB(0)_:
+1 vP(2_0)
<= 300

c_u_eCtoB(1)_:
+1 vP(2_1)
<= 300

c_u_eCtoB(2)_:
+1 vP(2_2)
<= 300

c_u_eBtoA(0)_:
+1 vP(1_0)
<= 340.0

c_u_eBtoA(1)_:
+1 vP(1_1)
-0.2 vW(1_0)
<= 0

c_u_eBtoA(2)_:
+1 vP(1_2)
-0.2 vW(1_1)
<= 0

c_u_eOutsource(0)_:
+1 vO(0_0)
+1 vO(1_0)
+1 vO(2_0)
<= 175

c_u_eOutsource(1)_:
+1 vO(0_1)
+1 vO(1_1)
+1 vO(2_1)
<= 175

c_u_eOutsource(2)_:
+1 vO(0_2)
+1 vO(1_2)
+1 vO(2_2)
<= 175

c_u_ePartTime(0)_:
+1 vT(0_0)
+1 vT(1_0)
+1 vT(2_0)
<= 80

c_u_ePartTime(1)_:
+1 vT(0_1)
+1 vT(1_1)
+1 vT(2_1)
<= 80

c_u_ePartTime(2)_:
+1 vT(0_2)
+1 vT(1_2)
+1 vT(2_2)
<= 80

c_e_eTotal_Cost_:
+1 vTotal_Cost
-650 vXh(0_0)
-650 vXh(0_1)
-650 vXh(0_2)
-550 vXh(1_0)
-550 vXh(1_1)
-550 vXh(1_2)
-450 vXh(2_0)
-450 vXh(2_1)
-450 vXh(2_2)
-300 vP(1_0)
-300 vP(1_1)
-300 vP(1_2)
-400 vP(2_0)
-400 vP(2_1)
-400 vP(2_2)
-500 vI(0_0)
-500 vI(0_1)
-500 vI(0_2)
-500 vI(1_0)
-500 vI(1_1)
-500 vI(1_2)
-200 vI(2_0)
-200 vI(2_1)
-200 vI(2_2)
-1200 vO(0_0)
-1200 vO(0_1)
-1200 vO(0_2)
-1100 vO(1_0)
-1100 vO(1_1)
-1100 vO(1_2)
-1000 vO(2_0)
-1000 vO(2_1)
-1000 vO(2_2)
-550 vT(0_0)
-550 vT(0_1)
-550 vT(0_2)
-400 vT(1_0)
-400 vT(1_1)
-400 vT(1_2)
-350 vT(2_0)
-350 vT(2_1)
-350 vT(2_2)
= 0

c_e_eIdle_:
-1 vI(0_0)
-1 vI(0_1)
-1 vI(0_2)
-1 vI(1_0)
-1 vI(1_1)
-1 vI(1_2)
-1 vI(2_0)
-1 vI(2_1)
-1 vI(2_2)
+1 vIdle
= 0

bounds
   0.0 <= vTotal_Cost <= +inf
   0.0 <= vXh(0_0) <= +inf
   0.0 <= vXh(0_1) <= +inf
   0.0 <= vXh(0_2) <= +inf
   0.0 <= vXh(1_0) <= +inf
   0.0 <= vXh(1_1) <= +inf
   0.0 <= vXh(1_2) <= +inf
   0.0 <= vXh(2_0) <= +inf
   0.0 <= vXh(2_1) <= +inf
   0.0 <= vXh(2_2) <= +inf
   0.0 <= vP(1_0) <= +inf
   0.0 <= vP(1_1) <= +inf
   0.0 <= vP(1_2) <= +inf
   0.0 <= vP(2_0) <= +inf
   0.0 <= vP(2_1) <= +inf
   0.0 <= vP(2_2) <= +inf
   0.0 <= vD(0_0) <= +inf
   0.0 <= vD(0_1) <= +inf
   0.0 <= vD(0_2) <= +inf
   0.0 <= vD(1_0) <= +inf
   0.0 <= vD(1_1) <= +inf
   0.0 <= vD(1_2) <= +inf
   0.0 <= vW(0_0) <= +inf
   0.0 <= vW(0_1) <= +inf
   0.0 <= vW(0_2) <= +inf
   0.0 <= vW(1_0) <= +inf
   0.0 <= vW(1_1) <= +inf
   0.0 <= vW(1_2) <= +inf
   0.0 <= vW(2_0) <= +inf
   0.0 <= vW(2_1) <= +inf
   0.0 <= vW(2_2) <= +inf
   0.0 <= vI(0_0) <= +inf
   0.0 <= vI(0_1) <= +inf
   0.0 <= vI(0_2) <= +inf
   0.0 <= vI(1_0) <= +inf
   0.0 <= vI(1_1) <= +inf
   0.0 <= vI(1_2) <= +inf
   0.0 <= vI(2_0) <= +inf
   0.0 <= vI(2_1) <= +inf
   0.0 <= vI(2_2) <= +inf
   0.0 <= vO(0_0) <= +inf
   0.0 <= vO(0_1) <= +inf
   0.0 <= vO(0_2) <= +inf
   0.0 <= vO(1_0) <= +inf
   0.0 <= vO(1_1) <= +inf
   0.0 <= vO(1_2) <= +inf
   0.0 <= vO(2_0) <= +inf
   0.0 <= vO(2_1) <= +inf
   0.0 <= vO(2_2) <= +inf
   0.0 <= vT(0_0) <= +inf
   0.0 <= vT(0_1) <= +inf
   0.0 <= vT(0_2) <= +inf
   0.0 <= vT(1_0) <= +inf
   0.0 <= vT(1_1) <= +inf
   0.0 <= vT(1_2) <= +inf
   0.0 <= vT(2_0) <= +inf
   0.0 <= vT(2_1) <= +inf
   0.0 <= vT(2_2) <= +inf
   0.0 <= vIdle <= +inf
end
