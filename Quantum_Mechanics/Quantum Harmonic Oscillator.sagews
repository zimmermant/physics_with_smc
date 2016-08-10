︠f0347130-e354-435e-b51c-489065c7b88ai︠
%md

Physicists LOVE the harmonic oscillator potential.  It is one of our favorites for two very important reasons: 1) It is one of handful of potentials that we can solve exactly and 2) _any_ restoring force potential can be approximated as a harmonic oscillator near the equilibrium point.  This is why we often approximate solid matter as a collection of ball-and-springs; the molecular bonds between atoms behave like springs if you don't compress the solid too much.

The harmonic potential energy equation is \(U=\frac{1}{2}m \omega^2 x^2\).  Plugging this into Schrodinger's equation gives

\[\frac{-\hbar^2}{2m} \frac{d^2}{dx^2}\psi(x) + \frac{1}{2}m \omega^2 x^2 \psi(x) = E \psi(x)\] 


# <img src="sagemathcloud_logo1.png" width="48"> Solving differential equations


- When solving differential equations it helps to specify which variables are real and which are positive using the `assume()` command.
- You need to specify the independent variable of your function.  In this case we specify that $\psi$ is a function of $x$.
- The differential equation is defined using the Python `def` method.
    - This creates a function which we can differential, integrate, or solve using the differential equation solver.
- Use `desolve()` to solve the differential equation.  The arguments of `desolve()` are the differential equation to solve, the dependent variable ($\psi$ in this case), and the independent variable x (specified using `ivar=x` to indicate the independent variable).  In this case, `desolve()` with encounter an issue unless you specify `contrib_ode=True`, in which case a slightly different solver is used to handle the differential equation.
︡e49edeee-dd6d-4804-940f-fcb523106a93︡{"done":true,"md":"\nPhysicists LOVE the harmonic oscillator potential.  It is one of our favorites for two very important reasons: 1) It is one of handful of potentials that we can solve exactly and 2) _any_ restoring force potential can be approximated as a harmonic oscillator near the equilibrium point.  This is why we often approximate solid matter as a collection of ball-and-springs; the molecular bonds between atoms behave like springs if you don't compress the solid too much.\n\nThe harmonic potential energy equation is \\(U=\\frac{1}{2}m \\omega^2 x^2\\).  Plugging this into Schrodinger's equation gives\n\n\\[\\frac{-\\hbar^2}{2m} \\frac{d^2}{dx^2}\\psi(x) + \\frac{1}{2}m \\omega^2 x^2 \\psi(x) = E \\psi(x)\\] \n\n\n# <img src=\"sagemathcloud_logo1.png\" width=\"48\"> Solving differential equations\n\n\n- When solving differential equations it helps to specify which variables are real and which are positive using the `assume()` command.\n- You need to specify the independent variable of your function.  In this case we specify that $\\psi$ is a function of $x$.\n- The differential equation is defined using the Python `def` method.\n    - This creates a function which we can differential, integrate, or solve using the differential equation solver.\n- Use `desolve()` to solve the differential equation.  The arguments of `desolve()` are the differential equation to solve, the dependent variable ($\\psi$ in this case), and the independent variable x (specified using `ivar=x` to indicate the independent variable).  In this case, `desolve()` with encounter an issue unless you specify `contrib_ode=True`, in which case a slightly different solver is used to handle the differential equation."}
︠0a4d79df-cfba-449b-bf76-90425fc190b2︠
psi,m,L,omega=var('psi,m,L,omega')  #Declare wave function, mass, and box length as variables

Ener=var('Ener',latex_name=r'\mathcal{E}')  #Declare Ener as energy variable but will display a script E when using show() and pretty_print
hbar=var('hbar',latex_name=r'\hbar')  #Declares hbar as a variable and displays hbar symbol when using show() and pretty_print

assume(Ener,'real')   #Assume the variable Ener (the energy) only takes real values...
assume(Ener>0)   #... and assume the energy is greater than zero.  These are needed for desolve()

assume(m,'real')   #Assume the mass is real...
assume(m>0)     #... and positive.  If you don't make these assumptions you will get an error message asking if these variables are positive, negative, or zero

