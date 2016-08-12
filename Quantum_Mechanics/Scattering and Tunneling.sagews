︠4c8f9a94-0eec-4c33-8e3a-7ab7df3f6ecbi︠
%md

## Note: Hit `Restart` between cases


I've reused variable names for each case and failure to restart can cause results from a previous problem to cause issues with later solutions.

The three cases I've looked at are:
- Wave function hitting a step potential with $E<V_0$
- Wave function hitting a step potential with $E>V_0$
- Wave function hitting a barrier potential with $E<V_0$

︡d2791d09-74b4-4485-bb1c-b8e98a4bea4d︡{"done":true,"md":"\n## Note: Hit `Restart` between cases\n\n\nI've reused variable names for each case and failure to restart can cause results from a previous problem to cause issues with later solutions.\n\nThe three cases I've looked at are:\n- Wave function hitting a step potential with $E<V_0$\n- Wave function hitting a step potential with $E>V_0$\n- Wave function hitting a barrier potential with $E<V_0$"}
︠0e0a2086-b915-4ca9-82a8-5cb74c005915︠
%md

### Unbound States - Scattering and Tunneling


Solving the Schrodinger equation for unbound states is good practice for students in devloping an understanding of the wave function.  It also gives students their first glimpse of quantum tunneling.  This worksheet walks you through how to set up and solve the boundary conditions for the wave function and how to plot the graphs to gain deeper understanding.

The first case is a step potential with particle energy lower than the step potential height ($E < V_0$)

<img src="tunneling_fig1.png" width="400">

To solve this problem we assume a different wave function in each region but require that (1) the wave functions be continuous at the boundary and (2) the derivatives of the wave functions be continuous at the boundary.  The two wave functions are:

\[\psi_I(x) = A e^{ik_1 x} + B e^{-ik_1 x}\]

and

\[\psi_{II}(x) = C e^{k_2 x} + D e^{-k_2 x}.\]

The wave function must remain finite for all values of $x$, which means that the first term in $\psi_{II}(x)$ must be zero (i.e. $C=0$)

The boundary conditions require:

\[\psi_I(0) = \psi_{II}(0)\]

and

\[\frac{d \psi_I(x)}{dx}_{x=0} = \frac{d \psi_{II}(x)}{dx}_{x=0} .\]


These equations are solved long-hand to demonstrate some of the symbolic manipulation functions of SageMath

- `.expand()`  Distributes and multiplies out all terms
- `.combine()`  Collect terms over a common denominator
- `.full_simplify()`  Runs numerous simplification routines

Assuming the particles are incident form the left, the coefficient $A$ is associated with the density of incoming particles.  The reflection coefficient $R$, which is the probability that a particle is reflected, can be found from the ratio of incoming to returning particles.

\[R=\frac{BB^*}{AA^*} = \left| \frac{B}{A} \right|^2 \]

As expected, in this case we find that the reflection probability is $1$, which means 100\% of the particles are reflected back.  However, the particles do penetrate into the classically forbidden region.

︡b2fad5a3-3494-4e3b-8e65-1b576af49774︡{"done":true,"md":"\n### Unbound States - Scattering and Tunneling\n\n\nSolving the Schrodinger equation for unbound states is good practice for students in devloping an understanding of the wave function.  It also gives students their first glimpse of quantum tunneling.  This worksheet walks you through how to set up and solve the boundary conditions for the wave function and how to plot the graphs to gain deeper understanding.\n\nThe first case is a step potential with particle energy lower than the step potential height ($E < V_0$)\n\n<img src=\"tunneling_fig1.png\" width=\"400\">\n\nTo solve this problem we assume a different wave function in each region but require that (1) the wave functions be continuous at the boundary and (2) the derivatives of the wave functions be continuous at the boundary.  The two wave functions are:\n\n\\[\\psi_I(x) = A e^{ik_1 x} + B e^{-ik_1 x}\\] \n\nand\n\n\\[\\psi_{II}(x) = C e^{k_2 x} + D e^{-ik_2 x}.\\] \n\nThe wave function must remain finite for all values of $x$, which means that the first term in $\\psi_{II}(x)$ must be zero (i.e. $C=0$)\n\nThe boundary conditions require:\n\n\\[\\psi_I(0) = \\psi_{II}(0)\\] \n\nand\n\n\\[\\frac{d \\psi_I(x)}{dx}_{x=0} = \\frac{d \\psi_{II}(x)}{dx}_{x=0} .\\] \n\n\nThese equations are solved long-hand to demonstrate some of the symbolic manipulation functions of SageMath\n\n- `.expand()`  Distributes and multiplies out all terms\n- `.combine()`  Collect terms over a common denominator\n- `.full_simplify()`  Runs numerous simplification routines\n\nAssuming the particles are incident form the left, the coefficient $A$ is associated with the density of incoming particles.  The reflection coefficient $R$, which is the probability that a particle is reflected, can be found from the ratio of incoming to returning particles.\n\n\\[R=\\frac{BB^*}{AA^*} = \\left| \\frac{B}{A} \\right|^2 \\] \n\nAs expected, in this case we find that the reflection probability is $1$, which means 100\\% of the particles are reflected back.  However, the particles do penetrate into the classically forbidden region."}
︠1654fed0-bc5e-4743-b935-b56fa4a7f55fs︠

