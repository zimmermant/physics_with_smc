︠e5e1d824-f052-42d2-8065-1be61e5267e4i︠
%md

The units we worked with in the previous worksheet were actually variables, just like $x$ or $y$.  In SageMath, all variables must be either assigned a numerical value or declared to be a variable using the `var()` command.

# <img src="sagemathcloud_logo1.png" width="48">  Defining variables and functions


- All variables must be explicitly declared (except for the variable 'x' and variables used as arguments of functions) using the **var()** command
- Variables cannot start with numbers or contain spaces but they can contain underscores
- Functions can be evaluated by inserting values for the arguments
- To evaluate an input cell in this worksheet, put the cursor in the cell and hit Shift+Enter.  The output will be displayed in the cell below the input cell.
︡8fbd2fde-d575-411c-adfe-30611b997d35︡{"done":true,"md":"\nThe units we worked with in the previous worksheet were actually variables, just like $x$ or $y$.  In SageMath, all variables must be either assigned a numerical value or declared to be a variable using the `var()` command.\n\n# <img src=\"sagemathcloud_logo1.png\" width=\"48\">  Defining variables and functions\n\n\n- All variables must be explicitly declared (except for the variable 'x' and variables used as arguments of functions) using the **var()** command\n- Variables cannot start with numbers or contain spaces but they can contain underscores\n- Functions can be evaluated by inserting values for the arguments\n- To evaluate an input cell in this worksheet, put the cursor in the cell and hit Shift+Enter.  The output will be displayed in the cell below the input cell."}
︠cb691daa-d64f-462b-93b3-bc87e1ca187es︠
var('y,z, F_1, F_2, m_1, m_2, a_1, a_2')  #Declaring some variables to use

F_net = F_1 + F_2
F_net


A=10  #Don't need to declare variables if you assign values to them
B=23
C= A*B  #Notice the value of C is not printed when you assign it to A*B
C  #Now the value of C will be printed in the output below
︡8222e415-19ff-4cb3-b2e6-e15b99c5e58a︡{"stdout":"(y, z, F_1, F_2, m_1, m_2, a_1, a_2)\n"}︡{"stdout":"F_1 + F_2\n"}︡{"stdout":"230\n"}︡{"done":true}︡
︠552e71ea-fec7-464e-80d9-c9bb6f283e93i︠
%md

