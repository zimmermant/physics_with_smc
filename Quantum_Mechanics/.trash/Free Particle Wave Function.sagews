︠a3d46154-f6a4-4e80-85df-6403c639315fi︠
%md

# Overview

This interactive SageMath worksheet will explain how to define variables and functions, evaluate and plot functions, as well as finding derivatives and integrals of symbolic functions.  We will use the quantum mechanical wave function of a free particle as an example.

Goals of this activity:

- Plot the real and imaginary elements of the free particle wave function \(\psi(x,t) = A_0 e^{i(kx - \omega t)}\)
- Create an animated plot of the wave function
- Check that the wave function satisfies the Schrodinger's equation

Schrodinger's equation for a one-dimensional system (e.g. think of an electron confined to a nanowire) is \[\frac{-\hbar^2}{2m}\frac{\partial^2}{\partial x^2} \psi(x,t) +V(x)\psi(x,t) = i\hbar \frac{\partial}{\partial t} \psi(x,t)\].

A free particle is a particle that does not experience any forces along the direction of motion and can move freely without any walls.  In truth there is no such thing as a free particle since all particle are confined in some ways but as long as the dimensions of confinement are much much larger than the wavelength of the particle we can treat the particle as free.  An electron confined to a nanowire with a length on the order of millimeters would be a good example of this.



︡45e447c8-9eb3-4a3d-8e56-0fbf04beb833︡{"done":true,"md":"\n# Overview\n\nThis interactive SageMath worksheet will explain how to define variables and functions, evaluate and plot functions, as well as finding derivatives and integrals of symbolic functions.  We will use the quantum mechanical wave function of a free particle as an example.\n\nGoals of this activity:\n\n- Plot the real and imaginary elements of the free particle wave function \\(\\psi(x,t) = A_0 e^{i(kx - \\omega t)}\\)\n- Create an animated plot of the wave function\n- Check that the wave function satisfies the Schrodinger's equation\n\nSchrodinger's equation for a one-dimensional system (e.g. think of an electron confined to a nanowire) is \\[\\frac{-\\hbar^2}{2m}\\frac{\\partial^2}{\\partial x^2} \\psi(x,t) +V(x)\\psi(x,t) = i\\hbar \\frac{\\partial}{\\partial t} \\psi(x,t)\\].\n\nA free particle is a particle that does not experience any forces along the direction of motion and can move freely without any walls.  In truth there is no such thing as a free particle since all particle are confined in some ways but as long as the dimensions of confinement are much much larger than the wavelength of the particle we can treat the particle as free.  An electron confined to a nanowire with a length on the order of millimeters would be a good example of this."}
︠8f31c57d-35f4-46be-b359-478dbf70d6bei︠
%md
# Defining variables and functions


- All variables must be explicitly declared (except for the variable 'x' and variables used as arguments of functions) using the **var()** command
- Variables cannot start with numbers or contain spaces but they can contain underscores
- Functions can be evaluated by inserting values for the arguments
- To evaluate an input cell in this worksheet, put the cursor in the cell and hit Shift+Enter.  The output will be displayed in the cell below the input cell.

#### What is the free particle wave function solution to Schrodinger's equation?

The general solution to Schrodinger's equation is \(\psi(x,t) = A_0 e^{i(kx-\omega t)} + B_0 e^{i(kx + \omega t)}\) where the only difference between the two terms is the sign in front of \(\omega t\), which determines which direction the wave travels.  For the moment we will only look at the first term by setting \(B_0=0\).


︡7e2b4081-2bcb-4fd7-85e4-2da86a0e6b4c︡{"done":true,"md":"# Defining variables and functions\n\n\n- All variables must be explicitly declared (except for the variable 'x' and variables used as arguments of functions) using the **var()** command\n- Variables cannot start with numbers or contain spaces but they can contain underscores\n- Functions can be evaluated by inserting values for the arguments\n- To evaluate an input cell in this worksheet, put the cursor in the cell and hit Shift+Enter.  The output will be displayed in the cell below the input cell.\n\n#### What is the free particle wave function solution to Schrodinger's equation?\n\nThe general solution to Schrodinger's equation is \\(\\psi(x,t) = A_0 e^{i(kx-\\omega t)} + B_0 e^{i(kx + \\omega t)}\\) where the only difference between the two terms is the sign in front of \\(\\omega t\\), which determines which direction the wave travels.  For the moment we will only look at the first term by setting \\(B_0=0\\)."}
︠1127e0b1-91de-426d-b84c-f6b49ac7e6d3︠
#This is a calculation input cell.  SageMath will operate on anything typing into this cell and output the results in the cell below.
#Insert the cursor in this cell and hit Shift-Enter to evaluate it.
# Any text after the hashtag is ignored by SageMath

A_0,k,omega, m = var('A_0,k,omega, m')  #Variables are defined using the 'var()' command.



psi(x,t) = A_0*exp(i*(k*x - omega*t))  #This is a how you define a function.  Arguments of the function are placed in parentheses.
psi(x,t) # When a function is defined SageMath does not output the equation.  Explicitly calling the function will display it in the output cell below.
psi(x,t).show()  #The .show() command can be used to output a formatted version of the equation

psi(0,0)  #Functions are evaluated by plugging in values for the arguments.  Notice that the wave function at x=0, t=0 has the value of A_0
psi(0,0).show()  #Nicer looking output
︡ddfc4888-54a2-4128-9cb6-9b71032b18e4︡{"stdout":"A_0*e^(-I*omega*t + I*k*x)\n"}︡{"html":"<div align='center'>$\\displaystyle A_{0} e^{\\left(-i \\, \\omega t + i \\, k x\\right)}$</div>"}︡{"stdout":"A_0\n"}︡{"html":"<div align='center'>$\\displaystyle A_{0}$</div>"}︡{"done":true}︡
︠67f4fb97-b8f1-4186-8ae3-acbed99d1196i︠
%md
# Plotting functions