#Step potential with E<V_0
A,B,C,D,m,E,V_0,k_1,k_2=var('A,B,C,D,m,E,V_0,k_1,k_2')


C=0   #Wave must decay as x->+oo (positive infinity) which means C must be zero

psi_1(x)=A*e^(i*k_1*x) + B*e^(-i*k_1*x)
psi_2(x)=C*e^(k_2*x) + D*e^(-k_2*x)

psi_1(x).show()
psi_2(x).show()



#Continuity of w.f.
eqn1 = psi_2(0)==psi_1(0)
show(eqn1)

#Continuity of derivative of w.f.
eqn2 = diff(psi_1(x),x)==diff(psi_2(x),x)

eqn2A=eqn2.substitute(x=0)
show(eqn2A)

#Solve equations (long-hand solution)
eqn2B=eqn2A.substitute(D=A+B).expand()
show(eqn2B)

B_ans1=solve(eqn2B,B)[0]
show(B_ans1)
B_ans2=B_ans1.divide_both_sides(A).expand()
show(B_ans2)
eqn3=B_ans2.lhs()==B_ans2.rhs().combine()


show(eqn3)
R=(eqn3.rhs()*conjugate(eqn3.rhs())).expand().full_simplify()
pretty_print(r'The probabilty of a particle being reflected is $R =  \frac{BB^*}{AA^*}  = $', R)






︡37c30ae4-ffb9-4128-ba2d-c735850f9a14︡{"html":"<div align='center'>$\\displaystyle A e^{\\left(i \\, k_{1} x\\right)} + B e^{\\left(-i \\, k_{1} x\\right)}$</div>"}︡{"html":"<div align='center'>$\\displaystyle D e^{\\left(-k_{2} x\\right)}$</div>"}︡{"html":"<div align='center'>$\\displaystyle D = A + B$</div>"}︡{"html":"<div align='center'>$\\displaystyle i \\, A k_{1} - i \\, B k_{1} = -D k_{2}$</div>"}︡{"html":"<div align='center'>$\\displaystyle i \\, A k_{1} - i \\, B k_{1} = -A k_{2} - B k_{2}$</div>"}︡{"html":"<div align='center'>$\\displaystyle B = \\frac{A {\\left(-i \\, k_{1} - k_{2}\\right)}}{-i \\, k_{1} + k_{2}}$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\frac{B}{A} = -\\frac{i \\, k_{1}}{-i \\, k_{1} + k_{2}} - \\frac{k_{2}}{-i \\, k_{1} + k_{2}}$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\frac{B}{A} = \\frac{-i \\, k_{1} - k_{2}}{-i \\, k_{1} + k_{2}}$</div>"}︡{"html":"<div align='center'>The probabilty of a particle being reflected is $R =  \\frac{BB^*}{AA^*}  = $ $\\displaystyle 1$</div>"}︡{"done":true}︡
︠d0cfa9e9-b628-425f-9617-7aff16699355i︠
%md

### Plotting the wave function for the step potential

- The step occurs at $x=0$
- The red part of the wave function shows where the particle tunnels into the step, which is classically forbidden