psi=function('psi')(x)   #To solve the differential equation we must tell SageMath that psi is a function called 'psi' with a single dependent variable


def f(psi):  #Define the equation to solve.
    return -hbar^2/(2*m)*diff(psi,x,2)+(1/2*m*omega^2*x^2-Ener)*psi   #This is the differential equation to be solved

general_soln = desolve(f(psi)==0,psi,ivar=x,contrib_ode=True)   #


pretty_print('The general solution to Schrodinger\'s equation is ', general_soln[0])
︡d2943466-884d-4a5a-ad4a-980117f45883︡{"html":"<div align='center'>The general solution to Schrodinger's equation is  $\\displaystyle \\psi\\left(x\\right) = K_{1} e^{\\left(\\frac{m \\omega x^{2}}{2 \\, {{\\hbar}}}\\right)} {\\rm kummer}_{m}\\left(\\frac{{{\\hbar}} \\omega + 2 \\, {{\\mathcal{E}}}}{4 \\, {{\\hbar}} \\omega}, \\frac{1}{2}, -\\frac{m \\omega x^{2}}{{{\\hbar}}}\\right) + K_{2} e^{\\left(\\frac{m \\omega x^{2}}{2 \\, {{\\hbar}}}\\right)} {\\rm kummer}_{u}\\left(\\frac{{{\\hbar}} \\omega + 2 \\, {{\\mathcal{E}}}}{4 \\, {{\\hbar}} \\omega}, \\frac{1}{2}, -\\frac{m \\omega x^{2}}{{{\\hbar}}}\\right)$</div>"}︡{"done":true}︡
︠6666b863-45e7-4f6a-b0a4-49e2a6bf06f2i︠
%md

