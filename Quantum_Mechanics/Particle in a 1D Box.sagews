︠de58cd79-87e0-4d83-8f5b-26647dc90bebi︠
%md

# Solving differential equations


- When solving differential equations it helps to specify which variables are real and which are positive using the **assume()** command.
- You need to specify the independent variable of your function.  In this case we specify that $\psi$ is a function of $x$.
- The differential equation is defined using the Python **def** method.
    - This creates a function which we can differential, integrate, or solve using the differential equation solver.
- Use **desolve()** to solve the differential equation.  The arguments of **desolve()** are the differential equation to solve, the dependent variable ($\psi$ in this case), and the independent variable x (specified using **ivar=x** to indicate the independent variable).

### Find general solution to Schrodinger's equation

The time-independent Schrodinger's equation in one dimension is $\frac{-\hbar^2}{2m} \frac{d^2}{dx^2}\psi(x) + V(x) = E \psi(x)$.  For an infinite square well of width $L$ the potential energy function is given by

\[ V(x) = \left\{ \begin{array}{cc} \infty & \text{if } x\ge L\\ 0 & \text{if } 0< x < L \\ \infty & \text{if } x \le 0 \end{array}\right. \]


<img src="particle_in_a_box.png" width=30%>

Note: To solve this differential equation we set the potential energy to zero inside the box and rearrange Schrodinger's equation so it has the form \(\frac{-\hbar^2}{2m} \frac{d^2}{dx^2}\psi(x) - E \psi(x) = 0\).

︡ee16f980-f064-4d9d-95c5-8041c9725805︡{"done":true,"md":"\n# Solving differential equations\n\n\n- When solving differential equations it helps to specify which variables are real and which are positive using the **assume()** command.\n- You need to specify the independent variable of your function.  In this case we specify that $\\psi$ is a function of $x$.\n- The differential equation is defined using the Python **def** method.\n    - This creates a function which we can differential, integrate, or solve using the differential equation solver.\n- Use **desolve()** to solve the differential equation.  The arguments of **desolve()** are the differential equation to solve, the dependent variable ($\\psi$ in this case), and the independent variable x (specified using **ivar=x** to indicate the independent variable).\n\n### Find general solution to Schrodinger's equation\n\nThe time-independent Schrodinger's equation in one dimension is $\\frac{-\\hbar^2}{2m} \\frac{d^2}{dx^2}\\psi(x) + V(x) = E \\psi(x)$.  For an infinite square well of width $L$ the potential energy function is given by \n\n\\[ V(x) = \\left\\{ \\begin{array}{cc} \\infty & \\text{if } x\\ge L\\\\ 0 & \\text{if } 0< x < L \\\\ \\infty & \\text{if } x \\le 0 \\end{array}\\right. \\] \n\n\n<img src=\"particle_in_a_box.png\" width=30%>\n\nNote: To solve this differential equation we set the potential energy to zero inside the box and rearrange Schrodinger's equation so it has the form \\(\\frac{-\\hbar^2}{2m} \\frac{d^2}{dx^2}\\psi(x) - E \\psi(x) = 0\\)."}
︠4654c6ef-100a-47f9-8e67-e454d4135722︠
psi,m,L=var('psi,m,L')  #Declare wave function, mass, and box length as variables

Ener=var('Ener',latex_name=r'\mathcal{E}')  #Declare Ener as energy variable but will display a script E when using show() and pretty_print
hbar=var('hbar',latex_name=r'\hbar')  #Declares hbar as a variable and displays hbar symbol when using show() and pretty_print

assume(Ener,'real')   #Assume the variable Ener (the energy) only takes real values...
assume(Ener>0)   #... and assume the energy is greater than zero.  These are needed for desolve()

assume(m,'real')   #Assume the mass is real...
assume(m>0)     #... and positive.  If you don't make these assumptions you will get an error message asking if these variables are positive, negative, or zero

psi=function('psi')(x)   #To solve the differential equation we must tell SageMath that psi is a function called 'psi' with a single dependent variable


def f(psi):  #Define the equation to solve.
    return -hbar^2/(2*m)*diff(psi,x,2)-Ener*psi   #This is the differential equation to be solved

general_soln = desolve(f(psi)==0,psi,ivar=x)


pretty_print('The general solution to Schrodinger\'s equation is $\psi(x)=$', general_soln)
︡257b3620-d357-4a4d-931e-1c8d562267a3︡{"html":"<div align='center'>The general solution to Schrodinger's equation is $\\psi(x)=$ $\\displaystyle K_{2} \\cos\\left(\\frac{\\sqrt{2} \\sqrt{{{\\mathcal{E}}}} \\sqrt{m} x}{{{\\hbar}}}\\right) + K_{1} \\sin\\left(\\frac{\\sqrt{2} \\sqrt{{{\\mathcal{E}}}} \\sqrt{m} x}{{{\\hbar}}}\\right)$</div>"}︡{"done":true}︡
︠8fcb2512-e879-4ed9-9281-de0c79399516i︠
%md

### Satisfying boundary conditions

The boundary conditions require that \(\psi(x,t)\) must be zero at the two walls.  In other words, \(\psi(x=0,t)=0\) and \(\psi(x=L,t)=0\).  Since \(\sin(0)=0\) and \(\cos(0)=1\), this means that \(K_2=0\).  The boundary condition at \(x=L\) says that \(K_1 \sin(\sqrt{2 \mathcal{E} m} x/\hbar) = 0\) which is true if the argument of \(\sin()\) is an integer multiple of \(\pi\).  Thus \(\frac{\sqrt{2 m \mathcal{E}}L}{\hbar} = n \pi\) for \(n = 1, 2, 3, ...\).  To be consistent with previous notation we will set \(A_0 = K_1\).  The wave function for the particle in a box is \[\psi(x,t) = A_0 \sin(\frac{n \pi x}{L}).\]
︡92a92db4-e0b6-4148-ba0e-cea084e3fcef︡{"done":true,"md":"\n### Satisfying boundary conditions\n\nThe boundary conditions require that \\(\\psi(x,t)\\) must be zero at the two walls.  In other words, \\(\\psi(x=0,t)=0\\) and \\(\\psi(x=L,t)=0\\).  Since \\(\\sin(0)=0\\) and \\(\\cos(0)=1\\), this means that \\(K_2=0\\).  The boundary condition at \\(x=L\\) says that \\(K_1 \\sin(\\sqrt{2 \\mathcal{E} m} x/\\hbar) = 0\\) which is true if the argument of \\(\\sin()\\) is an integer multiple of \\(\\pi\\).  Thus \\(\\frac{\\sqrt{2 m \\mathcal{E}}L}{\\hbar} = n \\pi\\) for \\(n = 1, 2, 3, ...\\).  To be consistent with previous notation we will set \\(A_0 = K_1\\).  The wave function for the particle in a box is \\[\\psi(x,t) = A_0 \\sin(\\frac{n \\pi x}{L}).\\]"}
︠7aa646b3-d723-4034-80dd-3f9149ccf63di︠
%md

# Integrating functions

- To integrate the function **f(x)** you can either use **f(x).integrate(x)** or **integrate(f(x),x)**.
- For a definite integral, instead of just specifying the integration variable **x** you should specify the variable *and* the limits **[x,0,L]**.
- Integrals frequently gives errors asking if a quantity is positive, negative, or zero.  Use **assume()** commands to resolve this question.



### Deterimine normalization constant

The integral of the probability density over some region of space gives the probability of finding the particle in that region.  If we integrate over all possible places the particle might be, the total probability has to be 1 ( which corresponds to 100%).  We can use this fact to find the normalization constant \(A_0\).  In other words, by requiring \(\int_0^L \psi^*(x,t) \psi(x,t) dx = 1\) we can solve for \(A_0\).
︡3f92b4f9-b76c-416e-bb90-37ac0ff9330d︡{"done":true,"md":"\n# Integrating functions\n\n- To integrate the function **f(x)** you can either use **f(x).integrate(x)** or **integrate(f(x),x)**.\n- For a definite integral, instead of just specifying the integration variable **x** you should specify the variable *and* the limits **[x,0,L]**.\n- Integrals frequently gives errors asking if a quantity is positive, negative, or zero.  Use **assume()** commands to resolve this question.\n\n\n\n### Deterimine normalization constant\n\nThe integral of the probability density over some region of space gives the probability of finding the particle in that region.  If we integrate over all possible places the particle might be, the total probability has to be 1 ( which corresponds to 100%).  We can use this fact to find the normalization constant \\(A_0\\).  In other words, by requiring \\(\\int_0^L \\psi^*(x,t) \\psi(x,t) dx = 1\\) we can solve for \\(A_0\\)."}
︠62cc62c9-470b-4a6c-b932-2974e36cd184s︠
A_0,n =var('A_0,n ')
assume(L,'real')  #Assume L is a real number
assume(L>0)  #Assume L is positive
assume(n,'integer')   #n must be an integer for a particle in an infinite square well - this is why we have quantization


psi_well(x,n)=A_0*sin(n*pi*x/L)   #Define the wave function

norm_int=integrate(psi_well*psi_well.conjugate(),[x,0,L])   #Integrate the probability density (psi* x psi) over the width of the well
pretty_print('The normalization integral gives ', norm_int)

answer=solve(norm_int==1,A_0)   #What value does A_0 need to have for a total probability of 1
pretty_print('The possible answers for $A_0$ are ', answer)

norm_const=answer[1].rhs()   #Select only the right hand side of the last term
pretty_print('We are only interested in the positive value  which is $A_0=$', norm_const)

psi_well(x,n)=psi_well(x,n).substitute(A_0=norm_const)  #Substitute our value for A_0 into the wave function
pretty_print('The equation for our wave function inside an infinite potential well is $\psi(x)=$', psi_well(x,n))


︡34ca9079-cff6-4f89-9f79-80f0043dc84d︡{"html":"<div align='center'>The normalization integral gives  $\\displaystyle n \\ {\\mapsto}\\ \\frac{1}{2} \\, A_{0}^{2} L$</div>"}︡{"html":"<div align='center'>The possible answers for $A_0$ are  [$\\displaystyle A_{0} = -\\frac{\\sqrt{2}}{\\sqrt{L}}$, $\\displaystyle A_{0} = \\frac{\\sqrt{2}}{\\sqrt{L}}$]</div>"}︡{"html":"<div align='center'>We are only interested in the positive value  which is $A_0=$ $\\displaystyle \\frac{\\sqrt{2}}{\\sqrt{L}}$</div>"}︡{"html":"<div align='center'>The equation for our wave function inside an infinite potential well is $\\psi(x)=$ $\\displaystyle \\frac{\\sqrt{2} \\sin\\left(\\frac{\\pi n x}{L}\\right)}{\\sqrt{L}}$</div>"}︡{"done":true}︡
︠21d60c0a-1c2f-4dd6-976d-eb62ac042a45i︠
%md

# More integration examples

### Check orthogonality of infinite square well solutions

The wave functions for differing values of $n$ should be orthogonal to one another.  This means that $\int_0^L \psi_n^*(x) \psi_m(x) dx = \delta_{mn}$

︡083c2266-5205-493c-8452-88e77e91a928︡{"done":true,"md":"\n# More integration examples\n\n### Check orthogonality of infinite square well solutions\n\nThe wave functions for differing values of $n$ should be orthogonal to one another.  This means that $\\int_0^L \\psi_n^*(x) \\psi_m(x) dx = \\delta_{mn}$"}
︠db0ca63e-bf18-44f6-9bf9-676d6751117ds︠
m=var('m')
assume(m,'integer')

probability_not_orthogonal=integrate(psi_well(x,n).conjugate()*psi_well(x,n),[x,0,L])  #Calculate for m=n
pretty_print(' If both wave functions have same n-value, then $\int_0^a\psi_n^*(x) \psi_n(x)dx$ = ', probability_not_orthogonal)


probability_orthogonal=integrate(psi_well(x,n).conjugate()*psi_well(x,m),[x,0,L])   #Calculate for m not equal to n
pretty_print(' If m is not equal to n, then $\int_0^a\psi_n^*(x) \psi_m(x)dx$ = ', probability_orthogonal)  #%todo: \ne or \neq not working
︡3ea8c491-591a-465e-82cf-6d5400bea040︡{"html":"<div align='center'> If both wave functions have same n-value, then $\\int_0^a\\psi_n^*(x) \\psi_n(x)dx$ =  $\\displaystyle 1$</div>"}︡{"html":"<div align='center'> If m is not equal to n, then $\\int_0^a\\psi_n^*(x) \\psi_m(x)dx$ =  $\\displaystyle 0$</div>"}︡{"done":true}︡
︠6d954126-750d-49c2-915f-963a2524d8f6i︠
%md

# 2D plots of functions

- To plot a function \(f(x)\) vs. \(x\) from \(x=0\) to \(x=2\), use **plot(f(x),[x,0,2])**
- You can change the color of the line plotted by setting the color argument (e.g. **color='black'**)
- Multiple graphs can be combined into a single plot window by adding the **plot()** commands together.
- Plots have various properties, such as line color, type of line, points plotted, titles, and axes labels that can be changed
- Use the **show()** command to display a plot
- When plotting functions with unspecified variables, set all variables to 1 using **.substitute()**.

### Plot wave function and probabilty density

The following commands demonstrate how to plot the wave function and probability densities for the first three lowest energy states of the 1D particle-in-a-box.

Since the potential energy (and thus the Hamiltonian) is symmetric about the center of the well (about the point \(x=L/2\)), the wave functions will either be symmetric or antisymmetric about \(x=L/2\).  Since we haven't specified the length of the box we will set \(L=1\) for purposes of plotting.
︡64bf332f-1019-414f-b686-9961c6b7e605︡{"done":true,"md":"\n# 2D plots of functions\n\n- To plot a function \\(f(x)\\) vs. \\(x\\) from \\(x=0\\) to \\(x=2\\), use **plot(f(x),[x,0,2])**\n- You can change the color of the line plotted by setting the color argument (e.g. **color='black'**)\n- Multiple graphs can be combined into a single plot window by adding the **plot()** commands together.\n- Plots have various properties, such as line color, type of line, points plotted, titles, and axes labels that can be changed\n- Use the **show()** command to display a plot\n- When plotting functions with unspecified variables, set all variables to 1 using **.substitute()**.\n\n### Plot wave function and probabilty density\n\nThe following commands demonstrate how to plot the wave function and probability densities for the first three lowest energy states of the 1D particle-in-a-box.\n\nSince the potential energy (and thus the Hamiltonian) is symmetric about the center of the well (about the point \\(x=L/2\\)), the wave functions will either be symmetric or antisymmetric about \\(x=L/2\\).  Since we haven't specified the length of the box we will set \\(L=1\\) for purposes of plotting."}
︠0ccb04e3-c4b2-4eb0-b7ac-bb3da54ce9a4︠
psi_well_1(x)=psi_well(x,1).substitute(L=1)  #n = 1 ground state with L=1
psi_well_2(x)=psi_well(x,2).substitute(L=1)  #n = 2 first excited state with L=1
psi_well_3(x)=psi_well(x,3).substitute(L=1)  #n=3 second excited state with L=1

#The following three lines create plots of psi vs x
P1=plot(psi_well_1(x),[x,0,1],color='red',legend_label='n=1 State',title='First three wave functions of infinite well',axes_labels=['Position x','$\psi(x)$'])
P2=plot(psi_well_2(x),[x,0,1],color='blue',legend_label='n=2 State')
P3=plot(psi_well_3(x),[x,0,1],color='green',legend_label='n=3 State')


P=P1+P2+P3  #Combine graphs of first three states into a single object called 'P'...
P.show()  #... and display P on the screen

#The following three lines create plots of the probability density (psi*)psi vs x
P4=plot(psi_well_1(x)*psi_well_1(x).conjugate(),[x,0,1],color='red',legend_label='n=1 State',title='Probability density of first three states of infinite well',axes_labels=['Position x','|$\psi(x)|^2$'])
P5=plot(psi_well_2(x)*psi_well_2(x).conjugate(),[x,0,1],color='blue',legend_label='n=2 State')
P6=plot(psi_well_3(x)*psi_well_3(x).conjugate(),[x,0,1],color='green',legend_label='n=3 State')


PB=P4+P5+P6 #Combine the three graphs of probability density...
PB.show()   #...and show them on the screen



︡b59c8100-f150-4e68-8d0d-7a575c2d1173︡{"file":{"filename":"/projects/d18eeda9-38fb-4d20-9a0a-4afa03a182aa/.sage/temp/compute4-us/3913/tmp_zEkT6g.svg","show":true,"text":null,"uuid":"321bd832-c7cd-44d5-bfe5-7736772dec43"},"once":false}︡{"html":"<div align='center'></div>"}︡{"file":{"filename":"/projects/d18eeda9-38fb-4d20-9a0a-4afa03a182aa/.sage/temp/compute4-us/3913/tmp_pmmTIK.svg","show":true,"text":null,"uuid":"00603b02-21f4-40ae-9344-0b02d67e05c0"},"once":false}︡{"html":"<div align='center'></div>"}︡{"done":true}︡
︠ab94a558-e3d6-4d1a-acf8-6b00d090c222i︠
%md

# For you to try:

How does the number of peaks of the wave function compare to the value of n?
How does the number of nodes of the wave function compare to the value of n?
To help answer this question, plot the wave functions for the n=4 and n=5 states and see if they agree with your answer to these two questions.  You can use psi_well(x,n) to define your wave functions.
︡4e927367-fc40-4cc0-ae34-12c4c228c5e6︡{"done":true,"md":"\n# For you to try:\n\nHow does the number of peaks of the wave function compare to the value of n?\nHow does the number of nodes of the wave function compare to the value of n?\nTo help answer this question, plot the wave functions for the n=4 and n=5 states and see if they agree with your answer to these two questions.  You can use psi_well(x,n) to define your wave functions."}
︠da644ed7-2c43-443b-ae70-9421f8b9a9b4︠
#Insert your work here


︡5a50a6be-e836-46db-8fd4-88aa5f7abcb9︡
︠2024822d-f189-4ba0-8883-1fb43c2801b6i︠
%md

# Another example of integration
- SageMath will leave answers in exact form (e.g. 1/4 or pi) so to get numerical approximations you must use **.n()**
- You can specify how many digits are returned using **.n(digits=3)**

### Probabilities to find the particle

The probability to find a particle between \(x=a\) and \(x=b\) is found by integrating the probability density over the region: \[\int_a^b \psi^*(x) \psi(x) dx \]

What is the probability to find the particle somewhere in the box?


What is the probability of finding the particle in the left half of the box (between $x=0$ and $x=L/2$)?


What is the probability of finding the particle in the left quarter of the box (between $x=0$ and $x=L/4$)?
︡d4182c6a-06c9-40b5-a757-961a75c5b370︡{"done":true,"md":"\n# Another example of integration \n- SageMath will leave answers in exact form (e.g. 1/4 or pi) so to get numerical approximations you must use **.n()**\n- You can specify how many digits are returned using **.n(digits=3)**\n\n### Probabilities to find the particle\n\nThe probability to find a particle between \\(x=a\\) and \\(x=b\\) is found by integrating the probability density over the region: \\[\\int_a^b \\psi^*(x) \\psi(x) dx \\]\n\nWhat is the probability to find the particle somewhere in the box?\n\n\nWhat is the probability of finding the particle in the left half of the box (between $x=0$ and $x=L/2$)?\n\n\nWhat is the probability of finding the particle in the left quarter of the box (between $x=0$ and $x=L/4$)?"}
︠589c7daf-ae4c-4a77-8890-834716f81e88s︠
probability_somewhere=integrate(psi_well(x,1).conjugate()*psi_well(x,1),[x,0,L])

pretty_print("The probablity to find the particle somewhere is ", probability_somewhere)

probability_left_half=integrate(psi_well(x,1).conjugate()*psi_well(x,1),[x,0,L/2])

pretty_print("The probability to find the particle in the left half of the box between $x=0$ and $x=L/2$ is ", probability_left_half)

probability_left_quarter=integrate(psi_well(x,1).conjugate()*psi_well(x,1),[x,0,L/4])

pretty_print("The probability to find the particle in the left quarter of the box between $x=0$ and $x=L/4$ is ", probability_left_quarter, " = ", probability_left_quarter.n(digits=2) )

︡6b758afd-2217-4949-9508-c0a5a5bfcc20︡{"html":"<div align='center'>The probablity to find the particle somewhere is  $\\displaystyle 1$</div>"}︡{"html":"<div align='center'>The probability to find the particle in the left half of the box between $x=0$ and $x=L/2$ is  $\\displaystyle \\frac{1}{2}$</div>"}︡{"html":"<div align='center'>The probability to find the particle in the left quarter of the box between $x=0$ and $x=L/4$ is  $\\displaystyle \\frac{\\pi - 2}{4 \\, \\pi}$  =  $\\displaystyle 0.091$</div>"}︡{"done":true}︡
︠952e2590-4b11-4073-9e75-f31fc11b6da5i︠
%md

# For you to try:

How do you think these three probabilities would differ for the $n=2$ state?

Calculate the probability for the particle to be somewhere inside the well, in the left half of the well, and in the left quarter of the well for the $n=2$ state.  Compare these results to the answers for the $n=1$ state.
︡f704331f-c7c5-475d-b6f7-db990f82ccbf︡{"done":true,"md":"\n# For you to try:\n\nHow do you think these three probabilities would differ for the $n=2$ state?\n\nCalculate the probability for the particle to be somewhere inside the well, in the left half of the well, and in the left quarter of the well for the $n=2$ state.  Compare these results to the answers for the $n=1$ state."}
︠1f5639e2-156b-422b-9120-6ffa731f693b︠
#Insert your work here

︡4bb6883c-a963-483a-b6c8-d086a6a6f042︡
︠0d9271fc-999f-4f33-9ba4-b8df90acb961i︠
%md

# Expanding symbolic answers and obtaining numerical results

### Calculating expectation values

What is the expected value of the position of the particle $<x>$?
︡4c19e85d-2194-4e7a-9012-5570bdf36307︡{"done":true,"md":"\n# Expanding symbolic answers and obtaining numerical results\n\n### Calculating expectation values\n\nWhat is the expected value of the position of the particle $<x>$?"}
︠914d2d81-c755-4eb8-8b25-8eb70f5d123b︠

x_exp=integrate(psi_well(x,1).conjugate()*x*psi_well(x,1),[x,0,L]);x_exp  #Expecatation value of position <x>

x_exp.expand()  #Simplify the result by multiplying terms together

x_numeric=x_exp.substitute(L=1E-9)   #Set size of box to 1 nm
x_numeric.n()   #Force SageMath to compute numerical result
x_numeric.n(digits=3)   #You can specify the number of significant figures
pi.n(digits=7)   #Pi to seven places

def P(f):   #Definition of momentum operator
    return -i*hbar*diff(f,x)


p_exp=integrate(psi_well(x,1).conjugate()*P(psi_well(x,1)),[x,0,L])  #Expectation value of momentum <p>
p_exp

K_exp=integrate(psi_well(x,1).conjugate()*P(P(psi_well(x,1)))/(2*m),[x,0,L])  #Expectation value of kinetic energy <K>=<p^2>/2m
K_exp.show()


︡cbb6a2ec-66d3-40fa-9160-e5e9d9c0a3f3︡{"stdout":"1/4*((2*pi^2 - 1)*L^2/pi^2 + L^2/pi^2)/L\n"}︡{"stdout":"1/2*L\n"}︡{"stdout":"5.00000000000000e-10\n"}︡{"stdout":"5.00e-10\n"}︡{"stdout":"3.141593\n"}︡{"stdout":"0\n"}︡{"html":"<div align='center'>$\\displaystyle \\frac{\\pi^{2} {{\\hbar}}^{2}}{2 \\, L^{2} m}$</div>"}︡{"done":true}︡
︠9e1c63cb-a83f-453a-97cb-a36c7becf22di︠
%md

### Time-dependent behavior of the wave function and probability densities
︡635b0b5c-3284-4f43-834e-39b483917b1a︡{"done":true,"md":"\n### Time-dependent behavior of the wave function and probability densities"}
︠01a6f691-190c-4e99-b4f1-f77968d0114a︠
psi_plot_1(x,t)=psi_well_1(x)*e^(i*pi^2/2*t)


plot_graph = [plot(psi_plot_1(x,t).real(),[x,0,1],color='red',ymin=-1.5,ymax=1.5) for t in sxrange(0,2,.1)]
a=animate(plot_graph)
a.show()
︡83e86618-a7b3-429c-9090-0743f812cd70︡{"file":{"filename":"/projects/d18eeda9-38fb-4d20-9a0a-4afa03a182aa/.sage/temp/compute4-us/3913/tmp_S79UYR.webm","show":true,"text":null,"url":"/d18eeda9-38fb-4d20-9a0a-4afa03a182aa/raw/.sage/temp/compute4-us/3913/tmp_S79UYR.webm"},"once":false}︡{"html":"<div align='center'></div>"}︡{"done":true}︡
︠e6425a97-3598-4dc9-a82f-52e1fa2aec00s︠
plot_graph_b = [plot(real(psi_plot_1(x,t)*psi_plot_1(x,t).conjugate()),[x,0,1],color='red',ymin=-2,ymax=2) for t in sxrange(0,2,.1)]
b=animate(plot_graph_b)
b.show()
︡7b1c9495-d981-4c6a-a21c-06b23a1139c6︡{"file":{"filename":"/projects/d18eeda9-38fb-4d20-9a0a-4afa03a182aa/.sage/temp/compute4-us/3295/tmp_J2sSMR.webm","show":true,"text":null,"url":"/d18eeda9-38fb-4d20-9a0a-4afa03a182aa/raw/.sage/temp/compute4-us/3295/tmp_J2sSMR.webm"},"once":false}︡{"html":"<div align='center'></div>"}︡{"done":true}︡
︠475dea4b-1272-40ef-8132-d1a2f817b7e4i︠
%md

# For you to try:

Why does the wave function oscillate but the probability density does not?  (Hint: the probability density involves multiplying the wave function by its complex conjugate)

Plot the wave function and probability density for the n=2 state and see if it displays the same behavior.


︡d2aac032-01dc-46bf-9c42-275304d8de48︡{"done":true,"md":"\n# For you to try:\n\nWhy does the wave function oscillate but the probability density does not?  (Hint: the probability density involves multiplying the wave function by its complex conjugate)\n\nPlot the wave function and probability density for the n=2 state and see if it displays the same behavior."}
︠7b0e0f23-16af-4056-87dc-9fc2a34f9f87︠
#Insert your work here

︡d3bb9a6c-15f6-44c1-bd24-efe9eae2aba4︡
︠3a6965d2-fbd7-4556-afb6-b2f934efe8e3i︠
%md

### Animate plot of superposition of two states
︡3d40a93f-04fb-4f2b-a290-6ab1e2166448︡{"done":true,"md":"\n### Animate plot of superposition of two states"}
︠5c9326c7-1946-46da-a47f-7a0746ee64a0︠
psi_super(x,t)=psi_well_1(x)*e^(i*pi^2/2*t)+psi_well_2(x)*e^(i*4*pi^2/2*t)

plot_graph_c = [plot(psi_super(x,t).real(),[x,0,1],color='red',ymin=-2.5,ymax=2.5) for t in sxrange(0,2,.1)]
c=animate(plot_graph_c)
c.show()
︡80315d6a-f67c-46ad-b1fb-255c6eb8e806︡{"file":{"filename":"/projects/d18eeda9-38fb-4d20-9a0a-4afa03a182aa/.sage/temp/compute4-us/3295/tmp_xY0oYz.webm","show":true,"text":null,"url":"/d18eeda9-38fb-4d20-9a0a-4afa03a182aa/raw/.sage/temp/compute4-us/3295/tmp_xY0oYz.webm"},"once":false}︡{"html":"<div align='center'></div>"}︡{"done":true}︡
︠d8aa3780-858c-4518-80c2-4fddebcde169︠

plot_graph_d = [plot(real(psi_super(x,t)*psi_super(x,t).conjugate()),[x,0,1],color='red',ymin=0,ymax=6.5) for t in sxrange(0,2,.1)]
d=animate(plot_graph_d)
d.show()
︡71b65f79-08de-4ac7-ab43-88db756e04d1︡{"file":{"filename":"/projects/d18eeda9-38fb-4d20-9a0a-4afa03a182aa/.sage/temp/compute4-us/3295/tmp_7pRen8.webm","show":true,"text":null,"url":"/d18eeda9-38fb-4d20-9a0a-4afa03a182aa/raw/.sage/temp/compute4-us/3295/tmp_7pRen8.webm"},"once":false}︡{"html":"<div align='center'></div>"}︡{"done":true}︡
︠80e87ed7-d414-4cf6-ac6f-b3da4e2f46eci︠
%md

# For you to try:

Why does the probability density of the superposition state vary with time while the pure n=1 and n=2 states do not vary (Hint: The time dependence of the wave function is contained in the term \(e^{iE_n t/\hbar}\).  What happens to this time dependence when you calculate \(\psi^* \psi\) for the pure n=1 state or n=2 state? )

Plot the real part of a superposition of the n=1 and n=3 states $\psi_{super}(x,t)=\psi_{n=1}(x,t)+\psi_{n=3}(x,t)$.  Remember that the time dependency is $e^{iE_n t/\hbar}$ where $E_n=\frac{n^2\pi^2\hbar^2}{2mL^2}$ where we have assumed $\hbar=1$, $m=1$, and $L=1$ for plotting purposes.
︡1cfc457b-da92-48ae-9a51-10a4877c2f6a︡{"done":true,"md":"\n# For you to try:\n\nWhy does the probability density of the superposition state vary with time while the pure n=1 and n=2 states do not vary (Hint: The time dependence of the wave function is contained in the term \\(e^{iE_n t/\\hbar}\\).  What happens to this time dependence when you calculate \\(\\psi^* \\psi\\) for the pure n=1 state or n=2 state? )\n\nPlot the real part of a superposition of the n=1 and n=3 states $\\psi_{super}(x,t)=\\psi_{n=1}(x,t)+\\psi_{n=3}(x,t)$.  Remember that the time dependency is $e^{iE_n t/\\hbar}$ where $E_n=\\frac{n^2\\pi^2\\hbar^2}{2mL^2}$ where we have assumed $\\hbar=1$, $m=1$, and $L=1$ for plotting purposes."}
︠b694ec92-10e7-4031-bf82-cf938253b070︠
#Insert your work here
︡7b320d24-e685-4ed8-b7e6-0714dfdf6e37︡
︠9bb4166e-f979-460c-8aae-377361e618b2i︠
%md
# Project Ideas and Problems to Solve
︡f8ec682e-9786-4da3-824c-f60b07353526︡{"done":true,"md":"# Project Ideas and Problems to Solve"}
︠fa372037-752b-4a7e-b9a5-5169513575b0s︠
assume(x>0)
assume(m>0)
expr = sqrt(2) * sqrt(x) * sqrt(m)
expr.canonicalize_radical()
maxima_methods().rootscontract(expr)
maxima.radcan(expr,radexpand=false)
︡231acb3e-a009-41a2-adc8-d91aaeb8e52b︡{"stdout":"sqrt(2)*sqrt(m)*sqrt(x)"}︡{"stdout":"\n"}︡{"stderr":"Error in lines 5-5\nTraceback (most recent call last):\n  File \"/projects/sage/sage-6.10/local/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 947, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\nNameError: name 'maxima_methods' is not defined\n"}︡{"done":true}︡
︠de61fd7d-3903-4558-927a-feede2b403c9︠