To animate the plot we add in the time dependence $e^{i\omega t}$ with $\omega =1$ for simplicity.
︡6c7c1aa2-d39e-4cda-b57d-686fa208d71d︡{"done":true,"md":"\n### Plotting the wave function for the step potential\n\n- The step occurs at $x=0$\n- The red part of the wave function shows where the particle tunnels into the step, which is classically forbidden\n\nTo animate the plot we add in the time dependence $e^{i\\omega t}$ with $\\omega =1$ for simplicity."}
︠2d030d40-2a9f-4bf5-9ef1-f61d55e6a2b0s︠
#Plot real part of w.f. for k_2=0.5*k_1 and A=1

wf1(x)=psi_1(x).substitute(B=B_ans2.rhs(),A=1).substitute(k_1=1,k_2=0.5)


wf2(x)=psi_2(x).substitute(D=1+B_ans2.rhs(),A=1).substitute(k_1=1,k_2=0.5)


omega=1  #Set angular frequency to a nice easy number for animated plot

wf1_real(x,t)=real(wf1(x)*e^(i*omega*t))  #Add in time-dependent term and take real part
P=plot(wf1_real(x,0),[x,-20,0], title='Wave function at a step potential',axes_labels=['Position x','$\psi(x$)'],axes_labels_size=1,title_pos=[.8,1])

wf2_real(x,t)=real(wf2(x)*e^(i*omega*t)) #Add in time-dependent term and take real part
P+=plot(wf2_real(x,0),[x,0,20],color='red')

P.show()

︡3417f90e-bf65-455d-a71d-cc8d5fd22795︡{"file":{"filename":"/projects/d18eeda9-38fb-4d20-9a0a-4afa03a182aa/.sage/temp/compute4-us/10843/tmp_nkkQTn.svg","show":true,"text":null,"uuid":"a8f95275-6cdf-4126-a705-e4223d519b1f"},"once":false}︡{"html":"<div align='center'></div>"}︡{"done":true}︡
︠1adc8923-2253-4652-8e79-d1573b61af8di︠
%md

### Animated plot of wave function

The following code creates an animation of the real part of the wavefunction to show how it changes in time.


︡52e1d833-5127-422a-a876-3e6892c464e4︡{"done":true,"md":"\n### Animated plot of wave function\n\nThe following code creates an animation of the real part of the wavefunction to show how it changes in time."}
︠d2b317ea-9799-47a7-bc57-cf58c43940d4︠
#Create animated plot of real part of w.f.
times = sxrange(0,10,0.5)     #Create a list of the times for evaluation.  sxrange() creates a list of numbers from 0 to 10 in steps of 0.5
plot_graph = []   #Create an empty list to store the plotted graphs at different times

for t in times:    #Loop through all times
    new_plot=plot(wf1_real(x,t),x,-20,0,ymin=-2.2,ymax=2.2)   #Create plot at time t for each value of t
    new_plot+=plot(wf2_real(x,t),x,0,10,color='red',ymin=-2.2,ymax=2.2)
    plot_graph.append(new_plot)    #Add the new plot to the list of images

a=animate(plot_graph)    #Combine all plots contained in plot_graph into an animation
a.show()  #Show the animation
︡9218fe91-f132-4a05-afea-db3c9d1fcc2b︡{"file":{"filename":"/projects/d18eeda9-38fb-4d20-9a0a-4afa03a182aa/.sage/temp/compute4-us/22519/tmp_M2coeq.webm","show":true,"text":null,"url":"/d18eeda9-38fb-4d20-9a0a-4afa03a182aa/raw/.sage/temp/compute4-us/22519/tmp_M2coeq.webm"},"once":false}︡{"html":"<div align='center'></div>"}︡{"done":true}︡
︠430b53f4-567d-45df-b696-b6fa76acaf3di︠
%md

## For You To Try:
- Plot the imaginary part of the wave function and animate it.
    - How does this graph differ from the real part?
- Plot the probability density of the wave function
︡b20d8a97-2b86-4ab7-b7b8-c8b0875adc95︡{"done":true,"md":"\n## For You To Try:\n- Plot the imaginary part of the wave function and animate it.\n    - How does this graph differ from the real part?\n- Plot the probability density of the wave function"}
︠d034682f-3dc0-4b99-ad5f-a63284947fc2︠
%md

### Step Potential: $E>V_0$

For this next example we will find the wave function for a particle incident on a step potential with the particle energy larger than the step height.

<img src="tunneling_fig2.png" width="400">

