#let title = "ASTR 600: Problem Set 2"
#set document(author: "Isaque Dutra",
              title: title)
#set page(paper: "us-letter", numbering: "1", number-align: end)
#set text(font: "New Computer Modern", lang: "en", 1em)

#show math.equation: set text(weight: 400)
// #set heading(numbering: "1.")
// #set math.equation(numbering: "(1)")

// Title row.
#align(center)[
    #block(text(weight: 700, 1.75em, title))
    #v(1em, weak: true)
    #block(text(weight: 500, 1.3em, "Isaque Dutra"))
    #block(text(weight: 500, 0.8em, "October 1 2023"))
]

#set par(justify: true)
#let sun = sym.dot.circle
#let vbar = sym.bar.v
#let cdot = sym.dot.c
#let hat(a) = math.accent(a, math.hat)
#let bar(a) = math.accent(a, math.macron)
#let dot(a) = math.accent(a, math.dot)
#let ddot(a) = math.accent(a, math.dot.double)

= Problem 1: Friedmann Equation II
\ Friedmann Equation I
$ (dot(a)/a)^2 = (8 pi G)/3 rho - k^2/a^2 + Lambda/3 $
\ Continuity Equation
$ dot(rho) + 3H(rho+P) = 0 $

Differentiating FEI with respect to time and replacing $dot(rho)/H$ from the CE,

$ dot(a)^2 &= (8 pi G)/3 rho a^2 - k^2 + Lambda/3 a^2 \
2 dot(a) ddot(a) &= (8 pi G)/3 (dot(rho) a^2 + 2 rho a dot(a)) + (2 Lambda)/3 a dot(a) \
dot(a)/a ddot(a)/a &= (4 pi G)/3 (dot(rho) + 2 rho dot(a)/a) + Lambda/3 dot(a)/a \
ddot(a)/a &= (4 pi G)/3 (dot(rho)/H + 2 rho) + Lambda/3 \
&= (4 pi G)/3 (-3 (rho + P) + 2P) + Lambda/3 \
&= -(4 pi G)/3 (rho + 3P) + Lambda/3 $

Thus, we recover Friedmann Equation II
$ ddot(a)/a &= -(4 pi G)/3 (rho + 3P) + Lambda/3 $

= Problem 2: Cosmological Dimming
Surface brightness of an object as seen by an observer is defined as the total flux received by the observed divided by the angular area of the object as seen by the observer.

Since the total flux is proportional to $1\/D_L^2$ while the angular area is proportional to $D_A^2$, and
$D_A = D_L / (1+z)^2$, we find that

$ I &prop D_A^2/D_L^2 \
I &prop 1/(1+z)^4 $

$ I_0 &= I_e (1+z)^(-4) $


= Problem 3: Magnitudes and K-corrections
== Show that $m = M + "DM"(z)$
Define the apparent magnitude of an observed flux $f$ as
$ m = -2.5 log_(10)(f/f_0) $
where the observed flux of object with luminosity $L$ at flux distance $D_l$ is defined as $f = L/(4 pi D_l^2)$.
Thus

$ m &= -2.5 log (L/(4 pi D_L^2) 1/f_0) \
&= -2.5 log (L/(4 pi 10 "pc") (10 "pc")/D_L^2 1/f_0) \
&= -2.5 [log (L/(4 pi 10 "pc")1/f_0) + log((10 "pc")/D_L^2)] \
&= -2.5 [log (L/(4 pi 10 "pc")1/f_0) - 2log(D_L/(10 "pc"))] \
&= -2.5 log (L/(4 pi 10 "pc")1/f_0) + 5log(D_L/(10 "pc")) \
&= M + "DM"(z) $

== K modification
Object originally emitted luminosity $L_(nu(1+z))$ at frequency $nu(1+z)$, different than we observe today ($L_nu$) due to expansion of universe.

The differential flux density $S_nu$ observed today at frequency $nu$ is given by the differential luminosity when emitted at frequency $nu(1+z)$ divided by the proper surface area of a sphere $4 pi D_L^2$.

The photos observed today at frequency $nu$ were emitted at frequency $nu (1+z)$, and since energy of a photon $E_gamma prop nu$, the energy flux per unit bandwidth is rescaled by $(1+z)$.

Therefore, the differential flux $S_nu$ is

$ S_nu &= (1+z) L_(nu(1+z))/(4pi D_L^2) \
 &= (1+z) L_(nu(1+z))/L_nu L_nu/(4pi D_L^2) $

And the observed apparent magnitude formula gets modified to

$ m &= -2.5 log[(1+z) L_(nu(1+z))/L_nu L_nu/(4 pi D_L^2) 1/f_0] \
&= -2.5 log[(1+z) L_(nu(1+z))/L_nu L_nu/(4 pi 10"pc") 1/f_0 (10 "pc")/D_L^2] \
&= -2.5 log(L_nu/(4pi 10"pc") 1/f_0) + 5 log(D_L/(10 "pc")) - 2.5 log((1+z)L_(nu(1+z))/L_nu) \
&= M + "DM" + K $

= Problem 4: A Static Universe
== Second Friedmann equation for this model
$ (dot(a)/a)^2 = (8 pi G)/3 rho + Lambda/3 - k/a^2 $
$ ddot(a)/a = -(4pi G)/3 (rho + 3P) + Lambda/3 $

Let $rho arrow.r rho' = rho + Lambda/(8 pi G)$, then the first Friedmann Equation becomes

$ (dot(a)/a)^2 &= (8 pi G)/3 rho + Lambda/3 - k/a^2 \
    &= (8 pi G)/3 (rho + Lambda/(8 pi G)) - k/a^2 \
    &= (8 pi G)/3 rho' - k/a^2 $