The Kummer functions are [confluent hypergeometric functions](https://en.wikipedia.org/wiki/Confluent_hypergeometric_function).  At present SageMath cannot evaluate these functions so I'll enter the first few wave functions for you manually below.  
︡1b580825-ad79-4317-b1ff-80971aa09126︡{"done":true,"md":"\nThe Kummer functions are [confluent hypergeometric functions](https://en.wikipedia.org/wiki/Confluent_hypergeometric_function).  At present SageMath cannot evaluate these functions so I'll enter the first few wave functions for you manually below."}
︠d07fd3fc-1ada-4b83-85f5-8d823ac8a61es︠
#Harmonic Oscillator Wavefunction and energy
m,omega=var('m,omega')
hbar=var('hbar',latex_name=r'\hbar')                                  #Declares hbar as a variable and displays hbar symbol when using show() and pretty_print
alpha=m*omega/hbar                               #If alpha is defined _after_ the wave functions are defined, you would need to use .substitute(alpha=m*omega/hbar)

psi_HO0(x) = (alpha/pi)^(1/4)*e^(-alpha*x^2/2)                        #n=0 state of 1D harmonic oscillator
psi_HO1(x) = (4*alpha^3/pi)^(1/4)*x*e^(-alpha*x^2/2)                  #n=1 state of 1D harmonic oscillator
psi_HO2(x) = (alpha/(4*pi))^(1/4)*(2*alpha*x^2-1)*e^(-alpha*x^2/2)    #n=2 state of 1D harmonic oscillator
psi_HO3(x) = (alpha^3/(9*pi))^(1/4)*(2*alpha*x^3-3*x)*e^(-alpha*x^2/2)#n=3 state of 1D harmonic oscillator
psi_HO4(x) = (alpha/(36*pi))^(1/4)*(2*alpha^2*x^4-6*alpha*x^2+3/2)*e^(-alpha*x^2/2)  #n=4 state of 1D harmonic oscillator
psi_HO5(x) = (alpha/(225*pi))^(1/4)*(2*alpha^(5/2)*x^5-10*alpha^(3/2)*x^3+15*alpha^(1/2)*x/2)*e^(-alpha*x^2/2)  #n=5 state of 1D harmonic oscillator


def E_n(n,omega):                                                     #1D harmonic oscillator energy function
    return (n+1/2)*hbar*omega

def H(psi):                                                           #1D harmonic oscillator Hamiltonian
    return -hbar^2/(2*m)*diff(psi,x,2)+1/2*m*omega^2*x^2*psi
︡b5853132-9103-48b8-8761-8894ee657765︡{"done":true}
︠94e81252-678f-46b1-a26a-91e533c42097i︠
%md

In general, the quantum harmonic oscillator wave function can be found from the following relationships:

\[\psi_n(x) = \left( \frac{1}{2^n n!} \right) \left( \frac{\alpha}{\pi} \right) H_n(\alpha^{1/2}x) e^{-\alpha x^2/2}   \] 

where the Hermite polynomial $H_n(x)$ is found from 

\[H_n(x) = (-1)^n e^{x^2} \frac{d^n}{dx^n} e^{-x^2} \]
︡ff64f71f-b642-4cb7-89e2-fa3fbe85117b︡{"done":true,"md":"\nIn general, the quantum harmonic oscillator wave function can be found from the following relationships:\n\n\\[\\psi_n(x) = \\left( \\frac{1}{2^n n!} \\right) \\left( \\frac{\\alpha}{\\pi} \\right) H_n(\\alpha^{1/2}x) e^{-\\alpha x^2/2}   \\] \n\nwhere the Hermite polynomial $H_n(x)$ is found from \n\n\\[H_n(x) = (-1)^n e^{x^2} \\frac{d^n}{dx^n} e^{-x^2} \\]"}
︠6456fd65-bc5a-412f-84aa-bb5d7d87d514i︠
%md

# For You To Try:

Prove that the quantum harmonic oscillator wave functions are normalized
︡4d451284-ca54-4bce-bce6-ebdb0549592f︡{"done":true,"md":"\n# For You To Try:\n\nProve that the quantum harmonic oscillator wave functions are normalized"}
︠15fbeaa8-7929-4738-b8c3-9ba1af696dcb︠
#Insert your work here
︡679db5bf-1729-4cf3-a050-2cc51df992f8︡
︠31722e11-9684-465e-9ac8-af8e7deb5ecei︠
%md

# <img src="sagemathcloud_logo1.png" width="48"> Fancier 2D Plotting


- You can add titles, label axes, change label size, and move the title of plots
- You can specify different line styles:
    - Solid lines '-'
    - Dashed lines '--'
    - Dash dot '-.'
    - Dotted ':'
- If you assign a plot to a variable name, you can add on additional plots and features.
    - In Python, `P+=text...` is the same as `P=P+text...`.  This is called in-place addition
    - Text can be added to a plot using `text('something profound', (x,y), color='red)` where `x` and `y` are the location of the midpoint of the text.
    - Arrows can be added to point out features by specifying the location of the head and tail of the arrow `arrow2d((x1,y1),(x2,y2))`
    - Multiple plots can be combined into a single graph by adding `plot()` commands to`P`
    
    ### Plot the ground state wavefunction of the one-dimensional harmonic oscillator

︡4dec1d76-9342-4a87-a15f-29c67ff7794a︡{"done":true,"md":"\n# <img src=\"sagemathcloud_logo1.png\" width=\"48\"> Fancier 2D Plotting\n\n\n- You can add titles, label axes, change label size, and move the title of plots\n- You can specify different line styles:\n    - Solid lines '-'\n    - Dashed lines '--'\n    - Dash dot '-.'\n    - Dotted ':'\n- If you assign a plot to a variable name, you can add on additional plots and features.\n    - In Python, `P+=text...` is the same as `P=P+text...`.  This is called in-place addition\n    - Text can be added to a plot using `text('something profound', (x,y), color='red)` where `x` and `y` are the location of the midpoint of the text.\n    - Arrows can be added to point out features by specifying the location of the head and tail of the arrow `arrow2d((x1,y1),(x2,y2))`\n    - Multiple plots can be combined into a single graph by adding `plot()` commands to`P`\n    \n    ### Plot the ground state wavefunction of the one-dimensional harmonic oscillator"}
︠74d21729-ab04-4ff6-92a6-93c21bfccaa9︠
psi0_plot(x)=psi_HO0(x).substitute(m=1,omega=1,hbar=1)      #To plot a function, all variables must be defined - chose variables = 1 for simplicity

P=plot(psi0_plot(x),[x,-2,2],linestyle='--',title='n=1 State of QHO', axes_labels=['Position x', '$\psi(x)$'],axes_labels_size=1, title_pos=(.3,1))
P+= text('Wave function peak', (1, 1.05), color='red')
P+=arrow2d((1, 1), (0, .75))
P.show()
︡51b058ca-febf-4c9a-9ae5-027c68487784︡{"file":{"filename":"/projects/d18eeda9-38fb-4d20-9a0a-4afa03a182aa/.sage/temp/compute4-us/10764/tmp_cS4yI7.svg","show":true,"text":null,"uuid":"ad9d5fac-d277-48f8-9d28-0cc6ca7f0f12"},"once":false}︡{"html":"<div align='center'></div>"}︡{"done":true}︡
︠5f1ce621-231a-48fc-92ce-0842d1b6df48i︠
%md

# For You To Try:

- Plot the $n=1$, $n=2$, and $n=3$ wave functions for the quantum harmonic oscillator on the same plot
- Describe how the number of nodes in the wave function relates to the value of n
- Draw arrows to indicate the location of the nodes of the wave function
︡4488ccca-3783-4ad8-810f-bcf9192e5229︡{"done":true,"md":"\n# For You To Try:\n\n- Plot the $n=1$, $n=2$, and $n=3$ wave functions for the quantum harmonic oscillator on the same plot\n- Describe how the number of nodes in the wave function relates to the value of n\n- Draw arrows to indicate the location of the nodes of the wave function"}
︠8c768c5b-12b3-4166-a6a3-86c39b580bb7︠
#Insert your code here
︡1f9cbda7-5705-4823-81f8-33ea926c8955︡
︠04d3bd41-1aa1-4060-a09f-41e583f1e849i︠
%md

### Calculate harmonic oscillator energy from Schrodinger equation and wave function

We can check that the wave functions satisfy Schrodinger's equation and give the correct energy.  The equation is

\[\hat{H}\psi(x) = E \psi(x).\] 

Since $E$ is a number (unlike $\hat{H}$, which is an operator), we can divide both sides of the equation by $\psi(x)$ and cancel the terms on the right hand side to get an equation for the energy.

\[\frac{\hat{H}\psi(x)}{\psi(x)} = E.\]
︡538b98eb-5111-400c-b6e0-04fced2700d2︡{"done":true,"md":"\n### Calculate harmonic oscillator energy from Schrodinger equation and wave function\n\nWe can check that the wave functions satisfy Schrodinger's equation and give the correct energy.  The equation is\n\n\\[\\hat{H}\\psi(x) = E \\psi(x).\\] \n\nSince $E$ is a number (unlike $\\hat{H}$, which is an operator), we can divide both sides of the equation by $\\psi(x)$ and cancel the terms on the right hand side to get an equation for the energy.\n\n\\[\\frac{\\hat{H}\\psi(x)}{\\psi(x)} = E.\\]"}
︠a3c7d62f-cba1-43b1-a229-953a650a2033︠


f=H(psi_HO0(x))/psi_HO0(x)
show(f)


︡596e3230-a208-4813-9c49-da700960a58f︡{"html":"<div align='center'>$\\displaystyle \\frac{{\\left(m \\omega^{2} x^{2} \\left(\\frac{m \\omega}{\\pi {{\\hbar}}}\\right)^{\\frac{1}{4}} e^{\\left(-\\frac{m \\omega x^{2}}{2 \\, {{\\hbar}}}\\right)} - \\frac{{\\left(\\frac{m^{2} \\omega^{2} x^{2} \\left(\\frac{m \\omega}{\\pi {{\\hbar}}}\\right)^{\\frac{1}{4}} e^{\\left(-\\frac{m \\omega x^{2}}{2 \\, {{\\hbar}}}\\right)}}{{{\\hbar}}^{2}} - \\frac{m \\omega \\left(\\frac{m \\omega}{\\pi {{\\hbar}}}\\right)^{\\frac{1}{4}} e^{\\left(-\\frac{m \\omega x^{2}}{2 \\, {{\\hbar}}}\\right)}}{{{\\hbar}}}\\right)} {{\\hbar}}^{2}}{m}\\right)} e^{\\left(\\frac{m \\omega x^{2}}{2 \\, {{\\hbar}}}\\right)}}{2 \\, \\left(\\frac{m \\omega}{\\pi {{\\hbar}}}\\right)^{\\frac{1}{4}}}$</div>"}︡{"done":true}︡
︠57f5d167-e9b7-455b-a8fa-37a008a38333︠
%md

# <img src="sagemathcloud_logo1.png" width="48"> Simplify Symbolic Expressions

- The `.expand()` command will distribute terms and expand powers in an expression
    - Useful for getting terms to cancel out
- The `.canonicalize_radical()` command returns the _canonical_ form of logs and exponents
- Other simplification commands include:
    - `.combine()`,
    - `.simplify_fill()`, 
    - `.simplify_trig()`, 
    - `.reduce_trig()`, 
    - `.simplify_log()`, 
    - `.trig_expand()`

This result does not look like what we would expect.  However, computer algebra systems like Maxima (the heart of SageMath computer algebra) sometimes have issues with non-integer powers.  One trick is to raise this function to the nth power (in this case it would be to the 4th power) to get rid of non-integer powers, simplify the equation, then take the nth root to get the final result.  Let's try this:
︡b82bc6bc-c8e7-4448-b9d4-b3064fd40b9a︡{"done":true,"md":"\n# <img src=\"sagemathcloud_logo1.png\" width=\"48\"> Simplify Symbolic Expressions\n\n- The `.expand()` command will distribute terms and expand powers in an expression\n    - Useful for getting terms to cancel out\n- The `.canonicalize_radical()` command returns the _canonical_ form of logs and exponents\n- Other simplification commands include:\n    - `.combine()`,\n    - `.simplify_fill()`, \n    - `.simplify_trig()`, \n    - `.reduce_trig()`, \n    - `.simplify_log()`, \n    - `.trig_expand()`\n\nThis result does not look like what we would expect.  However, computer algebra systems like Maxima (the heart of SageMath computer algebra) sometimes have issues with non-integer powers.  One trick is to raise this function to the nth power (in this case it would be to the 4th power) to get rid of non-integer powers, simplify the equation, then take the nth root to get the final result.  Let's try this:"}
︠7c631502-c1a1-4be1-9042-f6ac13251112︠
f4=(f^4).expand()    #Fourth power

pretty_print('Taking the fourth power of our original result simplifies things down to $f^4=$', f4) 

f1=(f4^(1/4)).canonicalize_radical()    #.canonicalize_radical() simplifies terms involving exponents

pretty_print('Taking the fourth root and using the .canonicalize_radical() command gives us ', f1)
pretty_print('The energy of the n=1 state from the energy function E_n(n,omega) is $E_n=$', E_n(0,omega))
︡cdf70e02-6f92-4ed1-b228-8855cc570eb7︡{"html":"<div align='center'>Taking the fourth power of our original result simplifies things down to $f^4=$ $\\displaystyle \\frac{1}{16} \\, {{\\hbar}}^{4} \\omega^{4}$</div>"}︡{"html":"<div align='center'>Taking the fourth root and using the .canonicalize_radical() command gives us  $\\displaystyle \\frac{1}{2} \\, {{\\hbar}} \\omega$</div>"}︡{"html":"<div align='center'>The energy of the n=1 state from the energy function E_n(n,omega) is $E_n=$ $\\displaystyle \\frac{1}{2} \\, {{\\hbar}} \\omega$</div>"}︡{"done":true}︡
︠5cd22e29-1ae4-458c-a508-c92f19bd7b91i︠
%md

# For you to try:

- Use the Hamiltonian to find the energies of the \(n=1\), \(n=2\), and \(n=3\) states.
    - Remember that \(E = \frac{H \psi(x)}{\psi(x)}\)
    - If your resulting equation is a huge mess, try squaring, expanding, then simplifying the equation

- Check that your results are correct by using the function `E_n(n,omega)`
︡9de5a61f-ac76-4833-944a-ab18a8d3a70c︡{"done":true,"md":"\n# For you to try:\n\n- Use the Hamiltonian to find the energies of the \\(n=1\\), \\(n=2\\), and \\(n=3\\) states.\n    - Remember that \\(E = \\frac{H \\psi(x)}{\\psi(x)}\\)\n    - If your resulting equation is a huge mess, try squaring, expanding, then simplifying the equation\n\n- Check that your results are correct by using the function `E_n(n,omega)`"}
︠f9d50e42-947f-4d76-a6f6-dac8604af891︠
#Insert your work here

︡6c523761-d34b-48e0-b3a2-f3ae6ae6510f︡
︠6ec41718-39df-4366-ab04-451e0438ebaai︠
%md

### Calculate the commutator $[\hat{x},\hat{p}]$

We can define the momentum operator $\hat{p}$ using `def p:`.  The operator $\hat{x}$ is just multiplication by the variable $x$ so we don't need to define a separate operator.  One thing to keep in mind is that we must explicitly apply the operators (i.e. All terms that the operator operates on must be inside the parentheses as an argument to the operator function)
︡515d452e-ad28-4521-a794-f8c72d343efa︡{"done":true,"md":"\n### Calculate the commutator $[\\hat{x},\\hat{p}]$\n\nWe can define the momentum operator $\\hat{p}$ using `def p:`.  The operator $\\hat{x}$ is just multiplication by the variable $x$ so we don't need to define a separate operator.  One thing to keep in mind is that we must explicitly apply the operators (i.e. All terms that the operator operates on must be inside the parentheses as an argument to the operator function)"}
︠263946f3-bc04-4761-9989-99c2be0a2f3a︠
def p(psi):   #momentum operator
    return -i*hbar*diff(psi,x)


psi=function('psi')(x)   #Dummy function


com=x*p(psi)-p(x*psi)   #Calculate the commutation relation [x,p]
pretty_print('The commutation relation between $\hat{x}$ and $\hat{p}$ is $[\hat{x},\hat{p}]\psi(x) = $', com.expand())  #.expand() required to simplify expression
︡b0355664-9b21-492d-91af-286a955d7ad5︡{"html":"<div align='center'>The commutation relation between $\\hat{x}$ and $\\hat{p}$ is $[\\hat{x},\\hat{p}]\\psi(x) = $ $\\displaystyle i \\, {{\\hbar}} \\psi\\left(x\\right)$</div>"}︡{"done":true}︡
︠bddb9a34-30de-4b0e-b669-6a0f19331152i︠
%md

### Raising and Lowering Operators

The raising and lowering operators are powerful tools for exploring the quantum harmonic oscillator.  Most quantum physics texts will cover these in detail.  The following cells will explore a few things you can do in SageMath with the raising and lowering operators.  The cell below defines the operators.

Note: The output from the cell below includes a term $D[0]\psi(x)$.  This is SageMath notation for the derivative with respect to the first variable in the function (remember that Python starts numbering at zero).  If $\psi$ was a function of $x$ and $y$, then the derivative of $\psi(x,y)$ with respect to $y$ would be denoted $D[1]\psi(x,y)$.
︡35964f3a-c159-4809-b899-0533ce0408cf︡{"done":true,"md":"\n### Raising and Lowering Operators\n\nThe raising and lowering operators are powerful tools for exploring the quantum harmonic oscillator.  Most quantum physics texts will cover these in detail.  The following cells will explore a few things you can do in SageMath with the raising and lowering operators.  The cell below defines the operators.\n\nNote: The output from the cell below includes a term $D[0]\\psi(x)$.  This is SageMath notation for the derivative with respect to the first variable in the function (remember that Python starts numbering at zero).  If $\\psi$ was a function of $x$ and $y$, then the derivative of $\\psi(x,y)$ with respect to $y$ would be denoted $D[1]\\psi(x,y)$."}
︠fd2d83f6-8fd8-4184-b46a-071bf0486617s︠
psi,m,L,omega, f=var('psi,m,L,omega,f')                          #Declare wave function, mass, and box length as variables

Ener=var('Ener',latex_name=r'\mathcal{E}')                       #Declare Ener as energy variable but will display a script E when using show() and pretty_print
hbar=var('hbar',latex_name=r'\hbar')                             #Declares hbar as a variable and displays hbar symbol when using show() and pretty_print

psi=function('psi')(x)    #Define dummy function

def p(psi):   #momentum operator
    return -i*hbar*diff(psi,x)


def a_plus(psi):   #raising operator
    return 1/sqrt(2*hbar*m*omega)*(-i*p(psi)+m*omega*x*psi)


def a_minus(psi):   #lowering operator
    return 1/sqrt(2*hbar*m*omega)*(+i*p(psi)+m*omega*x*psi)

show(a_plus(psi))



︡b3804f25-5758-4db9-9715-78443ad524c6︡{"html":"<div align='center'>$\\displaystyle \\frac{\\sqrt{2} {\\left(m \\omega x \\psi\\left(x\\right) - {{\\hbar}} D[0]\\left(\\psi\\right)\\left(x\\right)\\right)}}{2 \\, \\sqrt{{{\\hbar}} m \\omega}}$</div>"}︡{"done":true}︡
︠fc9c053b-da52-49ee-bdb0-a6250c593dc9i︠
%md

### Demonstrate that $a_+ \psi_{0}(x)= \psi_{1}(x)$

- Any easy way to show two equations are equal is to divide one equation by the other and show the result is equal to 1
    - This cuts down on manipulation of equations to put them in the same format
- To get all terms to cancel we will raise everything to the 4th power and then take the 4th root
- The `.canonicalize_radical()` command is used to expand the exponent terms

Show that $\frac{a_+ \psi_0(x)}{\psi_1(x)} = 1$
︡1c7dc8b1-193b-42d8-86bc-71adb7895c81︡{"done":true,"md":"\n### Demonstrate that $a_+ \\psi_{0}(x)= \\psi_{1}(x)$\n\n- Any easy way to show two equations are equal is to divide one equation by the other and show the result is equal to 1\n    - This cuts down on manipulation of equations to put them in the same format\n- To get all terms to cancel we will raise everything to the 4th power and then take the 4th root\n- The `.canonicalize_radical()` command is used to expand the exponent terms\n\nShow that $\\frac{a_+ \\psi_0(x)}{\\psi_1(x)} = 1$"}
︠c287cdd2-b25d-493f-b04b-790bc8077e88︠
f=(a_plus(psi_HO0(x))/psi_HO1(x))

pretty_print(' \( a_+ \psi_0(x)/\psi_1(x) = \)' ,f)   #It's not clear this is equal to one but ...
f4=(f^4)                                              #... with a little nudge...
f1=(f4^(1/4)).canonicalize_radical()
pretty_print(' \( a_+ \psi_0(x)/\psi_1(x) = \)' ,f1)  #...everything works out nicely
︡e7495e2e-58c8-485c-b7d9-50f1a72b7384︡{"html":"<div align='center'> \\( a_+ \\psi_0(x)/\\psi_1(x) = \\) $\\displaystyle \\frac{4^{\\frac{3}{4}} \\sqrt{2} m \\omega \\left(\\frac{m \\omega}{\\pi {{\\hbar}}}\\right)^{\\frac{1}{4}}}{4 \\, \\sqrt{{{\\hbar}} m \\omega} \\left(\\frac{m^{3} \\omega^{3}}{\\pi {{\\hbar}}^{3}}\\right)^{\\frac{1}{4}}}$</div>"}︡{"html":"<div align='center'> \\( a_+ \\psi_0(x)/\\psi_1(x) = \\) $\\displaystyle 1$</div>"}︡{"done":true}︡
︠d1fab92a-6c5d-476d-8c88-0accf34718e2i︠
%md

### Demonstrate that $a_+ \psi_{1}(x)= \sqrt{2}\psi_{2}(x)$

- In addition to `.canonicalize_radical()` we also have to use `.combine()` to collect terms over a common denominator, and `.expand()`.

Show that $\frac{a_+ \psi_1(x)}{\psi_2(x)} = \sqrt{2}$
︡931b8867-7bdc-477f-892e-02a46eec8d73︡{"done":true,"md":"\n### Demonstrate that $a_+ \\psi_{1}(x)= \\sqrt{2}\\psi_{2}(x)$\n\n- In addition to `.canonicalize_radical()` we also have to use `.combine()` to collect terms over a common denominator, and `.expand()`.\n\nShow that $\\frac{a_+ \\psi_1(x)}{\\psi_2(x)} = \\sqrt{2}$"}
︠f6e29d01-35a8-4b68-bb51-cb10bb7af6c0s︠
f=(a_plus(psi_HO1(x))/psi_HO2(x)).expand().combine()

pretty_print(' \( a_+ \psi_1(x)/\psi_2(x) = \)' ,f) 

f4=(f^4).expand()
f1=(f4^(1/4)).canonicalize_radical()

pretty_print(' \( a_+ \psi_1(x)/\psi_2(x) = \)' ,f1)
pretty_print(' or equivalently \( a_+ \psi_1(x) =\)',f1,' \(\psi_2(x)\)')
︡896e4a54-b91b-483e-92d0-443884a59b41︡{"html":"<div align='center'> \\( a_+ \\psi_1(x)/\\psi_2(x) = \\) $\\displaystyle \\frac{2 \\, \\sqrt{2} \\left(\\frac{m^{3} \\omega^{3}}{{{\\hbar}}^{3}}\\right)^{\\frac{1}{4}} m \\omega x^{2} - \\sqrt{2} \\left(\\frac{m^{3} \\omega^{3}}{{{\\hbar}}^{3}}\\right)^{\\frac{1}{4}} {{\\hbar}}}{\\sqrt{{{\\hbar}} m \\omega} {\\left(\\frac{2 \\, m \\omega x^{2}}{{{\\hbar}}} - 1\\right)} \\left(\\frac{m \\omega}{{{\\hbar}}}\\right)^{\\frac{1}{4}}}$</div>"}︡{"html":"<div align='center'> \\( a_+ \\psi_1(x)/\\psi_2(x) = \\) $\\displaystyle \\sqrt{2}$</div>"}︡{"html":"<div align='center'> or equivalently \\( a_+ \\psi_1(x) =\\) $\\displaystyle \\sqrt{2}$  \\(\\psi_2(x)\\)</div>"}︡{"done":true}︡
︠eb335c35-e94b-4456-98c9-e69f616c601ei︠
%md

## For You To Try

Show that Show that $\frac{a_+ \psi_2(x)}{\psi_1(x)} = \sqrt{3}$
︡53ffb1fc-e13f-4dfc-a22c-fb699833bcb2︡{"done":true,"md":"\n## For You To Try\n\nShow that Show that $\\frac{a_+ \\psi_2(x)}{\\psi_1(x)} = \\sqrt{3}$"}
︠fbfdab4f-2a2b-4316-9fa2-5e58c9a16484s︠
#Insert your work here
︡8b8c239e-8bec-49fe-8700-3e60123a184a︡{"done":true}︡
︠8507d4cc-42b2-4991-b163-b7c3bfe661f0i︠
%md

# <img src="sagemathcloud_logo1.png" width="48"> Projects and Problem Ideas

- Use $a_+$ to generate higher quantum harmonic oscillator wave functions and then use $H=\hbar \omega(a_- a_+ - \frac{1}{2})$ to determine the energy of those states.
- Rewrite $\hat{x}$ and $\hat{p}$ in terms of $a_-$ and $a_+$ and use the raising and lowering operators to calculate the expectation values $<x>$ and $<p>$.  Compare your results to what you get from $\int \psi^*(x) x \psi(x) dx$ and $\int \psi^*(x) p \psi(x) dx$.
︡24158f01-a5ad-4645-8b1b-9867b129508c︡{"done":true,"md":"\n# <img src=\"sagemathcloud_logo1.png\" width=\"48\"> Projects and Problem Ideas\n\n- Use $a_+$ to generate higher quantum harmonic oscillator wave functions and then use $H=\\hbar \\omega(a_- a_+ - \\frac{1}{2})$ to determine the energy of those states.\n- Rewrite $\\hat{x}$ and $\\hat{p}$ in terms of $a_-$ and $a_+$ and use the raising and lowering operators to calculate the expectation values $<x>$ and $<p>$.  Compare your results to what you get from $\\int \\psi^*(x) x \\psi(x) dx$ and $\\int \\psi^*(x) p \\psi(x) dx$."}
︠304cc24a-78aa-4935-af43-d3133f448c7a︠