We expect that the particle reflection coefficient is no longer 100\% in this case but classically we might not expect to see _any_ reflection, but the graph at the bottom of the next cell shows that the reflection probability varies as a function of the energy difference between the particle and step potential.

The setup is the same as for the $E<V_0$ case except the wave function in region II is complex (and thus oscillatory).

The two wave functions are:

\[\psi_I(x) = A e^{ik_1 x} + B e^{-ik_1 x}\]

and

\[\psi_{II}(x) = C e^{ik_2 x} + D e^{-ik_2 x}.\]

If we assume there is no particles entering from the right then we must have $D=0$.

The boundary conditions require:

\[\psi_I(0) = \psi_{II}(0)\]

and

\[\frac{d \psi_I(x)}{dx}_{x=0} = \frac{d \psi_{II}(x)}{dx}_{x=0} .\]

The function for the reflection probability $R$ and the transmission probability $T$ are plotted at the bottom of the next cell.


︡d345f0be-a4ca-4476-935d-5f7b18e0d3ca︡{"done":true,"md":"\n### Step Potential: $E>V_0$\n\nFor this next example we will find the wave function for a particle incident on a step potential with the particle energy larger than the step height.\n\n<img src=\"tunneling_fig2.png\" width=\"400\">\n\nWe expect that the particle reflection coefficient is no longer 100\\% in this case but classically we might not expect to see _any_ reflection, but the graph at the bottom of the next cell shows that the reflection probability varies as a function of the energy difference between the particle and step potential.\n\nThe setup is the same as for the $E<V_0$ case except the wave function in region II is complex (and thus oscillatory).\n\nThe two wave functions are:\n\n\\[\\psi_I(x) = A e^{ik_1 x} + B e^{-ik_1 x}\\] \n\nand\n\n\\[\\psi_{II}(x) = C e^{ik_2 x} + D e^{-ik_2 x}.\\] \n\nIf we assume there is no particles entering from the right then we must have $D=0$.\n\nThe boundary conditions require:\n\n\\[\\psi_I(0) = \\psi_{II}(0)\\] \n\nand\n\n\\[\\frac{d \\psi_I(x)}{dx}_{x=0} = \\frac{d \\psi_{II}(x)}{dx}_{x=0} .\\] \n\nThe function for the reflection probability $R$ and the transmission probability $T$ are plotted at the bottom of the next cell."}
︠3c908c5a-8d97-4f09-b19b-05f1590eedfcs︠
#Step potential with E>V_0
A,B,C,D,m,E,V_0,k_1,k_2=var('A,B,C,D,m,E,V_0,k_1,k_2')
Ener=var('Ener',latex_name=r'\mathcal{E}')  #Declare Ener as energy variable but will display a script E when using show() and pretty_print
hbar=var('hbar',latex_name=r'\hbar')  #Declares hbar as a variable and displays hbar symbol when using show() and pretty_print
assume(k_1,'real')
assume(k_2,'real')

D=0

psi_3(x)=A*e^(i*k_1*x) + B*e^(-i*k_1*x)
psi_4(x)=C*e^(i*k_2*x) + D*e^(-i*k_2*x)

psi_3(x).show()
psi_4(x).show()


#Continuity of w.f.
eqn1 = psi_3(0)==psi_4(0)
show(eqn1)

#Continuity of derivative of w.f.
eqn2 = diff(psi_3(x),x)==diff(psi_4(x),x)

eqn2A=eqn2.substitute(x=0)
show(eqn2A)


#Solve equations (long-hand solution)
eqn2B=eqn2A.substitute(C=A+B).expand()
show(eqn2B)

B_ans1=solve(eqn2B,B)[0]
show(B_ans1)
B_ans2=B_ans1.divide_both_sides(A).expand()
show(B_ans2)
eqn3=B_ans2.lhs()==B_ans2.rhs().combine()


show(eqn3)
R=(eqn3.rhs()*conjugate(eqn3.rhs())).expand().full_simplify()
show(R)
R_plot=R.substitute(k_1=1)

P=plot(R_plot,[k_2,0,1],title='Reflection and Transmission Probability',axes_labels=['$k_2$ as a fraction of $k_1$', 'Probability'],legend_label='Reflection Probability',axes_labels_size=1)
#P.show()

eqn4=eqn1.divide_both_sides(A).expand()
show(eqn4)

