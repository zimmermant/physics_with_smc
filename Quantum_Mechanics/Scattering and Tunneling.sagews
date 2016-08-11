︠aa688d1d-2f8d-47d1-b64f-029b3bce3630︠
A,B,C,D,m,E,V_0,k_1,k_2=var('A,B,C,D,m,E,V_0,k_1,k_2')
Ener=var('Ener',latex_name=r'\mathcal{E}')  #Declare Ener as energy variable but will display a script E when using show() and pretty_print
hbar=var('hbar',latex_name=r'\hbar')  #Declares hbar as a variable and displays hbar symbol when using show() and pretty_print

C=0

psi_1(x)=A*e^(i*sqrt(2*m*E)/hbar*x) + B*e^(-i*sqrt(2*m*E)/hbar*x)
psi_2(x)=C*e^(sqrt(2*m*(E-V_0)/hbar*x)) + D*e^(-sqrt(2*m*(E-V_0))/hbar*x) 
              
              
︡5ab9cfa9-e8f5-4853-8ef8-8fc034006928︡{"done":true}︡
︠1f3a6812-b580-4aca-b8d4-7caad97c17f8s︠
eqn1 = psi_2(0)==psi_1(0)
show(eqn1)
eqn2 = diff(psi_1(x),x)==diff(psi_2(x),x)

eqn2A=eqn2.substitute(x=0)
show(eqn2A)

eqn2B=eqn2A.substitute(D=A+B).expand()
show(eqn2B)

B_ans1=solve(eqn2B,B)[0]
show(B_ans1)
B_ans2=B_ans1.divide_both_sides(A).expand()
show(B_ans2)

︡b19ba253-8f42-409b-9100-5f9d937e8947︡{"html":"<div align='center'>$\\displaystyle D = A + B$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\frac{i \\, \\sqrt{2} \\sqrt{E m} A}{{{\\hbar}}} - \\frac{i \\, \\sqrt{2} \\sqrt{E m} B}{{{\\hbar}}} = -\\frac{\\sqrt{2} \\sqrt{{\\left(E - V_{0}\\right)} m} D}{{{\\hbar}}}$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\frac{i \\, \\sqrt{2} \\sqrt{E m} A}{{{\\hbar}}} - \\frac{i \\, \\sqrt{2} \\sqrt{E m} B}{{{\\hbar}}} = -\\frac{\\sqrt{2} \\sqrt{E m - V_{0} m} A}{{{\\hbar}}} - \\frac{\\sqrt{2} \\sqrt{E m - V_{0} m} B}{{{\\hbar}}}$</div>"}︡{"html":"<div align='center'>$\\displaystyle B = -\\frac{\\sqrt{E m - V_{0} m} A + i \\, \\sqrt{E m} A}{\\sqrt{E m - V_{0} m} - i \\, \\sqrt{E m}}$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\frac{B}{A} = -\\frac{\\sqrt{E m - V_{0} m}}{\\sqrt{E m - V_{0} m} - i \\, \\sqrt{E m}} - \\frac{i \\, \\sqrt{E m}}{\\sqrt{E m - V_{0} m} - i \\, \\sqrt{E m}}$</div>"}︡{"done":true}︡
︠1654fed0-bc5e-4743-b935-b56fa4a7f55fs︠
A,B,C,D,m,E,V_0,k_1,k_2=var('A,B,C,D,m,E,V_0,k_1,k_2')
Ener=var('Ener',latex_name=r'\mathcal{E}')  #Declare Ener as energy variable but will display a script E when using show() and pretty_print
hbar=var('hbar',latex_name=r'\hbar')  #Declares hbar as a variable and displays hbar symbol when using show() and pretty_print
assume(k_1,'real')
assume(k_2,'real')

C=0

psi_1(x)=A*e^(i*k_1*x) + B*e^(-i*k_1*x)
psi_2(x)=C*e^(k_2*x) + D*e^(-k_2*x) 
︡76a9adbc-793c-49ba-a6db-2c1c5e2221bb︡{"done":true}︡
︠0a8ac3d9-451b-47fc-be35-f7755192b595s︠
eqn1 = psi_2(0)==psi_1(0)
show(eqn1)
eqn2 = diff(psi_1(x),x)==diff(psi_2(x),x)

eqn2A=eqn2.substitute(x=0)
show(eqn2A)

eqn2B=eqn2A.substitute(D=A+B).expand()
show(eqn2B)

B_ans1=solve(eqn2B,B)[0]
show(B_ans1)
B_ans2=B_ans1.divide_both_sides(A).expand()
show(B_ans2)
FF=B_ans2.lhs()==B_ans2.rhs().combine()


show(FF)
R=(FF.rhs()*conjugate(FF.rhs())).expand().full_simplify()
show(R)

eqn1A= eqn1.divide_both_sides(A).expand()
show(eqn1A)


eqn1B=eqn1A.substitute(B=A*FF.rhs()).full_simplify()
show(eqn1B)
show(eqn1B.rhs()*conjugate(eqn1B.rhs()).expand())


︡571d7a66-2c24-4007-bd86-d5b4929bc625︡{"html":"<div align='center'>$\\displaystyle D = A + B$</div>"}︡{"html":"<div align='center'>$\\displaystyle i \\, A k_{1} - i \\, B k_{1} = -D k_{2}$</div>"}︡{"html":"<div align='center'>$\\displaystyle i \\, A k_{1} - i \\, B k_{1} = -A k_{2} - B k_{2}$</div>"}︡{"html":"<div align='center'>$\\displaystyle B = \\frac{A {\\left(-i \\, k_{1} - k_{2}\\right)}}{-i \\, k_{1} + k_{2}}$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\frac{B}{A} = -\\frac{i \\, k_{1}}{-i \\, k_{1} + k_{2}} - \\frac{k_{2}}{-i \\, k_{1} + k_{2}}$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\frac{B}{A} = \\frac{-i \\, k_{1} - k_{2}}{-i \\, k_{1} + k_{2}}$</div>"}︡{"html":"<div align='center'>$\\displaystyle 1$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\frac{D}{A} = \\frac{B}{A} + 1$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\frac{D}{A} = -\\frac{2 i \\, k_{1}}{-i \\, k_{1} + k_{2}}$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\frac{4 \\, k_{1}^{2}}{{\\left(i \\, k_{1} + k_{2}\\right)} {\\left(-i \\, k_{1} + k_{2}\\right)}}$</div>"}︡{"done":true}︡
︠2fb81159-027d-43e6-9d71-0f6c963becf7︠
f=lambda x: x*sin(x)
diff(f(x),x)

def g(x):
    return x*sin(x)

diff(g(x),x)

type(f(x))
type(g(x))
︡46f8705a-3627-42f5-a13c-41cd2176a012︡{"stdout":"x*cos(x) + sin(x)\n"}︡{"stdout":"x*cos(x) + sin(x)\n"}
︠c4a80631-7c91-4c75-a076-6859d55ab0f0︠