- To replace variables with numerical values you need to use the **.substitute()** command.
    - To replace all values of the variable $A_0$ with the value $1$, append '.substitute(A_0=1)' to the function name.
- The real and imaginary parts of a function can be obtained by using **.real()** and **.imag()**.
- Since SageMath is based on Python, everything is an object.  This means that you can modify properties or act on things using the "dot" notation.

#### What does the free particle wave function look like?

The solution to Schrodinger's equation must be a complex function so the wave function must be split into it's real part and imaginary part to plot the function.  The free particle wave function for a one-dimensional system is $\psi(x,t) = e^{i(kx -\omega t)}$.  What do you think the graph of the real part of the wave function will look like?  What do you think the imaginary part of the wave function will look like?  (Hint: What is Euler's identity?)
︡31e4cbde-63b2-4128-a1da-5647a3cd9c86︡{"done":true,"md":"# Plotting functions\n\n\n- To replace variables with numerical values you need to use the **.substitute()** command.\n    - To replace all values of the variable $A_0$ with the value $1$, append '.substitute(A_0=1)' to the function name.\n- The real and imaginary parts of a function can be obtained by using **.real()** and **.imag()**.\n- Since SageMath is based on Python, everything is an object.  This means that you can modify properties or act on things using the \"dot\" notation.\n\n#### What does the free particle wave function look like?\n\nThe solution to Schrodinger's equation must be a complex function so the wave function must be split into it's real part and imaginary part to plot the function.  The free particle wave function for a one-dimensional system is $\\psi(x,t) = e^{i(kx -\\omega t)}$.  What do you think the graph of the real part of the wave function will look like?  What do you think the imaginary part of the wave function will look like?  (Hint: What is Euler's identity?)"}
︠f1da144d-c692-454c-8a70-ace0dfd92f06s︠
#Plotting the real and imaginary parts of the wave function
psi_plot(x,t) = psi(x,t).substitute(A_0=1,k=1,omega=1)  #Since psi was defined with variable values for A_0, k, and omega, we must use the '.substitute()' command to change the variables into numerical values
#psi_plot(x,t) is the same function as psi(x,t) with A_0=1, k=1, and omega=1

psi_plot_Re(x,t)=(psi_plot(x,t)).real()  #The '.real()' command extracts the real component of the function
psi_plot_Im(x,t)=(psi_plot(x,t)).imag() #The '.imag()' command gets the imaginary component

P1=plot(psi_plot_Re(x,0),x,0,10,legend_label='Real Part', title='Real and Imaginary Component of Free-Particle Wave Function')
P2=plot(psi_plot_Im(x,0),x,0,10,legend_label='Imaginary Part',color='red')
P=P1+P2  #Combine the two graphs into one plot
P.show()  #Show the plot

︡fdaec62c-ec9b-448e-81e9-b17a5ac8139e︡{"file":{"filename":"/projects/d18eeda9-38fb-4d20-9a0a-4afa03a182aa/.sage/temp/compute4-us/20036/tmp_bQj7mN.svg","show":true,"text":null,"uuid":"010f3487-85c8-49ed-8d7a-d68f11a56a81"},"once":false}︡{"html":"<div align='center'></div>"}︡{"done":true}︡
︠8c8d3793-44e7-4749-b347-8e11cb8725dfi︠
%md
## For you to try:

Use the fact that $e^{i \theta} = \cos(\theta) + i \sin(\theta)$ to plot the real part of the wave function at time $t = 1$.  Type your work into the input cell below.

How does your graph for the real part of the wave function compare to the graph of the real part above?  What function do you think represents the imaginary part of the free particle wave function?
︡786f4606-c324-4191-a891-83c1c391349a︡{"done":true,"md":"## For you to try:\n\nUse the fact that $e^{i \\theta} = \\cos(\\theta) + i \\sin(\\theta)$ to plot the real part of the wave function at time $t = 1$.  Type your work into the input cell below.\n\nHow does your graph for the real part of the wave function compare to the graph of the real part above?  What function do you think represents the imaginary part of the free particle wave function?"}
︠a6a63b28-33ee-483d-9ad8-c3cca59f78d2︠
#Add your work here
︡754c13d7-7988-4308-b1fa-d8c6fb40295b︡{"done":true}︡
︠7261bf00-1a66-4535-b382-80649e55ebf9i︠
%md
# Animating plots
#### Which way is the free particle wave function moving?

To determine the direction that the wave is moving you can create an animated plot at different times using a short Python script.  You will need to create a list of plot snapshots at different times and then combine them into an animation.
︡850a3956-fbfa-4a84-9c7b-c654f8bd4c7c︡{"done":true,"md":"# Animating plots\n#### Which way is the free particle wave function moving?\n\nTo determine the direction that the wave is moving you can create an animated plot at different times using a short Python script.  You will need to create a list of plot snapshots at different times and then combine them into an animation."}
︠2305c8df-d74e-437e-b902-4de8d7d8f78f︠
times = sxrange(0,5,0.5)     #Create a list of the times for evaluation.  sxrange() creates a list of numbers from 0 to 5 in steps of 0.5
plot_graph = []   #Create an empty list to store the plotted graphs at different times

for t in times:    #Loop through all times
    new_plot=plot(psi_plot_Re(x,t),x,0,10)+plot(psi_plot_Im(x,t),x,0,10,color='red')   #Create plot at time t for each value of t
    plot_graph.append(new_plot)    #Add the new plot to the final list

a=animate(plot_graph)    #Combine all plots contained in plot_graph into an animation
a.show()  #Show the animation


︡6c5ea5a2-459f-408e-af49-534f96085b26︡{"file":{"filename":"/projects/d18eeda9-38fb-4d20-9a0a-4afa03a182aa/.sage/temp/compute4-us/18655/tmp_x0ApQQ.webm","show":true,"text":null,"url":"/d18eeda9-38fb-4d20-9a0a-4afa03a182aa/raw/.sage/temp/compute4-us/18655/tmp_x0ApQQ.webm"},"once":false}︡{"html":"<div align='center'></div>"}︡{"done":true}︡
︠bc8b2b7b-ee4c-45fd-ae06-df68f904b85ai︠
%md

### Note:

You can accomplish the same thing with more compact code using Python list comprehensions:

    plot_graph = [plot(psi_plot_Re(x,t),x,0,10)+plot(psi_plot_Im(x,t),x,0,10,color='red') for t in sxrange(0,5,.5)]
    a=animate(plot_graph)
    a.show()
︡7b297643-b91c-4a5e-9d67-c12056475bec︡{"done":true,"md":"\n### Note:\n\nYou can accomplish the same thing with more compact code using Python list comprehensions:\n\n    plot_graph = [plot(psi_plot_Re(x,t),x,0,10)+plot(psi_plot_Im(x,t),x,0,10,color='red') for t in sxrange(0,5,.5)]\n    a=animate(plot_graph)\n    a.show()"}
︠0f7a2418-7f04-48f8-aaba-59697c6a682fi︠
%md

# Working with complex functions



- Assumptions about variables can be specified using the **assume()** command.  In this case we assume all variables are real.
- The complex conjugate can be found using **.conjugate()**.
- **print()** and **pretty_print()** can be used to include text in an output cell.

#### Calculate the probability density for the free particle wave function

The wave function \(\psi(x,t)\) is called the probability amplitude of the particle.  The probility density \(\rho(x,t)\) is equal to the magnitude of the probability amplitude squared.  Since \(\psi(x,t)\) is complex, the magnitude squared _is not the same as_ the square of \(\psi(x,t)\).  You must multiply \(\psi(x,t)\) by it's complex conjugate, which is written as \(\psi^*(x,t)\).  The probability density is then given by \(\rho(x,t) = \psi^*(x,t) \psi(x,t)\).

How would you find the probability to find a particle between two points given the probability density?  In other words, how is the probability density related to the probability to find the particle within some region of space?
︡42631e2b-08f9-41ad-8028-f41310a8338c︡{"done":true,"md":"\n# Working with complex functions\n\n\n\n- Assumptions about variables can be specified using the **assume()** command.  In this case we assume all variables are real.\n- The complex conjugate can be found using **.conjugate()**.\n- **print()** and **pretty_print()** can be used to include text in an output cell.\n\n#### Calculate the probability density for the free particle wave function\n\nThe wave function \\(\\psi(x,t)\\) is called the probability amplitude of the particle.  The probility density \\(\\rho(x,t)\\) is equal to the magnitude of the probability amplitude squared.  Since \\(\\psi(x,t)\\) is complex, the magnitude squared _is not the same as_ the square of \\(\\psi(x,t)\\).  You must multiply \\(\\psi(x,t)\\) by it's complex conjugate, which is written as \\(\\psi^*(x,t)\\).  The probability density is then given by \\(\\rho(x,t) = \\psi^*(x,t) \\psi(x,t)\\).\n\nHow would you find the probability to find a particle between two points given the probability density?  In other words, how is the probability density related to the probability to find the particle within some region of space?"}
︠06b8d361-a48a-4c9b-99e9-c78652a9b107s︠
#All of these quantities are real.  We need to specify that they are real because we will calculate the complex conjugate of psi(x,t)
#Without assumption that these variables are real, rho(x,t) below will not simplify to A_0^2
assume(omega,'real')
assume(k,'real')
assume(x,'real')
assume(t,'real')
assume(A_0,'real')


rho(x,t)=psi(x,t)*psi(x,t).conjugate() #When defining a function, the results are not printed out ...
rho(x,t)  #... so you'll need to call the function to get SageMath to print it in the output cell

print 'The probability density rho(x,t) for a free partile is', rho(x,t)

#You can typeset the print statement using Latex by calling 'pretty_print()'...
pretty_print('The probability density $\\rho(x,t)$ for a free particle is', rho(x,t))

#Notice that print only requires quote marks around text while pretty_print() uses parentheses and quote marks



︡04cdb5e6-f657-498a-9125-cb8a597badbc︡{"stdout":"A_0^2\n"}︡{"stdout":"The probability density rho(x,t) for a free partile is A_0^2\n"}︡{"html":"<div align='center'>The probability density $\\rho(x,t)$ for a free particle is $\\displaystyle A_{0}^{2}$</div>"}︡{"done":true}︡
︠1df87273-820d-45b1-b398-82f676f560a6i︠
%md

# For you to try:

SageMath has a help system that is easy to use.  To figure out how to use a command, type the name of the command followed by the question mark '?'.  

SageMath also has an autocomplete feature where you can hit the first few letters of a command followed by the Tab key to get a list of possible commands.  These two tools used together can help you tremendously.

- To see what other assumptions you can make, type 'assume?' into the input cell below.

- To get help with the **integral()** command, first type 'int' and then hit Tab to use autocomplete.  Select 'integral' from the pop-up list and add a question mark to the end before evaluating the cell by hitting Shift+Enter
︡7d7c2819-8754-4534-8297-f314503a12d3︡{"done":true,"md":"\n# For you to try:\n\nSageMath has a help system that is easy to use.  To figure out how to use a command, type the name of the command followed by the question mark '?'.  \n\nSageMath also has an autocomplete feature where you can hit the first few letters of a command followed by the Tab key to get a list of possible commands.  These two tools used together can help you tremendously.\n\n- To see what other assumptions you can make, type 'assume?' into the input cell below.\n\n- To get help with the **integral()** command, first type 'int' and then hit Tab to use autocomplete.  Select 'integral' from the pop-up list and add a question mark to the end before evaluating the cell by hitting Shift+Enter"}
︠84374cf7-1710-47a0-b788-406977e1eb3as︠
#Input your work here

︡10d0875c-de99-4a37-81df-653032167167︡{"done":true}︡
︠223dfca3-237c-412e-8947-d88cc64ad782i︠
%md

# Taking derivatives of functions

- The command **.derivative()** will find the derivative of a symbolic function.
- The arguments of the **.derivative()** command are the variable of differentiation and the order of the derivative
    - To find the third derivative of the function $f$ with respect to $x$ use:

           f.derivative(x, 3)

The output from the **.derivative()** command is another function, which you can evaluate or set equal to another variable.


︡64d90a46-5dfd-4543-b4ca-7cfbbf924d6e︡{"done":true,"md":"\n# Taking derivatives of functions\n\n- The command **.derivative()** will find the derivative of a symbolic function.\n- The arguments of the **.derivative()** command are the variable of differentiation and the order of the derivative\n    - To find the third derivative of the function $f$ with respect to $x$ use:\n\n           f.derivative(x, 3)\n\nThe output from the **.derivative()** command is another function, which you can evaluate or set equal to another variable."}
︠f1943ac4-a2b4-485b-88f5-092243b71c35s︠
psi.derivative(x,1)  #Taking the first derivative with respect to x
psi.derivative(x)  #First order derivative is assumed if no number is given
psi.derivative()  #If you don't specify the differentiation variable, SageMath will return a list with all possible derivatives

psi(x,t).derivative(x)  #If you explicitly include the arguments of the function the result will be returned without (x,t) |-->


psi.derivative(x)(x=1,t=1)  #You can evaluate the derivative at a point but specifying the values for x and t...

psi_prime = psi.derivative(x)   #... or you can define your result as a new function...
psi_prime(1,1)    #... and evaluate this new function at the point x=1, t=1


︡20162209-f45f-4dde-ad9a-8900be11a047︡{"stdout":"(x, t) |--> I*A_0*k*e^(-I*omega*t + I*k*x)\n"}︡{"stdout":"(x, t) |--> I*A_0*k*e^(-I*omega*t + I*k*x)\n"}︡{"stdout":"(x, t) |--> (I*A_0*k*e^(-I*omega*t + I*k*x), -I*A_0*omega*e^(-I*omega*t + I*k*x))"}︡{"stdout":"\n"}︡{"stdout":"I*A_0*k*e^(-I*omega*t + I*k*x)\n"}︡{"stdout":"I*A_0*k*e^(I*k - I*omega)\n"}︡{"stdout":"I*A_0*k*e^(I*k - I*omega)\n"}︡{"done":true}︡
︠cb2ed36e-10c1-4ae8-a276-de16521b272ci︠
%md

### Note:

Rather than using the "dot" notation, you can treat the **derivative()** command as a function.  You can also use **diff()** in place of **derivative**; the results are the same for both commands.

- Here are a couple of examples that are all equivalent:

      derivative(f,x,2)
    
      diff(f,x,2)
      
      f.derivative(x,2)
      
      f.diff(x,2)
︡cd5d722a-9ae8-458c-ad19-600c23168425︡{"done":true,"md":"\n### Note:\n\nRather than using the \"dot\" notation, you can treat the **derivative()** command as a function.  You can also use **diff()** in place of **derivative**; the results are the same for both commands.\n\n- Here are a couple of examples that are all equivalent:\n\n      derivative(f,x,2)\n    \n      diff(f,x,2)\n      \n      f.derivative(x,2)\n      \n      f.diff(x,2)"}
︠8ff1aeeb-8818-4a94-8fd8-ee3741c462a3i︠
%md

# Defining functionals involved derivatives

Another way to define functions is using Python commands.
- Definition must start with **def** followed by the name of the function and the arguments of the function.
- First line of function definition must end with a colon **:**
- All code included in the function must be indented four spaces (one tab)
- Last line of function defintion must return resulting equation

#### Momentum Operator

In quantum mechanics, all observable quantities have an associated operator.  These operators require a wave function to operate on.  The momentum operator in one-dimension is defined as \[\hat{p}=-i\hbar \frac{d}{dx}\].  The value of the momentum \(p\) is found by applying the operator to the wave function.  In other words, \[p\psi(x,t) = \hat{p} \psi(x,t)\] or, dividing both sides by \(\psi(x,t)\), \[p=\frac{\hat{p}\psi(x,t)}{\psi(x,t)}.\]  Notice that \(\psi(x,t)\) doesn't cancel out the \(\psi(x,t)\) in the numerator because the numerator is \(\hat{p}\) *operating* on \(\psi(x,t)\) which is different than multiplying the two terms together.

The momentum of a free particle is given by \(\hbar k\), which is what the following calculation demonstrates.
︡f5aefb66-2845-4922-a09c-cf88a65daa54︡{"done":true,"md":"\n# Defining functionals involved derivatives\n\nAnother way to define functions is using Python commands.\n- Definition must start with **def** followed by the name of the function and the arguments of the function.\n- First line of function definition must end with a colon **:**\n- All code included in the function must be indented four spaces (one tab)\n- Last line of function defintion must return resulting equation\n\n#### Momentum Operator\n\nIn quantum mechanics, all observable quantities have an associated operator.  These operators require a wave function to operate on.  The momentum operator in one-dimension is defined as \\[\\hat{p}=-i\\hbar \\frac{d}{dx}\\].  The value of the momentum \\(p\\) is found by applying the operator to the wave function.  In other words, \\[p\\psi(x,t) = \\hat{p} \\psi(x,t)\\] or, dividing both sides by \\(\\psi(x,t)\\), \\[p=\\frac{\\hat{p}\\psi(x,t)}{\\psi(x,t)}.\\]  Notice that \\(\\psi(x,t)\\) doesn't cancel out the \\(\\psi(x,t)\\) in the numerator because the numerator is \\(\\hat{p}\\) *operating* on \\(\\psi(x,t)\\) which is different than multiplying the two terms together.\n\nThe momentum of a free particle is given by \\(\\hbar k\\), which is what the following calculation demonstrates."}
︠641c6190-bac3-4a20-9474-e0484c8524e5︠
hbar=var('hbar',latex_name=r'\hbar')  #This extra defintion will display the hbar symbol when using .show() or pretty_print

def P(f):   #This will define the momentum operator P
    return -i*hbar*diff(f,x)    #The function returns -i*hbar*diff(f,x) when called

P(psi)  #Calculating momentum using P-operator.  Notice the function psi appears inside parenthese to indicate P is operating on the function
P(psi).show()  #A nicer looking output
P(psi(x,t)).show()  #Notice that if I explicitly include the arguments of psi that (x,t) |--> is not included in the output

momentum = P(psi(x,t))/psi(x,t)
pretty_print('The momentum of a free particle is $p=$', momentum)
︡3a809871-8ef6-44c2-a946-654544f67dbf︡{"stdout":"(x, t) |--> A_0*hbar*k*e^(-I*omega*t + I*k*x)\n"}︡{"html":"<div align='center'>$\\displaystyle \\left( x, t \\right) \\ {\\mapsto} \\ A_{0} {{\\hbar}} k e^{\\left(-i \\, \\omega t + i \\, k x\\right)}$</div>"}︡{"html":"<div align='center'>$\\displaystyle A_{0} {{\\hbar}} k e^{\\left(-i \\, \\omega t + i \\, k x\\right)}$</div>"}︡{"html":"<div align='center'>The momentum of a free particle is $p=$ $\\displaystyle {{\\hbar}} k$</div>"}︡{"done":true}︡
︠8f3d1df1-13ef-4d05-bf00-7a5ebd7e0e4di︠
%md

# For you to try:

Schrodinger's equation is given by \[\frac{-\hbar^2}{2m}\frac{\partial^2}{\partial x^2} \psi(x,t) +V(x)\psi(x,t) = i\hbar \frac{\partial}{\partial t} \psi(x,t).\]  In order to demonstrate that \(\psi(x,t) = A_0 e^{i(kx - \omega t)}\) satisfies this equation, you need to plug this equation for \(\psi(x,t)\) into both sides of the equation and show both sides are equal to one another.

First, take the second derivative of the wave function $\psi(x,t)$ with respect to $x$ in the cell below.  Multiply this by $-\hbar^2/(2m)$.  This will give you the left-hand side of Schrodinger's equation.

Next find the first derivative of $\psi(x,t)$ with respect to $t$.  Multiply this result by $i \hbar$ to get the right-hand side of Schrodinger's equation.   Compare this equation to the previous equation.  The two equations should agree if you recognize that $\omega = \hbar k^2/(2m)$.  

Use **.substitute(omega = hbar k^2/(2*M))** on this second equation and both equations should match, showing that this wave function satisfies Schrodinger's equation.
︡7c2f2d6f-44bf-49b3-beb8-c343f6763dae︡{"done":true,"md":"\n# For you to try:\n\nSchrodinger's equation is given by \\[\\frac{-\\hbar^2}{2m}\\frac{\\partial^2}{\\partial x^2} \\psi(x,t) +V(x)\\psi(x,t) = i\\hbar \\frac{\\partial}{\\partial t} \\psi(x,t).\\]  In order to demonstrate that \\(\\psi(x,t) = A_0 e^{i(kx - \\omega t)}\\) satisfies this equation, you need to plug this equation for \\(\\psi(x,t)\\) into both sides of the equation and show both sides are equal to one another.\n\nFirst, take the second derivative of the wave function $\\psi(x,t)$ with respect to $x$ in the cell below.  Multiply this by $-\\hbar^2/(2m)$.  This will give you the left-hand side of Schrodinger's equation.\n\nNext find the first derivative of $\\psi(x,t)$ with respect to $t$.  Multiply this result by $i \\hbar$ to get the right-hand side of Schrodinger's equation.   Compare this equation to the previous equation.  The two equations should agree if you recognize that $\\omega = \\hbar k^2/(2m)$.  \n\nUse **.substitute(omega = hbar k^2/(2*M))** on this second equation and both equations should match, showing that this wave function satisfies Schrodinger's equation."}
︠82893790-b860-4f12-bb37-c26e1c1b44c0︠
#Insert your work here


︡d8ab2c1c-b861-4629-867f-e32db26f2e1b︡
︠a27087dd-6de1-4c51-8e33-1df1272366edi︠

%md

# Another exampe of defining functionals involving derivatives

We will use the Python **def** command again to define our two functions.   To define the Hamiltonian operator $\hat{H} = \frac{-\hbar^2}{2m} \frac{d^2}{dx^2} $ we would use a Python definition that returns the desired function.  We can define the energy operator $\hat{E} = -i \hbar \frac{d}{dt}$ in a similar fashion.  These two functions can then be used to find $\hat{H}\psi(x,t)$ and $\hat{E}\psi(x,t)$

#### Defining Schrodinger's equation in SageMath

The left-hand side of Schrodinger's equation is called the Hamiltonian which you may have heard of in a classical physics course.  The Hamiltonian \(\hat{H}\) and energy \(\hat{E}\) are operators which must have a function to operate on.  In this worksheet we use the hat symbol \(\hat{}\) above the letter to indicate an operator but your instructor may use different notation.  The operator \(\hat{H}\) is called 'H-hat'.  

In terms of operators, Schrodinger's equation can be written as \(\hat{H}\psi(x,t) = \hat{E} \psi(x,t)\) where we understand that \(\hat{H}\) and \(\hat{E}\) operator on the functions immediately to their right.
︡49564e8b-f50a-432b-8f2e-aa9618c4c165︡{"done":true,"md":"\n# Another exampe of defining functionals involving derivatives\n\nWe will use the Python **def** command again to define our two functions.   To define the Hamiltonian operator $\\hat{H} = \\frac{-\\hbar^2}{2m} \\frac{d^2}{dx^2} $ we would use a Python definition that returns the desired function.  We can define the energy operator $\\hat{E} = -i \\hbar \\frac{d}{dt}$ in a similar fashion.  These two functions can then be used to find $\\hat{H}\\psi(x,t)$ and $\\hat{E}\\psi(x,t)$\n\n#### Defining Schrodinger's equation in SageMath\n\nThe left-hand side of Schrodinger's equation is called the Hamiltonian which you may have heard of in a classical physics course.  The Hamiltonian \\(\\hat{H}\\) and energy \\(\\hat{E}\\) are operators which must have a function to operate on.  In this worksheet we use the hat symbol \\(\\hat{}\\) above the letter to indicate an operator but your instructor may use different notation.  The operator \\(\\hat{H}\\) is called 'H-hat'.  \n\nIn terms of operators, Schrodinger's equation can be written as \\(\\hat{H}\\psi(x,t) = \\hat{E} \\psi(x,t)\\) where we understand that \\(\\hat{H}\\) and \\(\\hat{E}\\) operator on the functions immediately to their right."}
︠bd1431ef-ef1d-4317-8862-be98dd91363ds︠
hbar=var('hbar',latex_name=r'\hbar')  #This extra defintion will display the hbar symbol when using .show() or pretty_print


def H(f):    #The first line of the definition must include the name of the function, the variables, and end with a colon
    return -hbar^2/(2*m)*diff(f,x,2)   #all lines that make up the function must be indented four spaces (one tab); this is a requirement of Python


def E(f):   #This function is the right-hand side of Schrodinger's equation
    return i*hbar*diff(f,t)



Hamil_term=H(psi(x,t))   #Calculate the Hamiltonian operating on psi
Ener_term=E(psi(x,t))    #Calculate the energy operator on psi

Hamil_term.show()    #Show pretty versions of H(psi)
Ener_term.show()     #Show a pretty version of E(psi)




︡7a11f0a1-90c6-4ff9-95d8-f7a930c75092︡{"html":"<div align='center'>$\\displaystyle \\frac{A_{0} {{\\hbar}}^{2} k^{2} e^{\\left(-i \\, \\omega t + i \\, k x\\right)}}{2 \\, m}$</div>"}︡{"html":"<div align='center'>$\\displaystyle A_{0} {{\\hbar}} \\omega e^{\\left(-i \\, \\omega t + i \\, k x\\right)}$</div>"}︡{"done":true}︡
︠3b747197-f2cb-494b-b430-b861b94069b9i︠
%md

# Solving algebraic equations

- When solving equations you must remember the difference between $==$ and $=$.
    - The 'double-equals' sign $==$ is a comparison and is what you should use with the **solve()** command.
    - The "single-equals' sign $=$ is an assignment operator and sets the left hand side to the value on the right.
- The arguments of **solve()** are the equation to solve and the variable to solve for.
- Type **solve?** into an input cell to see the other options available for the **solve()** command.

#### Find the values of \(k\) that satisfy Schrodinger's equation

We've already specified the equation that relates \(k\) and \(\omega\) but the following will show you how to use SageMath to find this relation using Schrodinger's equation.  We'll use the previous definitions of \(H\) and \(E\) along with \(\psi(x,t)\) to find \(k\).


︡b7591473-781a-4dac-9431-2846581a5d8d︡{"done":true,"md":"\n# Solving algebraic equations\n\n- When solving equations you must remember the difference between $==$ and $=$.\n    - The 'double-equals' sign $==$ is a comparison and is what you should use with the **solve()** command.\n    - The \"single-equals' sign $=$ is an assignment operator and sets the left hand side to the value on the right.\n- The arguments of **solve()** are the equation to solve and the variable to solve for.\n- Type **solve?** into an input cell to see the other options available for the **solve()** command.\n\n#### Find the values of \\(k\\) that satisfy Schrodinger's equation\n\nWe've already specified the equation that relates \\(k\\) and \\(\\omega\\) but the following will show you how to use SageMath to find this relation using Schrodinger's equation.  We'll use the previous definitions of \\(H\\) and \\(E\\) along with \\(\\psi(x,t)\\) to find \\(k\\)."}
︠f2a653e0-97e0-4a31-bb7e-21281ee055f7s︠
ans = solve(H(psi(x,t))==E(psi(x,t)),k)
show(ans)

print "Here are two other examples using the solve command"
ans2 = solve(cos(k*x)==0,x)
pretty_print("The solution to $cos(k*x)=0$ is ", ans2 )  #This only gives one answer.  This equation holds true for *any* integer multiple of this answer.

ans3 = solve(x^2+x==6,x)
pretty_print("The solutions to $x^2+x = 6$ are ",ans3)



︡1254af9d-ca92-41ae-a9ed-166652f7bf51︡{"html":"<div align='center'>[$\\displaystyle k = -\\sqrt{2} \\sqrt{\\frac{m \\omega}{{{\\hbar}}}}$, $\\displaystyle k = \\sqrt{2} \\sqrt{\\frac{m \\omega}{{{\\hbar}}}}$]</div>"}︡{"stdout":"Here are two other examples using the solve command\n"}︡{"html":"<div align='center'>The solution to $cos(k*x)=0$ is  [$\\displaystyle x = \\frac{\\pi}{2 \\, k}$]</div>"}︡{"html":"<div align='center'>The solutions to $x^2+x = 6$ are  [$\\displaystyle x = \\left(-3\\right)$, $\\displaystyle x = 2$]</div>"}︡{"done":true}︡
︠4d4741f3-6057-4847-824a-f1c59cd0a84ci︠
%md

# For you to try:

Solve the equation \(H \psi(x,t) == E \psi(x,t)\) for **omega** rather than **k** and show the result is \(\omega = \frac{\hbar^2 k^2}{2m}\).
︡2d53b809-3ed8-4729-af10-91be3e46d1b5︡{"done":true,"md":"\n# For you to try:\n\nSolve the equation \\(H \\psi(x,t) == E \\psi(x,t)\\) for **omega** rather than **k** and show the result is \\(\\omega = \\frac{\\hbar^2 k^2}{2m}\\)."}
︠048de235-3f96-49c9-b524-52b8e6ad8c2a︠
#Insert your work here
︡f7fee28a-2d24-449b-b2c6-6db5f2bed42c︡
︠7b2e100c-147c-4325-97ba-036299055533i︠
%md
# Extract a solution from a list of answers


- The solution from the **solve()** command is a Python list and we can extract elements of the equations from the list.  Python starts indices at 0 rather than 1 so the first element in *ans* is *ans[0]* and the second element is *ans[1]*.  
- You can extract the **r**ight **h**and **s**ide of an equation using **.rhs()**.  
- To see if the equation holds true we need to compare the two sides using a double equals sign (==) and force SageMath to give us a Boolean answer by using **bool()**.

#### Double-check that $k$ satisfies the wave equation

To help practice using SageMath, we will take the solution obtained for \(k\) and plug it back into Schrodinger's equation (again).
︡d79a1b10-626c-415e-ac38-b6d95a8174a3︡{"done":true,"md":"# Extract a solution from a list of answers\n\n\n- The solution from the **solve()** command is a Python list and we can extract elements of the equations from the list.  Python starts indices at 0 rather than 1 so the first element in *ans* is *ans[0]* and the second element is *ans[1]*.  \n- You can extract the **r**ight **h**and **s**ide of an equation using **.rhs()**.  \n- To see if the equation holds true we need to compare the two sides using a double equals sign (==) and force SageMath to give us a Boolean answer by using **bool()**.\n\n#### Double-check that $k$ satisfies the wave equation\n\nTo help practice using SageMath, we will take the solution obtained for \\(k\\) and plug it back into Schrodinger's equation (again)."}
︠dcd3832e-8cee-4e5f-ab75-7e787a4a9a8bs︠
ans[0].show()  #Extract first equation from list of solutions
ans[1].show()  #Extract second equation from list of solutions

k1 = ans[0].rhs()   #Extract right-hand side of first solution...
k1.show()   #... and show the typeset version

k2 = ans[1].rhs()   #Extract right-hand side of second solution...
k2.show()        #... and make it look nice


t_or_f1=bool(H(psi(x,t).substitute(k=k1))==E(psi(x,t).substitute(k=k1)))   #Check if the two equations are equal for solution k1...
pretty_print("$k_1$ satisfies the Schrodinger equation:", t_or_f1)    #... and print the results


t_or_f2=bool(H(psi(x,t).substitute(k=k2))==E(psi(x,t).substitute(k=k2)))   #Check if the two equations are equal for solution k2...
pretty_print("$k_2$ satisfies the Schrodinger equation:", t_or_f2)    #... and print the results
︡2b753d8b-ffc9-4783-aa6d-ae139984dfcd︡{"html":"<div align='center'>$\\displaystyle k = -\\sqrt{2} \\sqrt{\\frac{m \\omega}{{{\\hbar}}}}$</div>"}︡{"html":"<div align='center'>$\\displaystyle k = \\sqrt{2} \\sqrt{\\frac{m \\omega}{{{\\hbar}}}}$</div>"}︡{"html":"<div align='center'>$\\displaystyle -\\sqrt{2} \\sqrt{\\frac{m \\omega}{{{\\hbar}}}}$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\sqrt{2} \\sqrt{\\frac{m \\omega}{{{\\hbar}}}}$</div>"}︡{"html":"<div align='center'>$k_1$ satisfies the Schrodinger equation: $\\displaystyle \\mathrm{True}$</div>"}︡{"html":"<div align='center'>$k_2$ satisfies the Schrodinger equation: $\\displaystyle \\mathrm{True}$</div>"}︡{"done":true}︡
︠49e6c163-56e3-4280-b666-e965355123eei︠
%md

# Integrating a function



- The command to integrate is **.integrate()** or you can apply **integrate()** as a function to the equation.  
- For an indefinite integral you only need to specify the variable of integration
- For a definite integral you must specify the variable of integration and the limits.
     - For example, to integrate the function \(f(x)\) from \(x=0\) to \(x=L\) you'd type:
             integrate(f(x),[x,0,L])


### Normalize the wave function and find the probability to find the free particle between to points in space

To normalize the wave function, the total probability to find the particle _somewhere_ must equal 1.  Unfortunately with the free particle you run into an issue because the free particle can be anywhere between $-\infty$ and $\infty$.  Using these limits results in a divergent integral.  To get around the infinite integral we will consider the case where the particle is limited to some region between $x=+L$ and $x=-L$ where $L \gg \lambda$ where $\lambda$ is the wavelength of the free particle.

︡b079cdb9-2dda-4c23-9344-336bbd3c842a︡{"done":true,"md":"\n# Integrating a function\n\n\n\n- The command to integrate is **.integrate()** or you can apply **integrate()** as a function to the equation.  \n- For an indefinite integral you only need to specify the variable of integration\n- For a definite integral you must specify the variable of integration and the limits.\n     - For example, to integrate the function \\(f(x)\\) from \\(x=0\\) to \\(x=L\\) you'd type:\n             integrate(f(x),[x,0,L])\n\n\n### Normalize the wave function and find the probability to find the free particle between to points in space\n\nTo normalize the wave function, the total probability to find the particle _somewhere_ must equal 1.  Unfortunately with the free particle you run into an issue because the free particle can be anywhere between $-\\infty$ and $\\infty$.  Using these limits results in a divergent integral.  To get around the infinite integral we will consider the case where the particle is limited to some region between $x=+L$ and $x=-L$ where $L \\gg \\lambda$ where $\\lambda$ is the wavelength of the free particle."}
︠5062d82e-e5ef-4746-8d21-bacb2c71ccb4s︠
norm_integral_1 = integrate(psi*psi.conjugate(),x); norm_integral_1    #Set the value of the indefnite integral equal to norm1 and then display norm1
solve(norm_integral_1 ==1,A_0)  #Solve for the values of A_0


L=var('L')  #Define L as a variable
assume(L,'real')  #Specify that L is a real quantity
norm_integral_2 = integrate(psi*psi.conjugate(),[x,-L,L]);norm_integral_2   #Solve the definite integral using -L and L as the lower and upper bounds
norm_const=solve(norm_integral_2==1,A_0);norm_const  #Solve for A_0
pretty_print("If the particle is confined to a region of length 2L, the normalization constant $A_0$ is ", norm_const[1].rhs() )

pretty_print("The wave function \(\psi(x,t)\), including the normalization constant is \(psi(x,t)=\)", psi(x,t).substitute(A_0=norm_const[1].rhs()))



︡f1e60899-1cd9-4130-b167-8a2cbe7327e0︡{"stdout":"(x, t) |--> A_0^2*x\n"}︡{"stdout":"[A_0 == -1/sqrt(x), A_0 == 1/sqrt(x)]\n"}︡{"stdout":"t |--> 2*A_0^2*L\n"}︡{"stdout":"[A_0 == -sqrt(1/2)/sqrt(L), A_0 == sqrt(1/2)/sqrt(L)]"}︡{"stdout":"\n"}︡{"html":"<div align='center'>If the particle is confined to a region of length 2L, the normalization constant $A_0$ is  $\\displaystyle \\frac{\\sqrt{\\frac{1}{2}}}{\\sqrt{L}}$</div>"}︡{"html":"<div align='center'>The wave function \\(\\psi(x,t)\\), including the normalization constant is \\(psi(x,t)=\\) $\\displaystyle \\frac{\\sqrt{\\frac{1}{2}} e^{\\left(-i \\, \\omega t + i \\, k x\\right)}}{\\sqrt{L}}$</div>"}︡{"done":true}︡
︠3b104688-6bb2-4197-abbb-eda46610dbaei︠
%md

# Other ways to do things

In addition to using the "dot" notation to operate on functions, you can also use various operations as functions.  For instance, *derivative(psi,x)* gives the same result as *psi.derivative(x)*
︡cae82473-5453-490b-8471-bd8a4161613a︡{"done":true,"md":"\n# Other ways to do things\n\nIn addition to using the \"dot\" notation to operate on functions, you can also use various operations as functions.  For instance, *derivative(psi,x)* gives the same result as *psi.derivative(x)*"}
︠4c46dc53-e3c4-4561-8505-7ed649f64275s︠
psi.derivative(x,2)
derivative(psi,x,2)

psi.integrate(x)
integrate(psi,x)

psi.real()
real(psi)

psi.imag()
imag(psi)

psi.show()
show(psi)
︡54205721-32dc-42f4-a368-b7ca5f75b70e︡{"stdout":"(x, t) |--> -A_0*k^2*e^(-I*omega*t + I*k*x)\n"}︡{"stdout":"(x, t) |--> -A_0*k^2*e^(-I*omega*t + I*k*x)\n"}︡{"stdout":"(x, t) |--> -I*A_0*e^(-I*omega*t + I*k*x)/k\n"}︡{"stdout":"(x, t) |--> -I*A_0*e^(-I*omega*t + I*k*x)/k\n"}︡{"stdout":"(x, t) |--> A_0*cos(-omega*t + k*x)\n"}︡{"stdout":"(x, t) |--> A_0*cos(-omega*t + k*x)\n"}︡{"stdout":"(x, t) |--> A_0*sin(-omega*t + k*x)\n"}︡{"stdout":"(x, t) |--> A_0*sin(-omega*t + k*x)\n"}︡{"html":"<div align='center'>$\\displaystyle \\left( x, t \\right) \\ {\\mapsto} \\ A_{0} e^{\\left(-i \\, \\omega t + i \\, k x\\right)}$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\left( x, t \\right) \\ {\\mapsto} \\ A_{0} e^{\\left(-i \\, \\omega t + i \\, k x\\right)}$</div>"}︡{"done":true}︡
︠695179c7-deab-40d4-bc81-e450f4021085i︠
%md

# Project Ideas and Problems to Solve

1. Have students find realistic values for masses and velocities for electrons, protons, or neutrons and use de Broglie's equation to find \(k\), \(\omega\), and total energy \(E\).

2. Plot wave functions for electrons and protons on the same plot and have students explain why electron microscopes are used for imaging small objects while 'proton microscopes' aren't as useful.

3. Have students complete homework problems from the end of the textbook chapter.
︡1a53c8af-f2c9-4357-9522-7b884d3b1faa︡{"done":true,"md":"\n# Project Ideas and Problems to Solve\n\n1. Have students find realistic values for masses and velocities for electrons, protons, or neutrons and use de Broglie's equation to find \\(k\\), \\(\\omega\\), and total energy \\(E\\).\n\n2. Plot wave functions for electrons and protons on the same plot and have students explain why electron microscopes are used for imaging small objects while 'proton microscopes' aren't as useful.\n\n3. Have students complete homework problems from the end of the textbook chapter."}
︠6b9ba9e2-af6a-4ed9-83a9-27fd8e3206a8︠