eqn5=eqn4.substitute(B=A*B_ans2.rhs().combine())
eqn5.show()

#Find T and R
T=(1-R).full_simplify()
T.show()

T_plot=T.substitute(k_1=1)
T_plot.show()

P+=plot(T_plot,[k_2,0,1],color='red',legend_label='Transmission Probability')
P.show()
︡47ccd814-8899-4692-be8b-84c51e231cf1︡{"html":"<div align='center'>$\\displaystyle A e^{\\left(i \\, k_{1} x\\right)} + B e^{\\left(-i \\, k_{1} x\\right)}$</div>"}︡{"html":"<div align='center'>$\\displaystyle C e^{\\left(i \\, k_{2} x\\right)}$</div>"}︡{"html":"<div align='center'>$\\displaystyle A + B = C$</div>"}︡{"html":"<div align='center'>$\\displaystyle i \\, A k_{1} - i \\, B k_{1} = i \\, C k_{2}$</div>"}︡{"html":"<div align='center'>$\\displaystyle i \\, A k_{1} - i \\, B k_{1} = i \\, A k_{2} + i \\, B k_{2}$</div>"}︡{"html":"<div align='center'>$\\displaystyle B = \\frac{A {\\left(k_{1} - k_{2}\\right)}}{k_{1} + k_{2}}$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\frac{B}{A} = \\frac{k_{1}}{k_{1} + k_{2}} - \\frac{k_{2}}{k_{1} + k_{2}}$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\frac{B}{A} = \\frac{k_{1} - k_{2}}{k_{1} + k_{2}}$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\frac{k_{1}^{2} - 2 \\, k_{1} k_{2} + k_{2}^{2}}{k_{1}^{2} + 2 \\, k_{1} k_{2} + k_{2}^{2}}$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\frac{B}{A} + 1 = \\frac{C}{A}$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\frac{k_{1} - k_{2}}{k_{1} + k_{2}} + 1 = \\frac{C}{A}$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\frac{4 \\, k_{1} k_{2}}{k_{1}^{2} + 2 \\, k_{1} k_{2} + k_{2}^{2}}$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\frac{4 \\, k_{2}}{k_{2}^{2} + 2 \\, k_{2} + 1}$</div>"}︡{"file":{"filename":"/projects/d18eeda9-38fb-4d20-9a0a-4afa03a182aa/.sage/temp/compute4-us/10843/tmp_8adXpB.svg","show":true,"text":null,"uuid":"75e4c548-e3c8-4b9e-af66-6d0fc611a795"},"once":false}︡{"html":"<div align='center'></div>"}︡{"done":true}︡
︠e5f68cb0-7ed7-4487-893b-1b506cba8b60i︠
%md

# <img src="sagemathcloud_logo1.png" width="48"> Solve a system of equations

- `solve()` returns a list of solutions
    - Arguments of `solve()` are a list of equations to satisfy and a list of variables to solve for
    - e.g. `solve([x+y==1,x-y==3],[x,y])`
    - Note that equations must have double equals signs to work;

### Barrier Tunneling

This example calculates the wave function for a particle hitting a barrier.  It demonstrates that the particle does in fact tunnel through the barrier

<img src="tunneling_fig3.png" width="400">

We now need to have wave functions in each of the three regions.

\[\psi_I(x) = A e^{ik_1 x} + B e^{-ik_1 x}\]

and

\[\psi_{II}(x) = C e^{ik_2 x} + D e^{-ik_2 x}\]

and

\[\psi_{III}(x) = F e^{ik_1 x} + G e^{-ik_1 x}.\]

With  no particles incident from the right we can set $G=0$.

The wave function and derivatives of the wave functions must be continuous at both boundaries.  Rather than solving this set of equations long-hand, we'll use the `solve()` function to find $B$, $C$, $D$, and $F$.

The transmission probability is

\[T=\frac{FF^*}{AA^*} = \left| \frac{F}{A} \right|^2.\] 

In this case the transmission probability through the barrier is non-zero, even though the particle should not be able to penetrate the barrier classically.

