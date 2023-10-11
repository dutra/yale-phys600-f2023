#let title = "ASTR 600: Problem Set 3"
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
#let hbar = sym.planck.reduce
#let hat(a) = math.accent(a, math.hat)
#let bar(a) = math.accent(a, math.macron)
#let dot(a) = math.accent(a, math.dot)
#let ddot(a) = math.accent(a, math.dot.double)

= Problem 1: Reviewing the Background
Assume cosmology with $Omega_(m,0) = 0.3$, $Omega_Lambda = 0.7$, and $h = 0.7$.

== Density Parameters
At $z = 0.5$,

Starting from the scaling relation $rho_m = rho_(m,0) a^(-3)$ and $rho_m = rho_"crit" Omega$, we find
$ Omega_m = Omega_(m,0) rho_"crit,0" / rho_"crit" (1+z)^3 $

where $rho_"crit,0" \/ rho_"crit"$ can be found from $rho_"crit" = 3H^2\/8pi G$

$ rho_"crit,0" / rho_"crit" = H_0^2/H^2 $

Therefore,
$ Omega_m &= Omega_(m,0) rho_"crit,0" / rho_"crit" (1+z)^3 \
&= 0.3 cdot 0.584 cdot (1+0.5)^3 \
&= 0.591 $


Similarly,

$ Omega_Lambda &= Omega_(Lambda,0) rho_"crit,0" / rho_"crit" (1+z)^3 \
&= 0.7 cdot 0.584 cdot (1+0.5)^3 \
&= 0.409 \
&= 1 - Omega_m $


== Luminosity and Angular Diameter distances

As can be seen in the following plot, the angular diameter distance increases until a small redshift, then decreases again. It has a maximum at $z = 1.605$ ($z = 1.250$) for a universe with $Omega_m = 0.3$ ($Omega_m = 1.0$).

#figure(
    image("p1.png"),
    caption: ["Plot of proper, luminosity and angular diameter distance for $Omega_m=0.3$ (solid lines) and $Omega_m=1.0$ (dashed lines) universe"]
)

```julia
using Integrals
using Plots
using LaTeXStrings
import PhysicalConstants.CODATA2018 as c
using Unitful, UnitfulAstro

E(z, Ω_m) = sqrt(Ω_m*(1+z)^3 + (1-Ω_m))

integral(z; Ω_m) = solve(IntegralProblem((z,p) -> 1/E(z, Ω_m), 0.0, z, Ω_m), QuadGKJL()).u

# define proper distance
r(z; Ω_m) = integral(z; Ω_m=Ω_m)

# define luminosity distance
dL(z; Ω_m) = r(z; Ω_m) * (1+z)

# define angular distance
dA(z; Ω_m) = r(z; Ω_m) / (1+z)

# plot distances for redshifts between 0 and 10
z = 0:0.001:10.0

plot(legendfontsize=12, dpi=150, size=(800,600),
      xlabel="z", ylabel=L"H_0 \; \times \; \mathrm{distance}",
      ylim=(0,2))
plot!(z, r.(z; Ω_m=0.3), linewidth=3, label="r (Ω_m=0.3)")
plot!(z, dL.(z; Ω_m=0.3), linewidth=3, label="dL (Ω_m=0.3)")
plot!(z, dA.(z; Ω_m=0.3), linewidth=3, label="dA (Ω_m=0.3)")
plot!(z, integral.(z; Ω_m=1.0), linewidth=3, line=:dash, label="r (Ω_m=1.0)")
plot!(z, dL.(z; Ω_m=1.0), linewidth=3, line=:dash, label="dL (Ω_m=1.0)")
plot!(z, dA.(z; Ω_m=1.0), linewidth=3, line=:dash, label="dA (Ω_m=1.0)")
```

== Looking back
The redshift $z = 1.856$ corresponds to 10 billion years ago.

```julia
H0 = 100 * 0.7u"km/s / Mpc" |> u"yr^(-1)"
Ω_M = 0.3
Ω_Λ = 0.7
E(z) = (1.0+z) * sqrt(Ω_M*(1.0+z)^3 + Ω_Λ)

integral(x) = solve(IntegralProblem((z,p) -> 1.0/H0.val * 1.0/E(z), 0.0, x), QuadGKJL()).u

x = 0.0:0.001:5.0
i = abs.(abs.(integral.(x)) .- 10e9)
x[argmin(i)]
```