To output text you can use the `pretty_print()` command.  This uses [LaTeX](https://en.wikipedia.org/wiki/LaTeX) to typeset the equations and make them easier to read.  Use `pretty_print()` any time you want text to show up in the output cell.  Notice that the variables F_1 and F_2 are displayed as $F_1$ and $F_2$.

# <img src="sagemathcloud_logo1.png" width="48">  Outputting Pretty Text

- Use `pretty_print()`
- Everything to be printed should be inside parentheses
- Text should be enclosed with quotation marks (either ' or " works)
- Do display the value of a variable or function, do not enclose variable inside quotes
- You can string quoted text and variables together by separating each part with a comma



︡19fb75ea-0da8-4aaa-87e7-2f822b33246e︡{"done":true,"md":"\nTo output text you can use the `pretty_print()` command.  This uses [LaTeX](https://en.wikipedia.org/wiki/LaTeX) to typeset the equations and make them easier to read.  Use `pretty_print()` any time you want text to show up in the output cell.  Notice that the variables F_1 and F_2 are displayed as $F_1$ and $F_2$.\n\n# <img src=\"sagemathcloud_logo1.png\" width=\"48\">  Outputting Pretty Text\n\n- Use `pretty_print()`\n- Everything to be printed should be inside parentheses\n- Text should be enclosed with quotation marks (either ' or \" works)\n- Do display the value of a variable or function, do not enclose variable inside quotes\n- You can string quoted text and variables together by separating each part with a comma"}
︠a6e7da68-429d-4212-a48f-ea16748408c8s︠

pretty_print('The net force is F_net = ', F_net)  #pretty_print

C= A*B  #Notice the value of C is not printed when you assign it to A*B
pretty_print('The values of A*B is ',C)

pretty_print('You can write a sentence with multiple values like C = ', C, "by separating each variable or string of text with a comma.  Thus the net force F_net is ", F_net)
︡7164dfcc-be0b-41c2-9e2a-a0485875d6d2︡{"html":"<div align='center'>The net force is F_net =  $\\displaystyle F_{1} + F_{2}$</div>"}︡{"html":"<div align='center'>The values of A*B is  $\\displaystyle 230$</div>"}︡{"html":"<div align='center'>You can write a sentence with multiple values like C =  $\\displaystyle 230$ by separating each variable or string of text with a comma.  Thus the net force F_net is  $\\displaystyle F_{1} + F_{2}$</div>"}︡{"done":true}︡
︠db71853f-92a3-48c4-84c8-a1c046886b6ei︠
%md

### For You To Try

- Define the variables F_3, F_4, F_5, and F_6
- Set F_net equal to the sum of all six forces
- Use pretty_print to write out a sentence about the net force and print out the value of F_net
︡9d3e59e4-34ef-4bf6-aa41-7473709554fa︡{"done":true,"md":"\n### For You To Try\n\n- Define the variables F_3, F_4, F_5, and F_6\n- Set F_net equal to the sum of all six forces\n- Use pretty_print to write out a sentence about the net force and print out the value of F_net"}
︠0828ab79-b46e-4a11-86fd-6beaa71f8e87s︠
#Input your work here
︡f83516b5-bae6-4115-8612-b2a216e53602︡{"done":true}︡
︠c7d634b4-3b26-4548-b3ac-b69c7b84e8b1i︠
%md

You can define functions in SageMath by giving the function a name and specifying the arguments of the function in parentheses after the function name.  For example, to define a function $f(x)$ you might type `f(x)=3*x^2+2*x-1`.  You can also have functions of multiple variables such as `h(x,y,z)=3*x*y-z^3`

### <img src="sagemathcloud_logo1.png" width="48"> Defining Functions
- Function names follow same convention as variables; Must start with a letter, can contain numbers, can't contain spaces (only underscores `_`), and no special characters
- Format is `function_name(variable1,variable2,)= equation` such as `g(a,b)=2*a+3*b`
- Functions can be evaluated at specific points by entering numbers in for the arguments such as `g(1,2)`
︡f92c77ea-881d-4bd0-a952-fc77140c62e5︡{"done":true,"md":"\nYou can define functions in SageMath by giving the function a name and specifying the arguments of the function in parentheses after the function name.  For example, to define a function $f(x)$ you might type `f(x)=3*x^2+2*x-1`.  You can also have functions of multiple variables such as `h(x,y,z)=3*x*y-z^3`\n\n### <img src=\"sagemathcloud_logo1.png\" width=\"48\"> Defining Functions\n- Function names follow same convention as variables; Must start with a letter, can contain numbers, can't contain spaces (only underscores `_`), and no special characters\n- Format is `function_name(variable1,variable2,)= equation` such as `g(a,b)=2*a+3*b`\n- Functions can be evaluated at specific points by entering numbers in for the arguments such as `g(1,2)`"}
︠9554d566-74d3-4624-b08e-586824948289︠
var('G')
F_g(m_1,m_2,r) = G*m_1*m_2/r^2

pretty_print('The gravitational force is F_g = ', F_g(m_1,m_2,r))

︡dd34b59d-3c87-4d88-81ef-5d7c7358e0cf︡{"stdout":"G\n"}︡{"html":"<div align='center'>The gravitational force is F_g =  $\\displaystyle \\frac{G m_{1} m_{2}}{r^{2}}$</div>"}︡{"done":true}︡
︠9fe1e9f8-0808-4682-8238-78e606d50dc0i︠
%md

### For You To Try

- Calculate the force exerted on a human while on the surface of the Earth.
    - The mass of the Earth is $m_{Earth} = 5.97\times10^{24}\ kg$
    - The radius of the Earth is $r_{Earth} = 6.37\times10^{6}\ m$
    - The gravitational constant is $G = 6.67\times10^{-11}\ N m^2/kg^2$
- Calculate the force exerted on the same human while on the international space station which is roughly 400 km above the surface of the Earth
︡d420b095-ebd7-4ea2-b71f-13df7719eca3︡{"done":true,"md":"\n### For You To Try\n\n- Calculate the force exerted on a human while on the surface of the Earth.\n    - The mass of the Earth is $m_{Earth} = 5.97\\times10^{24}\\ kg$\n    - The radius of the Earth is $r_{Earth} = 6.37\\times10^{6}\\ m$\n    - The gravitational constant is $G = 6.67\\times10^{-11}\\ N m^2/kg^2$\n- Calculate the force exerted on the same human while on the international space station which is roughly 400 km above the surface of the Earth"}
︠96d3011c-450d-42a4-80d1-ae93a9b4210cs︠
#Input your work here
︡ac86a69f-d766-44ab-bdbd-435f26616c87︡{"done":true}︡
︠9261ae4c-7eb9-46fe-a9e3-2b64d61d908di︠
%md

You can plot functions in SageMath but all variables except the plotting variable must have a value.  If we want to plot the gravitational force vs. separation distance $r$, we have to input values for $G$, $m_1$, and $m_2$.  If you only care about the shape of the graph you can input $1$ for all other variables.  In this case we'll use the numbers for a human and the Earth.

### <img src="sagemathcloud_logo1.png" width="48"> Plotting Functions and Substitutions
- To substitute a numerical value in for a variable, add `.substitute()` to the end of the function
- You can substitute as many values as you want, separating each value with a comma
- To create a plot use the `plot()` command
    - `show()` must be used to display the plot on the window
    - You can specify the variable, and minimum and maximum values for plotting
        - e.g. `plot(g(x),x,0,1000)`
︡54a5dbaf-9a8f-4618-9b06-8c981f43619f︡{"done":true,"md":"\nYou can plot functions in SageMath but all variables except the plotting variable must have a value.  If we want to plot the gravitational force vs. separation distance $r$, we have to input values for $G$, $m_1$, and $m_2$.  If you only care about the shape of the graph you can input $1$ for all other variables.  In this case we'll use the numbers for a human and the Earth.\n\n### <img src=\"sagemathcloud_logo1.png\" width=\"48\"> Plotting Functions and Substitutions\n- To substitute a numerical value in for a variable, add `.substitute()` to the end of the function\n- You can substitute as many values as you want, separating each value with a comma\n- To create a plot use the `plot()` command\n    - `show()` must be used to display the plot on the window\n    - You can specify the variable, and minimum and maximum values for plotting\n        - e.g. `plot(g(x),x,0,1000)`"}
︠00f48afb-1e72-4f67-a075-ae2848c1b7c7︠

F_plot(r) = F_g(100,5.97*10^24,r).substitute(G=6.67*10^(-11))  #m_1 and m_2 are arguments of the function but G is not
pretty_print(F_plot(r))

p = plot(F_plot(r),r,6*10^6,10^8)  #'p' is the name we give to this plot.  Plotting from surface of Earth out to 10^8 m from center
show(p)   #Display graph named 'p' on the screen
︡30a2f4ae-2c2a-43ae-97d8-46a789395ebe︡{"html":"<div align='center'>$\\displaystyle \\frac{3.98199000000000 \\times 10^{16}}{r^{2}}$</div>"}︡{"file":{"filename":"/projects/d18eeda9-38fb-4d20-9a0a-4afa03a182aa/.sage/temp/compute4-us/15441/tmp_UdIvEA.svg","show":true,"text":null,"uuid":"c7d38939-eb9d-4794-8cdc-e721bd9087e2"},"once":false}︡{"html":"<div align='center'></div>"}︡{"done":true}︡
︠689efa9f-51eb-441d-82a3-1a18b5dfe129i︠
%md

You can plot more than one function on a graph.  You can also add labels to the graphs and change the line used to make the graphs.  For this example we'll plot the potential energy of two different springs on the same graph.

### <img src="sagemathcloud_logo1.png" width="48"> Plotting Functions and Substitutions
- To add multiple plots to a single graph, assign plots to variable names and add them together
    - e.g. If you call one plot `p`, another `q`, and a third plot `r`, then type `s=p+q+r` and then `show(s)` to plot all three
- Add `title='MyTitle' to add `MyTitle` as the name of the graph
- You can change the color of a plot by specifying its color.  Color names must be enclosed in quotes
    - e.g. `color='black'`
- You can name the x-axis and y-axis by using the `axes_labels=[]` command
- To create a lengend for your graph, specify the name of each plot using `legend_label=`
︡9f60a914-f14c-4ed2-a683-4cbaf4e25d8f︡{"done":true,"md":"\nYou can plot more than one function on a graph.  You can also add labels to the graphs and change the line used to make the graphs.  For this example we'll plot the potential energy of two different springs on the same graph.\n\n### <img src=\"sagemathcloud_logo1.png\" width=\"48\"> Plotting Functions and Substitutions\n- To add multiple plots to a single graph, assign plots to variable names and add them together\n    - e.g. If you call one plot `p`, another `q`, and a third plot `r`, then type `s=p+q+r` and then `show(s)` to plot all three\n- Add `title='MyTitle' to add `MyTitle` as the name of the graph\n- You can change the color of a plot by specifying its color.  Color names must be enclosed in quotes\n    - e.g. `color='black'`\n- You can name the x-axis and y-axis by using the `axes_labels=[]` command\n- To create a lengend for your graph, specify the name of each plot using `legend_label=`"}
︠e6632e13-d5ba-4b06-82d0-cd99936c5a5es︠
k_1=3
k_2=7

g(x)= 1/2*k_1*x^2
h(x)=1/2*k_2*x^2

p1=plot(g(x),x,0,10,title='Potential Energy of Two Springs', color='red',axes_labels=['Position x','Energy'],legend_label='k_1')
p2=plot(h(x),x,0,10,color='green',legend_label='k_2')
P=p1+p2
show(P)
︡cbee2645-8e52-4584-baeb-8d687feb908d︡{"file":{"filename":"/projects/d18eeda9-38fb-4d20-9a0a-4afa03a182aa/.sage/temp/compute4-us/15441/tmp_61QkLA.svg","show":true,"text":null,"uuid":"d9f7694e-31ad-4a76-9fc1-4908e8f71f71"},"once":false}︡{"html":"<div align='center'></div>"}︡{"done":true}︡
︠d71111b9-c8fd-4692-8ae1-a5c46acaccd4i︠
%md

### For You To Try

- Plot the gravitational potential energy using $U_{grav} = m g h$ for three different objects
    - Label each object and create a legend
    - Label your axes
    - Include a title on your graph
    - Each plot should be a different color
︡7d42dd43-7a29-4860-b2cf-0a496bfa7c24︡{"done":true,"md":"\n### For You To Try\n\n- Plot the gravitational potential energy using $U_{grav} = m g h$ for three different objects\n    - Label each object and create a legend\n    - Label your axes\n    - Include a title on your graph\n    - Each plot should be a different color"}
︠7394fa22-4119-492f-a00e-7e2859ef011f︠
#Input your work here