︡7c1ce5a2-7d84-4330-b637-8fbeeb4f694d︡{"done":true,"md":"\n# <img src=\"sagemathcloud_logo1.png\" width=\"48\"> Solve a system of equations\n\n- `solve()` returns a list of solutions\n    - Arguments of `solve()` are a list of equations to satisfy and a list of variables to solve for\n    - e.g. `solve([x+y==1,x-y==3],[x,y])`\n    - Note that equations must have double equals signs to work;\n\n### Barrier Tunneling\n\nThis example calculates the wave function for a particle hitting a barrier.  It demonstrates that the particle does in fact tunnel through the barrier\n\n<img src=\"tunneling_fig3.png\" width=\"400\">\n\nWe now need to have wave functions in each of the three regions.\n\n\\[\\psi_I(x) = A e^{ik_1 x} + B e^{-ik_1 x}\\]\n\nand\n\n\\[\\psi_{II}(x) = C e^{ik_2 x} + D e^{-ik_2 x}\\]\n\nand\n\n\\[\\psi_{III}(x) = F e^{ik_1 x} + G e^{-ik_1 x}.\\]\n\nWith  no particles incident from the right we can set $G=0$.\n\nThe wave function and derivatives of the wave functions must be continuous at both boundaries.  Rather than solving this set of equations long-hand, we'll use the `solve()` function to find $B$, $C$, $D$, and $F$.\n\nThe transmission probability is\n\n\\[T=\\frac{FF^*}{AA^*} = \\left| \\frac{F}{A} \\right|^2.\\] \n\nIn this case the transmission probability through the barrier is non-zero, even though the particle should not be able to penetrate the barrier classically."}
︠b8492e98-a7d0-4e48-9a16-305fedf3a773︠
#Barrier: E<V_0

A,B,C,D,F,G, m,E,V_0,k_1,k_2,a=var('A,B,C,D,F,G,m,E,V_0,k_1,k_2,a')

G=0

psi_1(x)=A*e^(i*k_1*x) + B*e^(-i*k_1*x)
psi_2(x)=C*e^(k_2*x) + D*e^(-k_2*x)
psi_3(x)=F*e^(i*k_1*x) + G*e^(-i*k_1*x)

psi_1(x).show()
psi_2(x).show()
psi_3(x).show()

#Continuity of w.f. at boundaries

eqn1A=psi_1(0)==psi_2(0)
eqn1A.show()
eqn1B=psi_2(a)==psi_3(a)
eqn1B.show()

#Continuity of derivatives of w.f.
eqn2A=diff(psi_1(x),x).substitute(x=0)==diff(psi_2(x),x).substitute(x=0)
eqn2A.show()
eqn2B=diff(psi_2(x),x).substitute(x=a)==diff(psi_3(x),x).substitute(x=a)
eqn2B.show()

#Solve the equations (quick and easy solution)
soln=solve([eqn1A,eqn1B,eqn2A,eqn2B],[B,C,D,F])
for i in soln[0]:   #Print off all solutions in the list of solutions
    i.show()


#soln is a list of lists which is structured like this: soln=[[ans0,ans1,ans2,ans3]]...
#... which means soln[0]=[ans0,ans1,ans2,ans3].  This means soln[0][3] returns ans3

#Find T and R
F_1=soln[0][3].rhs()
F_2=F_1/A
B_1=soln[0][0].rhs()
B_2=B_1/A

F_2.show()
B_2.show()

R=(B_2*conjugate(B_2)).full_simplify()
R.show()

T=(F_2*conjugate(F_2)).full_simplify()
T.show()


R_plot=(R.substitute(k_1=1,a=5))
T_plot=(T.substitute(k_1=1,a=5))

R_plot.show()
T_plot.show()
P=plot(R_plot,[k_2,0,1],title='Transmission and Reflection from a Barrier',axes_labels=['$k_2$ as a fraction of $k_1$', 'Probability'],legend_label='Reflection probability',axes_labels_size=1)
P+=plot(T_plot,[k_2,0,1],color='red',legend_label='Transmission probability')
P.show()

