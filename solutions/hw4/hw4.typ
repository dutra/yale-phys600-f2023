#let title = "ASTR 600: Problem Set 4"
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
    #block(text(weight: 500, 0.8em, "October 28 2023"))
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

= Problem 1: Recombination

== Derive the Saha equation
Following Baumann Section 3.1 closely, we start from the equation of density for particles in equilibrium (for $i = {e, p, H}$).

$ n_i^"eq" = g_i ((m_i T)/(2pi))^(3\/2) exp((mu_i - m_i)/T) $

In order to remove the dependence on the chemical potentials, consider the following ratio

$ (n_H/(n_e n_p))_"eq" = g_H / (g_e g_p) (m_H/(m_e m_p) (2pi)/T)^(3\/2) exp((m_p + m_e - m_H)/T) $

We can simplify this equation by using the fact that $n_e = n_p$ and the number of internal degrees of freedom are $g_p = g_e = 2$, $g_H = $. Moreover, $m_H approx m_p$ and knowing that the ionization energy of hydrogen is
$ E_I def m_p + m_e - m_H = 13.6 "eV" $

Therefore,

$ (n_H / n_e^2)_"eq" = ((2pi)/(m_e T))^(3\/2) e^(E_I\/T) $

Defining the free-electron fraction $X_e$ as

$ X_e def n_e / (n_p + n_H) = n_e / (n_e + n_H) $

and noticing that the denominator of the previous equation is the baryon density $n_b$ given by

$ n_b = eta n_gamma = eta times (2 zeta(3))/pi^2 T^3 $

We can then rewrite $n_H/n_e^2 n_b = (1-X_e)/X_e^2$, therefore we arrive at the Saha equation,

$ ((1-X_e)/X_e^2)_"eq" = (2 zeta(3))/pi^2 eta ((2 pi T)/m_e)^(3\/2) e^(E_I\/T) $

== Solve the Saha equation

We can solve the Saha equation by letting
$ f(T) def (2 zeta(3))/pi^2 eta ((2 pi T)/m_e)^(3\/2) e^(E_I\/T) $
then, we rewrite the Saha equation as

$ f X_e^2 + X_e - 1 = 0$
with positive root solution

$ X_e (T) = (-1 + sqrt(1 + 4 f))/(2 f(T)) $

Since $T = T_0 (1 + z)$ where $T_0 = 2.73K$, we can rewrite $f(T)$ in terms of $z$ as
$ f(z) def (2 zeta(3))/pi^2 eta ((2 pi T_0(1+z))/m_e)^(3\/2) e^(E_I\/T_0(1+z)) $

We find that the redshift at which $X_e = 0.1$ is at $z = 1258$, while we find that the redshift at which $X_e = 0.5$ is at $z = 1376$, a difference of $Delta z = 118$.

=== Plot

#figure(
    image("xe.png"),
    caption: [Plot of ionization fraction $X_e$ vs redshift.]
)

== Age of universe
In order to find the age of the universe, we can integrate
$ t(a) = integral_0^a (dif a)/(H_0 a sqrt(Omega_m a^(-3) + Omega_Lambda)) $
At the redshift $z = 1258$ at which $X_e = 0.1$, we find that the universe age is approximately 380,000 years for an universe with $Omega_m = 0.3$, $Omega_Lambda = 0.7$ and $H_0 = 70 "km/s / Mpc"$.

== estimate the decoupling redshift at which the Thomson scattering rate equals the Hubble rate

$ Gamma = n_b X_e sigma_t &approx H_0 sqrt(Omega_m (1+z)^3) $

Using that $n_b = eta n_gamma = eta times (2 zeta(3))/pi^2 T^3$ and $T = T_0 (1+z)$,

We find that
$ (1+z) X_e (z)^(2\/3) &= [(H_0 sqrt(Omega_m) pi^2)/(eta times 2 zeta(3) T_0^3 sigma_T)]^(2\/3) $

Solving it numerically (see attached notebook), we find $z = 1583$. The ionization fraction $X_e (z=1583) = 0.99$ and the age of the universe is $approx 270,000$ years.



= "What-if" BBN

Following Baumann Section 3.2 closely, we again start from the equation of density for particles in equilibrium (for $i = {n, p}$).

$ n_i^"eq" = g_i ((m_i T)/(2pi))^(3\/2) exp((mu_i - m_i)/T) $

Assuming that the chemical potentials of the electrons and neutrinos are negligibly small such as $mu_n = mu_p$, we find

$ (n_n/n_p)_"eq" = (m_n/m_p)^(3\/2) e^(-(m_n-m_p)\/T) $

We can ignore the small difference between the proton and neutron masses in the coefficient, but not in the exponent

$ (n_n/n_p)_"eq" = e^(-Q\/T) $

where $Q def m_n - m_p = 1.30 "MeV"$

Defining the neutron fraction as
$ X_n def n_n / (n_n + n_p) $

