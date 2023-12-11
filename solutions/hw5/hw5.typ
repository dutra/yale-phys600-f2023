#let title = "ASTR 600: Problem Set 5"
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
    #block(text(weight: 500, 0.8em, "December 1 2023"))
]

#set par(justify: true)
#let sun = sym.dot.circle
#let vbar = sym.bar.v
#let cdot = sym.dot.c
#let hbar = sym.planck.reduce
#let def = sym.eq.triple
#let hat(a) = math.accent(a, math.hat)
#let bar(a) = math.accent(a, math.macron)
#let dot(a) = math.accent(a, math.dot)
#let ddot(a) = math.accent(a, math.dot.double)

= I: Growth of Matter Perturbations
==
Given the growth of matter perturbation equation
$ ddot(delta)_m + 2 H dot(delta)_m = 4 pi G rho_m delta_m $

We start by showing that the left hand side can be written as
$ dif/(dif t) (a^2 dot(delta)_m) &= 2 a dot(a) dot(delta)_m + a^2 ddot(delta)_m \
&= 2 a^2 H dot(delta)_m + a^2 ddot(delta)_m \
&= a^2(2 H dot(delta)_m + ddot(delta)_m) $

Therefore, we can rewrite the first equation as

$ dif/(dif t) (a^2 dot(delta)_m) = a^2 4 pi G rho_m delta_m $

Moreover,
$ dif/(dif t) &= (dif a)/(dif t) dif/(dif a) \
&= a dot(a)/a dif/(dif a) \
&= a H dif/(dif a) $

Therefore,

$ dif/(dif t) (a^2 dot(delta)_m) &= a^2 4 pi G rho_m delta_m \
a H dif/(dif a) (a^3 H (dif delta)/(dif a)) &= a^2 4 pi G rho_m delta_m \
dif/(dif a) (a^3 H (dif delta)/(dif a)) &= a/H 4 pi G rho_m delta_m \
dif/(dif a) (a^3 H (dif delta)/(dif a)) &= 4 pi G rho_(m,0) delta_m/(a^2 H) $

==
Defining $y def a\/a_"eq"$, and using the fact that at equality $rho_(r, "eq") = rho_(m, "eq")$, we write the Hubble parameter

$ H^2 &= (8 pi G)/3 (rho_m a^(-3) + rho_r a^(-4)) \
&= (8 pi G)/3 rho_(m, "eq")(a^(-3)/a_"eq"^(-3) + a^(-4)/a_"eq"^(-4)) \
&= (8 pi G)/3 rho_(m, "eq") (y^(-3) + y^(-4)) \
&= (8 pi G)/3 rho_(m, "eq") 1/y^4 (1+y) $

Therefore,

$ H = sqrt((8 pi G)/3 rho_(m, "eq")) 1/y^2 sqrt(1+y) $


= II: Spherical Collapse

Starting with the parametric solution for a spherical overdensity of mass M and energy E:

$ r(theta) &= A(1-cos theta) \
t(theta) &= B(theta - sin theta) $

with $A = G M\/2|E|$ and $A^3 = G M B^2$,

we can check they are solutions to the equation

$ 1/2 dot(r) - (G M)/r = E $

Start by taking the time derivative by using the chain rule

$ dot(r) &= A sin theta dot(theta) \
dot(t) &= 1 = dot(theta) B (1 - cos theta) $

therefore, $dot theta = 1\/B(1-cos theta)$ and

$ dot(r)^2 &= (A/B)^2 ((sin theta)/(1 - cos theta))^2 \
&= 2|E| ((sin theta)/(1 - cos theta))^2 $

Substituting into the previous equation,

$ |E| ((sin theta)/(1 - cos theta))^2 - (G M)/(A(1-cos theta)) &eq.quest E \
1/(1-cos theta)^2 [ |E| sin^2 theta - (G M)/A (1 - cos theta) ] &eq.quest E \
        (|E|)/(1-cos theta)^2 [1-cos theta^2 - 2 (1 - cos theta) ] &eq.quest E \
        -(|E|)/(1-cos theta)^2 [1 - 2cos theta + cos theta^2] &eq.quest E \
        -(|E|)/(1-cos theta)^2 (1 - cos theta)^2 &eq.quest E \
-|E| = E $

Assuming $E < 0$, the solution is verified.

= III: Equality Scale
Using the fact that at equality, $Omega_R = a_"eq" Omega_M$, we have

$ k_"eq" &= a_"eq" H_"eq" \
&= a_"eq" H_0 sqrt(Omega_R a_"eq"^(-4) + Omega_M a_"eq"^(-3)) \
&= a_"eq" H_0 sqrt(2 Omega_M a_"eq"^(-3)) \
&= H_0 sqrt((2 Omega_M) / a_"eq") $


For a cosmology roughly the one we live in,
$Omega_R = 9 times 10^(-5)$, $Omega_M = 0.31$, $H_0 = 67.7 "km" s^(-1) "Mpc"^(-1)$, $a_"eq" = Omega_R\/Omega_M = 2.9 times 10^(-4)$, we find

$ k_"eq" &= 67.7 ("km"\/"s")/"Mpc" sqrt((2 cdot 0.31)/(2.9 times 10^(-4))) \
&approx 3130 ("km"\/"s")/"Mpc" \
&approx 3130/c "Mpc"^(-1) \
&approx 0.0104 "Mpc"^(-1) $


= IV: A Study in Simulations
== Orienting Yourself: The Linear Power Spectrum
From the linear power spectrum, we calculate $n_s = 0.962$. By looking at where $P_k$ reaches its maximum, we estimate $k_"eq" approx 0.17 "Mpc"^(-1)$.

We integrate the power spectrum to find

$ sigma_8 &= integral^oo_0 Delta^2(k) ((3j_1(k R))/(k R))^2 dif ln k
&approx 1.35 $

which is not close to the value 0.834.

#figure(
    image("linear_ps.png"),
    caption: ["Plot of Linear Power Spectrum."]
)

We estimate the Transfer Function by using the BBKS transfer function as shown in Hunterer:

$ T(q) def log(1+2.34q)/(2.34q) (1 + 3.89q + (16.1q)^2 + (5.46q)^3 + (6.71q)^4)^(-1\/4) $
where $q def Gamma^(-1) k$ and $Gamma def Omega_M e^(-Omega_b-1.3*Omega_b\/Omega_M)$.


#figure(
    image("linear_ps_transfer.png"),
    caption: ["Plot of Linear Power Spectrum with Transfer Function."]
)