︡4ca47bf4-fc72-4d7a-ac2d-b270490cd419︡{"html":"<div align='center'>$\\displaystyle A + B = C + D$</div>"}︡{"html":"<div align='center'>$\\displaystyle C e^{\\left(a k_{2}\\right)} + D e^{\\left(-a k_{2}\\right)} = F e^{\\left(i \\, a k_{1}\\right)}$</div>"}︡{"html":"<div align='center'>$\\displaystyle i \\, A k_{1} - i \\, B k_{1} = C k_{2} - D k_{2}$</div>"}︡{"html":"<div align='center'>$\\displaystyle C k_{2} e^{\\left(a k_{2}\\right)} - D k_{2} e^{\\left(-a k_{2}\\right)} = i \\, F k_{1} e^{\\left(i \\, a k_{1}\\right)}$</div>"}︡{"html":"<div align='center'>$\\displaystyle B = \\frac{{\\left(k_{1}^{2} + k_{2}^{2} - {\\left(k_{1}^{2} + k_{2}^{2}\\right)} e^{\\left(2 \\, a k_{2}\\right)}\\right)} A}{k_{1}^{2} - 2 i \\, k_{1} k_{2} - k_{2}^{2} - {\\left(k_{1}^{2} + 2 i \\, k_{1} k_{2} - k_{2}^{2}\\right)} e^{\\left(2 \\, a k_{2}\\right)}}$</div>"}︡{"html":"<div align='center'>$\\displaystyle C = \\frac{{\\left(2 \\, k_{1}^{2} - 2 i \\, k_{1} k_{2}\\right)} A}{k_{1}^{2} - 2 i \\, k_{1} k_{2} - k_{2}^{2} - {\\left(k_{1}^{2} + 2 i \\, k_{1} k_{2} - k_{2}^{2}\\right)} e^{\\left(2 \\, a k_{2}\\right)}}$</div>"}︡{"html":"<div align='center'>$\\displaystyle D = -\\frac{{\\left(2 \\, k_{1}^{2} + 2 i \\, k_{1} k_{2}\\right)} A e^{\\left(2 \\, a k_{2}\\right)}}{k_{1}^{2} - 2 i \\, k_{1} k_{2} - k_{2}^{2} - {\\left(k_{1}^{2} + 2 i \\, k_{1} k_{2} - k_{2}^{2}\\right)} e^{\\left(2 \\, a k_{2}\\right)}}$</div>"}︡{"html":"<div align='center'>$\\displaystyle F = \\frac{4 i \\, A k_{1} k_{2} e^{\\left(a k_{2}\\right)}}{{\\left(k_{1}^{2} + 2 i \\, k_{1} k_{2} - k_{2}^{2}\\right)} e^{\\left(i \\, a k_{1} + 2 \\, a k_{2}\\right)} - {\\left(k_{1}^{2} - 2 i \\, k_{1} k_{2} - k_{2}^{2}\\right)} e^{\\left(i \\, a k_{1}\\right)}}$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\frac{4 i \\, k_{1} k_{2} e^{\\left(a k_{2}\\right)}}{{\\left(k_{1}^{2} + 2 i \\, k_{1} k_{2} - k_{2}^{2}\\right)} e^{\\left(i \\, a k_{1} + 2 \\, a k_{2}\\right)} - {\\left(k_{1}^{2} - 2 i \\, k_{1} k_{2} - k_{2}^{2}\\right)} e^{\\left(i \\, a k_{1}\\right)}}$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\frac{k_{1}^{2} + k_{2}^{2} - {\\left(k_{1}^{2} + k_{2}^{2}\\right)} e^{\\left(2 \\, a k_{2}\\right)}}{k_{1}^{2} - 2 i \\, k_{1} k_{2} - k_{2}^{2} - {\\left(k_{1}^{2} + 2 i \\, k_{1} k_{2} - k_{2}^{2}\\right)} e^{\\left(2 \\, a k_{2}\\right)}}$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\frac{k_{1}^{4} + 2 \\, k_{1}^{2} k_{2}^{2} + k_{2}^{4} + {\\left(k_{1}^{4} + 2 \\, k_{1}^{2} k_{2}^{2} + k_{2}^{4}\\right)} e^{\\left(4 \\, a k_{2}\\right)} - 2 \\, {\\left(k_{1}^{4} + 2 \\, k_{1}^{2} k_{2}^{2} + k_{2}^{4}\\right)} e^{\\left(2 \\, a k_{2}\\right)}}{k_{1}^{4} + 2 \\, k_{1}^{2} k_{2}^{2} + k_{2}^{4} + {\\left(k_{1}^{4} + 2 \\, k_{1}^{2} k_{2}^{2} + k_{2}^{4}\\right)} e^{\\left(4 \\, a k_{2}\\right)} - 2 \\, {\\left(k_{1}^{4} - 6 \\, k_{1}^{2} k_{2}^{2} + k_{2}^{4}\\right)} e^{\\left(2 \\, a k_{2}\\right)}}$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\frac{16 \\, k_{1}^{2} k_{2}^{2} e^{\\left(2 \\, a k_{2}\\right)}}{k_{1}^{4} + 2 \\, k_{1}^{2} k_{2}^{2} + k_{2}^{4} + {\\left(k_{1}^{4} + 2 \\, k_{1}^{2} k_{2}^{2} + k_{2}^{4}\\right)} e^{\\left(4 \\, a k_{2}\\right)} - 2 \\, {\\left(k_{1}^{4} - 6 \\, k_{1}^{2} k_{2}^{2} + k_{2}^{4}\\right)} e^{\\left(2 \\, a k_{2}\\right)}}$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\frac{k_{2}^{4} + 2 \\, k_{2}^{2} + {\\left(k_{2}^{4} + 2 \\, k_{2}^{2} + 1\\right)} e^{\\left(20 \\, k_{2}\\right)} - 2 \\, {\\left(k_{2}^{4} + 2 \\, k_{2}^{2} + 1\\right)} e^{\\left(10 \\, k_{2}\\right)} + 1}{k_{2}^{4} + 2 \\, k_{2}^{2} + {\\left(k_{2}^{4} + 2 \\, k_{2}^{2} + 1\\right)} e^{\\left(20 \\, k_{2}\\right)} - 2 \\, {\\left(k_{2}^{4} - 6 \\, k_{2}^{2} + 1\\right)} e^{\\left(10 \\, k_{2}\\right)} + 1}$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\frac{16 \\, k_{2}^{2} e^{\\left(10 \\, k_{2}\\right)}}{k_{2}^{4} + 2 \\, k_{2}^{2} + {\\left(k_{2}^{4} + 2 \\, k_{2}^{2} + 1\\right)} e^{\\left(20 \\, k_{2}\\right)} - 2 \\, {\\left(k_{2}^{4} - 6 \\, k_{2}^{2} + 1\\right)} e^{\\left(10 \\, k_{2}\\right)} + 1}$</div>"}︡{"file":{"filename":"/projects/d18eeda9-38fb-4d20-9a0a-4afa03a182aa/.sage/temp/compute4-us/29245/tmp_Bf7rOP.svg","show":true,"text":null,"uuid":"f9b9f31e-7e00-4f67-a3c8-5624ae86cbc9"},"once":false}︡{"html":"<div align='center'></div>"}︡{"done":true}︡
︠56a69193-1269-45a8-a182-fc424021ea51︠
%md