== A $Lambda$-dominated Universe
We can find $a(t)$ and the age of a universe with only a cosmological constant by starting with the Friedmann equation $H^2 = H_0^2 Omega_Lambda$, then

$ dot(a)/a &= H_0 sqrt(Omega_Lambda) \
(dif a)/(dif t) &= a H_0 sqrt(Omega_Lambda) \
a(t) &= a_0 e^(H_0 sqrt(Omega_Lambda) t) $

The age of such universe can be found by

$ dif t &= 1/(H_0 sqrt(Omega_Lambda)) integral_0^1 (dif a)/a \
t_0 &= 1/(H_0 sqrt(Omega_Lambda)) lr(ln(a)|_0^1, size: #100%) \
&= oo $

A universe with only a cosmological constant is infinitely old.





= Problem 2: Massive Neutrinos
== Energy density at decoupling
Assuming neutrinos are in thermal equilibrium immediately prior to decoupling,
their energy density is given by
$ rho(T) = g/(2pi)^3 integral (dif^3 p f(p,T) sqrt(m^2 + p^2)) $

where $g$, the internal degree of freedom for neutrinos is $2 times 2 times 2 = 8$,
and distribution function $f(p,T)$ is given by the Fermi-Dirac distribution for fermions:

$ f(p,T) = 1/(e^((sqrt(m^2+p^2))/T) + 1) $

where we neglected the chemical potential $mu$, which is much smaller than the temperature, $mu << T$ at early times.

Following Baumann's Section 3, we define the dimensionless variable $xi eq.triple p\/T$, and rewrite the previous equation as

$ rho_nu = T_nu^4/pi^2 integral dif xi (xi^2 sqrt(xi^2 + m_nu^2/T_nu^2))/(e^xi + 1) $

== Series expansion
For small $x eq.triple m_nu \/ T_nu$, we can expand the integrand around $x = 0$ then integrate with respect to $xi$:

$ sqrt(xi^2 + x^2) &approx lr(sqrt(xi^2 + x^2)|, size: #100%)_(x=0) + lr(x/sqrt(xi^2 + x^2)|, size: #100%)_(x=0) x + 1/2! lr(xi^2/(xi^2 + x^2)^(3/2)|, size: #100%)_(x=0) x^2 + dots.h \
&approx xi + 1/(2xi) x^2 + dots.h \
&approx xi + 1/(2xi) (m_nu/T_nu)^2 $

Therefore,

$ rho_nu &= T_nu^4/pi^2 integral dif xi (xi^2 sqrt(xi^2 + m_nu^2/T_nu^2))/(e^xi + 1) \
&approx T_nu^4/pi^2 integral dif xi (xi^2 (xi + 1/(2xi) (m_nu/T_nu)^2))/(e^xi + 1) \
&approx T_nu^4/pi^2 integral dif xi (xi^3 + xi/2 (m_nu/T_nu)^2)/(e^xi + 1) $

However, for massless neutrinos ($m_nu = 0$),
$ rho_(nu,0) &= T_nu^4/pi^2 integral dif xi xi^3/(e^xi + 1) \
&= (7 pi^2)/120 T_nu^4 $

Thus, we can rewrite $rho_nu$ as
$ rho_nu &approx rho_(nu,0) + T_nu^4/pi^2 integral dif xi (xi/2 (m_nu/T_nu)^2)/(e^xi + 1) \
&= rho_(nu,0) + T_nu^4/pi^2 pi^2/12 1/2 (m_nu/T_nu)^2 \
&= rho_(nu,0) + (7 pi^2)/120 T_nu^4 cdot 5/(7pi^2) (m_nu/T_nu)^2 \
&= rho_(nu,0) (1 + 5/(7pi^2) m_nu^2/T_nu^2) $

== Estimate smallest neutrino mass detectable in the CMB

If $rho_nu$ is "significantly" larger than $rho_(nu,0)$ at the epoch of the CMB ($z tilde.op 1000$), then the neutrinos can affect the CMB.

From previous section,
$ rho_nu = rho_(nu,0) (1 + 5/(7pi^2) m_nu^2/T_nu^2) $

Therefore, for the neutrinos to affect the CMB, let's estimate that $ rho_nu >> rho_(nu,0)$ is satisfied by $rho_nu approx 2 rho_(nu,0)$, or

$ 5/(7pi^2) m_nu^2/T_nu^2 approx 1 $
$ arrow.r m_nu approx sqrt((7pi^2)/5) T_nu $

Given the CMB temperature today $T_(gamma,0) = 0.235 "meV"$, we can use the fact that $T prop a^(-1)$ and after $e^+ e^-$ anihilation, the neutrino temperature is $T_nu = (4\/11)^(1\/3) T_gamma$, we find that the neutrino temperature at the epoch of CMB ($z tilde.op 1000$) was approximately
$ T_nu &approx (1+z) (4/11)^(1\/3) 0.235 "meV" \
&= 0.168 "eV" $

where we assumed that $g_*$ does not change considerably since $g_* T^3 a^3 approx "constant"$.

Therefore, neutrino mass $m_nu$ can affect the CMB is approximately
$ m_nu &approx sqrt((7pi^2)/5) T_nu \
&= 0.625 "eV" $

== Redshift neutrinos become non-relativistic

Assuming that one of the neutrinos species has a mass $m_nu$, it becomes non-relativistic when $T_nu tilde.op m_nu$. Given that $T_nu = T_(nu,0) (1+z)$, we find the redshift neutrinos become non-relativistic is

$ z &approx m_nu / T_(nu,0) \
&approx m_nu / ((4\/11)^(1\/3) T_(gamma,0)) \
&approx m_nu / ((4\/11)^(1\/3) 0.235 "meV") \
&approx m_nu / (0.168 "meV") $

== Number density of neutrinos today
Similarly to the previous part, we start with the number density at thermal equilibrium given by

$ n = g/(2 pi^2) T^3 integral dif xi xi^2/(e^sqrt(xi^2 + m_nu^2/T^2) + 1) $

in the relativistic limit where $m_nu << T_nu$, we find that

$ n_nu &= (zeta(3))/pi^2 g T_nu^3 cdot 3/4 \
&= (6zeta(3))/pi^2 T_nu^3 $
Using the the fact that neutrinos decouple at approximated $T approx 1 "MeV"$ (from Baumann's book), and restoring the factors of $c$ and $hbar$,

$ n_nu &= (6zeta(3))/pi^2 T_nu^3 / (hbar c)^3 \
&= (6zeta(3))/pi^2 (T_nu/(1 "MeV"))^3 ((6.5821 times 10^(-22) * "MeV" "s") cdot (2.998 times 10^10 "cm" "s"^(-1)))^(-3) \
&approx 9.51 times 10^31 "cm"^(-3) $


In order to calculate the redshift which neutrinos decouple, we first calculate the neutrino temperature today. The neutrino temperature today $T_(nu,0)$ can be calculated from the CMB temperature today

$ T_(nu,0) &= (4/11)^(1/3) T_(gamma,0) \
&= (4/11)^(1/3) cdot 0.235 "meV" \
&= 0.168 "meV" $


We know that $g_(*S) a^3 T^3 = "constant"$, and since the neutrino decoupling epoch $g_(*S)$ has decreased from $approx 11$ to $approx 4$, therefore, the redshift which neutrinos decouple, $z_D$
$ z_D &approx (1 "MeV")/(0.168 "meV") (11/4)^(1/3) \
&approx 8 times 10^9 $

The neutrino number density today is therefore
$ n_(nu,0) &= n_nu / (1 + z_D)^3 \
&= 9.51 times 10^31 "cm"^(-3) 1/(8 times 10^9)^3 \
&approx 163 "cm"^(-3) $

== Energy density today

Given that the critical density today is
$ rho_(c,0) &= (3 H_0^2)/(8 pi G) \
&= 1.878 times 10^(-29) h^2 "g" "cm"^(-3) \
&= 1.054 times 10^4 h^2 "eV" "cm"^(-3) $

and non relativistic particles have energy density $rho_nu approx n_nu m_nu$, we find

$ Omega_(nu,0) h^2 &= rho_(nu,0)/rho_(c,0) h^2 \
&= (n_(nu,0) m_nu) / rho_(c,0) h^2 \
&= (163 "cm"^(-3) cdot m_nu)/(1.054 times 10^4 h^2 "eV" "cm"^(-3)) h^2 \
&approx m_nu / (65 "eV") $

= Problem 3: Measuring the Expansion History with Standard Candles
Let
$ chi = integral dif z c/(H_0 [Omega_(m,0)(1+z)^3 + Omega_(Lambda,0) + (1 - Omega_(m,0) - Omega_(Lambda,0))(1+z)^2]^(1\/2)) $

== Series expansion to order $z^3$

Let
$ f(z) = (Omega_(m,0)(1+z)^3 + Omega_(Lambda,0) + (1 - Omega_(m,0) - Omega_(Lambda,0))(1+z)^2)^(-1\/2) $

Then
$ chi &= integral dif z c/H_0 f(z) \
&= integral dif z c/H_0 [ f(0) + f'(0) z + 1/(2!) f''(0) z^2 + dots.c] \
&= c/H_0 [ f(0) z + f'(0) z^2/2 + 1/(2!) f''(0) z^3/3 + O(z^4)] $

where
$ f(0) &= 1 \
f'(0) &= 1/2 (2 Omega_Lambda - Omega_m - 2) \
f''(0) &= 1/4 (3 Omega_m^2 + 4 Omega_m - 12 Omega_m Omega_Lambda + 12 Omega_Lambda^2 - 20 Omega_Lambda + 8) $

Therefore, to third order,

$ chi = c/H_0 [ z + (2 Omega_Lambda - Omega_m - 2)/4 z^2 + (3 Omega_m^2 + 4 Omega_m - 12 Omega_m Omega_Lambda + 12 Omega_Lambda^2 - 20 Omega_Lambda + 8)/24 z^3] $

== Accurate to 10%?

Assuming $Omega_m = 0.3$, $Omega_Lambda = 0.7$ and $h = 0.7$ (values from Problem 1),
we can numerically integrate $chi$ and compare to our approximation $chi_"approx"$, and calculate the value of redshift $z$ where

$ abs((chi(z) - chi_"approx" (z))/ chi(z)) approx 10% $

we find a value $z approx 1.204$.


#figure(
```julia
using Integrals
import PhysicalConstants.CODATA2018 as c
using Unitful, UnitfulAstro

Ω_M = 0.3
Ω_Λ = 0.7
c_0 = c.c_0 |> u"km/s"
H0 = 100 * 0.7u"km/s / Mpc"
A = (c_0/H0 |> u"km").val

E(z) = (Ω_M * (1+z)^3 + Ω_Λ + (1 - Ω_M - Ω_Λ)*(1+z)^2)^(1/2)

integral(z) = solve(IntegralProblem((z_,p) ->  A/E(z_), 0.0, z), QuadGKJL()).u

approx(z) = A * (z + 1/2 * (2Ω_Λ - Ω_M - 2) * z^2/2 + 1/2 * 1/4 * (3Ω_M^2+4Ω_M-12Ω_M*Ω_Λ + 12Ω_Λ^2 - 20Ω_Λ+8)*z^3/3)

error(z) = abs((approx(z)-integral(z))/(integral(z)+0.0001))

z = 0.0:0.001:10.0
i = abs.(error.(z) .- .1)
z[argmin(i)]
```,
    caption: [Julia code to calculate redshift where third-order expansion is accurate to 10% assuming Problem 1's values for $Omega_m$ and $Omega_Lambda$]
)

== Only parameter that can be measured
For small enough redshift, only the first term in our expansion contributes significantly to $xi$, while the second order and higher terms are negligible and vanish.

Therefore, for small redshift,

$ chi approx c/H_0 z $

and we see that we can only hope to measure $H_0$ in very low redshift measurements.

== Which combination of $Omega_m$ and $Omega_Lambda$ can be measured?
As we increase the redshift reach but still at low redshift measurement, the second order term in our expansion of $chi$ becomes non-negligible:

$ chi approx c/H_0 [ z + (2 Omega_Lambda - Omega_m - 2)/4 z^2 ] $

Therefore, we may hope to measure the combination $(2 Omega_Lambda - Omega_m - 2)$


== Forecast errors on $H_0$, $Omega_m$ and $Omega_Lambda$
As discussed previously, the error on $H_0$ will be mostly strongly affected by the first order factor
$ chi^((0)) approx c/H_0 z $