and the second Friedmann Equation

$ ddot(a)/a &= -(4pi G)/3 (rho + 3P) + Lambda/3 \
&= -(4 pi G)/3 (rho' - Lambda/(8 pi G) + 3P) + Lambda/3 \
&= -(4 pi G)/3 (rho' - Lambda/(8 pi G) - Lambda/(4 pi G) + 3P) \
&= -(4 pi G)/3 (rho' - 3Lambda/(8 pi G)+ 3P) \
&= -(4 pi G)/3 (rho' + 3P') $
where we defined $P arrow.r P' = P - Lambda/(8 pi G)$

== Value of $Lambda$ and $k$ such as $dot(a)=0$ and $ddot(a)=0$.

Let $ddot(a)=0$ in second Friedmann Equation,
$ rho' + 3P' &= 0 \
rho + Lambda/(8 pi G) - (3 Lambda)/(8 pi G) &= 0 \
rho - Lambda/(4 pi G) &= 0 $

Thus,
$ ddot(a)=0 arrow.r rho = Lambda/(4 pi G) $

Let $dot(a)=0$ in first Friedmann Equation,
$ (8 pi G)/3 rho + Lambda/3 - k^2/a^2 &= 0 \
  (2 Lambda)/3 + Lambda/3 - k^2/a^2 &= 0 \
Lambda - k^2/a^2 &= 0 $

Thus,
$ dot(a)=0 arrow.r k = sqrt(a^2 Lambda) $
implying an open (positive curvature) universe.

== Pertubations
Imagine pertubing the scale factor by
$ a(t) = 1 + delta a(t) $
and
$ rho_m(t) = rho_m[1 - 3 delta a(t)] $

Substituting this into the second Friedmann equation,
$ ddot(a)/a &= -(4 pi G)/3 (rho_m + 3P) + Lambda/3 \
ddot(delta a) / (1 + delta a) &= -(4pi G)/3 (rho_m [1-3delta a]) + Lambda/3 $

Substituting $rho_m = Lambda/(4 pi G)$ found previously,
$ ddot(delta a) / (1 + delta a) &= -(4pi G)/3 Lambda/(4 pi G) [1-3delta a] + Lambda/3 \
&= - Lambda/3 [1 - 3 delta a] + Lambda/3 \
&= Lambda delta a $

Thus,
$ ddot(delta a) = Lambda delta a (1 + delta a) $

Dropping second order terms,
$ ddot(delta a) - Lambda delta a = 0 $

Assuming a positive cosmological constant, the solutions are

$ delta a prop e^(- sqrt(Lambda) t) + e^(+ sqrt(Lambda) t) $

Assuming initial conditions $delta a(0) = delta a_0$ and $dot(delta a)(0) = 0$, we find
$ delta a(t) = (delta a_0)/2 (e^(-sqrt(Lambda) t) + e^(+sqrt(Lambda) t)) $

This solution is clearly unstable since the positive exponential term goes to infinity as $t arrow.r oo$.

== Problem 5: Redshift Drift

$ 1 + z = (a(t_0))/(a(t_1)) $

$ (dif z)/(dif t_0) &= 1/(a(t_1)) (dif a(t_0))/(dif t_0) (dif t_0)/(dif t_0) - (a(t_0))/(a(t_1)^2) (dif a(t_1))/(dif t_1) (dif t_1)/(dif t_0) \
 &= 1/(a(t_1)) (dif a(t_0))/(dif t_0) - (a(t_0))/(a(t_1)^2) (dif a(t_1))/(dif t_1) (dif t_1)/(dif t_0) $

What is $(dif t_1)/(dif t_0)$ ?
For light, $dif t = a(t) d chi$, and for light emitted at $t_1$ and observed today at $t_0$, the coordinate distance $dif chi$ between two peaks remains unchanged. Therefore, $dif chi_1 = dif chi_0$, and

$ (dif t_1)/(a(t_1)) &= (dif t_0)/(a(t_0)) \
  (dif t_1)/(dif t_0) &= (a(t_1))/(a(t_0)) $

Thus,
$ (dif z)/(dif t_0) &= 1/(a(t_1)) (dif a(t_0))/(dif t_0) - (a(t_0))/(a(t_1)^2) (dif a(t_1))/(dif t_1) (a(t_1))/(a(t_0)) \
&= (1+z) H_0 - H(t_1) $

where we used the fact that $1/(a(t_1)) = 1+z$, $a(t_0) = 1$ and
$ H(t) &= (dot(a)(t))/(a(t)) \
H_0 &= lr((dif a(t))/(dif t) 1/(a(t)) |, size: #100%)_(t_0) \
H_0 &= (dif a(t_0))/(dif t_0) \
H_1 &= 1/(a(t)) lr((dif a(t))/(dif t) |, size: #100%)_(t_1) $

== Estimating drift for object at $z=1$
For a matter dominated flat Universe,
$ H(z) = H_0 (1+z)^(3/2) $
and assuming $H_0 = 100 "h km/s/Mpc"$ and $1 "km" = 3.25 times 10^(-20) "Mpc"$

$ Delta z &= H_0 [(1+z) - (1+z)^(3/2)] Delta t \
&= 100 h "km"/"Mpc" [(1+z) - (1+z)^(3/2)] (Delta t)/("s") \
&= 100 h cdot 3.25 times 10^(-20) [(1+z) - (1+z)^(3/2)] cdot (Delta t)/(3.17 times 10^(-8) "year") \
&approx 10^(-10) h [(1+z) - (1+z)^(3/2)] ((Delta t)/(1 "year")) $

For an object at $z=1$,
$ Delta z approx 10^(-10) h ((Delta t)/(1 "year")) $