# For You To Try

- Type 'solve?' into the cell below and hit Shift+Enter to see the documentation for the `solve()` command
- Use `solve()` to find the solutions to the equations:
    - x+3y = 2
    - 2y-4z=1
    - x-z=2
- Go back and solve the first two cases 

︡dac3f623-7f4e-47a6-997f-697d894b5662︡{"done":true,"md":"\n# For You To Try\n\n- Type 'solve?' into the cell below and hit Shift+Enter to see the documentation for the `solve()` command\n- Use `solve()` to find the solutions to the equations:\n    - x+3y = 2\n    - 2y-4z=1\n    - x-z=2"}
︠66d38521-27e6-4bca-b55f-879714e0afa2︠
#Insert your work here
︠159f036f-f153-469c-b9b3-c49b39a48f20i︠
%md

# <img src="sagemathcloud_logo1.png" width="48"> Projects and Problem Ideas

- Calculate the reflection and transmisison probabilities for a barrier when E>V_0
- Calculate the wave function and energy of a particle bound in a delta function well for E<0 (there is a single bound state)
- Calculate the wave function for an unbound particle near a delta function well (E>0)
︡bb64d8a9-4bb6-445b-940a-ec7c7a8af433︡{"done":true,"md":"\n# <img src=\"sagemathcloud_logo1.png\" width=\"48\"> Projects and Problem Ideas\n\n- Calculate the reflection and transmisison probabilities for a barrier when E>V_0\n- Calculate the wave function and energy of a particle bound in a delta function well for E<0 (there is a single bound state)\n- Calculate the wave function for an unbound particle near a delta function well (E>0)"}
︠97445035-e578-426d-9f50-d45d27cb7357︠