we find

$ X_n &def n_n / (n_n + n_p) \
&= ((n_n + n_p)/n_n)^(-1) \
&= (1 + n_p/n_n)^(-1) \
&= (1 + e^(Q\/T))^(-1) \
&= e^(-Q\/T) / (1 + e^(-Q\/T)) $


Therefore,

$ X^"eq"_n (T) = e^(-Q\/T) / (1 + e^(-Q\/T)) $

== Freezeout abundance of neutrons

Assuming the freezeout temperature of 0.8 MeV,


$ X^"eq"_e (T=0.8 "MeV") &= e^(-1.3\/0.8) / (1 + e^(-1.3\/0.8)) \
&= 0.165 $


== Mass fraction of helium

Since a helium atom is made out of two neutrons, we find that $n_"He" = 1\/2 n_n$.
Moreover, since $X_n &def n_n \/ (n_n + n_p)$, we have

$ n_n / n_p = X_n/(1 - X_n) $

Therefore,

$ Y_P &= 4 n_"He" \/ n_H \
&= 4 n_"He" \/ n_p \
&= 4 1/2 n_n \/ n_p \
&= 2 n_n \/ n_p \
&= (2X_n)/(1 - X_n) \
&= 0.395 $


== Impact on helium abundance
If the mass difference between neutrons and protons was actually 2.6 MeV, but the freeze out temperature remains the same, then

$ X^"eq"_e (T=0.8 "MeV") &= e^(-2.6\/0.8) / (1 + e^(-2.6\/0.8)) \
&= 0.037 $

and

$ Y_P &= 4 n_"He" \/ n_H \
&= (2X_n)/(1 - X_n) \
&= 0.078 $


Therefore, the abundance of Helium would decrease significantly.





= Problem 3: Freeze-in of particle species

For the freeze-in scenario, Boltzmann equation reads
$ 1/a^3 (dif (n a^3))/(dif t) = 2 Gamma h(t) n_(sigma,"eq")(t) $

We want to rewrite the previous equations in terms of $x def m_sigma\/T$ and $Y def n\/s$.

Since we only care on the overall dependence on $x$ and can write the final result in terms of the undefined constant $lambda_1$

Let's rewrite the left-side of the equation. First, the entropy density $s prop a^(-3)$, thus $Y def n\/s prop n a^3$. Moreover, the temperature $T prop a^(-1)$, thus $x def m\/T prop a$.

Hence, $(dif x)/(dif t) prop dot(a) prop dot(a)/a x = H x$. Moreover, in the radiation domination, $x prop a prop t^(1\/2)$, thus $dif x prop dif a prop t^(-1\/2) = a^(-1) dif t = x^(-1) dif t$. Thus, $dif t prop x dif x$ and

$ 1/a^3 (dif (n a^3))/(dif t) &prop 1/x^3 (dif Y)/(dif t) \
&prop x^(-4) (dif Y)/(dif x) $

On the right hand side of the original equation, we first notice that $Gamma$ is a constant. Then, we can take $h(t) arrow.r h(x) tilde.eq x\/(x+2)$ (according to Hunterer). Rewriting $n(t)$ in terms of $Y$, we find $n prop Y s prop a^(-3) Y prop x^(-3) Y$.
Thus,

$ 2 Gamma h(t) n_(sigma,"eq")(t) prop h(x) x^(-3) Y_(sigma,"eq") $

Therefore, equating both sides, we find

$ x^(-4) (dif Y)/(dif x) prop h(x) x^(-3) Y_(sigma,"eq") $

and hence, the final result

$ (dif Y)/(dif x) = lambda_1 x h(x) Y_(sigma,"eq") $

== Plots
We can plot $Y(x)$ and $Y_"eq" (x)$ by using the full form of $n$ from Baumann Eq. 3.13,
$ n = g/(2 pi^2) T^3 I_plus.minus (x) $

where
$ I_plus.minus (x) def integral_0^oo dif eta eta^2/(exp[sqrt(eta^2 + x^2)] plus.minus 1) $

Thus,

$ Y_"eq" (x) &def n/s = n / T^3 \
&= g/(2 pi^2) I_plus.minus (x) $

#figure(
    image("yeq.png"),
    caption: ["Plot of Dark Matter freeze-in abundance."]
)


== Key difference
As seen in the freeze-in figure, as the anihilation/decay rate $Gamma$ -- captured in the $lambda_1$ parameter, increases, more Dark Matter is produced and remain after freeze-in. That is the opposite of the freeze-out scenario, where the larger anihilation/decay rate results in smaller dark matter density left out after freeze-out.

Moreover, in the freeze-out scenario, the universe starts with a large amount of Dark Matter that gets anihilated until freeze-out, while in the freeze-in scenario the universe starts with little Dark Matter, which is produced by the decay of an intermediate particle, until freeze-in.
