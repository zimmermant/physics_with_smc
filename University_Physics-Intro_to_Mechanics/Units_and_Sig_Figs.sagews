︠943d01ac-ff05-4271-b90f-e1c7c4d7cf96i︠
%md

SageMath is similar to Mathematica, Matlab, Maple, or other mathematical software programs.  It simplifies numerical and algebraic operations.  Each worksheet (this page is a worksheet) is broken into cells.  The two types of cells are input cells and output cells.  You type your calculations into into an input cell and then hit Shift+Enter to evaluate the cell. SageMath provides the answers to your calculations in an output cell.  Click on the input cell below and hit Shift+Enter to evaluate the calculations.

###  <img src="sagemathcloud_logo1.png" width="48">  Evaluate a cell
- Place the cursor in the input cell and hit `Shift+Enter` to tell SageMath to evaluate a cell.
︡e1bc9cd3-9518-4e92-842c-9d15548b8197︡{"done":true,"md":"\nSageMath is similar to Mathematica, Matlab, Maple, or other mathematical software programs.  It simplifies numerical and algebraic operations.  Each worksheet (this page is a worksheet) is broken into cells.  The two types of cells are input cells and output cells.  You type your calculations into into an input cell and then hit Shift+Enter to evaluate the cell. SageMath provides the answers to your calculations in an output cell.  Click on the input cell below and hit Shift+Enter to evaluate the calculations.\n\n###  <img src=\"sagemathcloud_logo1.png\" width=\"48\">  Evaluate a cell\n- Place the cursor in the input cell and hit `Shift+Enter` to tell SageMath to evaluate a cell."}
︠b18c8b43-b86a-4c29-af89-907f25622c3as︠
#This is an input cell
#Any text that appears after a hashtag is a comment and is not processed by SageMath
#Click in this cell and hit Shift+Enter to evaluate it
10+20+30
2*17*21
5^5
1/3
3/4
(2^7)/(3^2+1)

︡6ac5e4ae-3a6b-4446-aa39-f4192285abaf︡{"stdout":"60\n"}︡{"stdout":"714\n"}︡{"stdout":"3125\n"}︡{"stdout":"1/3\n"}︡{"stdout":"3/4\n"}︡{"stdout":"64/5\n"}︡{"done":true}︡
︠18fb2473-9eb5-4c62-9bcf-4298e1c24757i︠
%md

Notice how $1/3$, $3/4$, and $64/5$ are left as ratios and not converted to decimals.  This is because SageMath leaves results in their exact form and does not convert the results to decimal-form unless you tell it to.  To evaluate $1/3$ and get the answer to three significant figures you would use the numerical approximation command `n(1/3,digits=3)`.

### <img src="sagemathcloud_logo1.png" width="48"> Get a numerically approximate answer and specify the number of significant figures
- Use `n()` to get an approximate answer
    - Place the equation to evaluate inside the parentheses
    - Include `digits=5` to get a numerical result to five significant figures
        - Don't forget to put a comma between your equation and `digits=5`
︡5084bae8-e6f1-4df1-b931-3509d4c9eb94︡{"done":true,"md":"\nNotice how $1/3$, $3/4$, and $64/5$ are left as ratios and not converted to decimals.  This is because SageMath leaves results in their exact form and does not convert the results to decimal-form unless you tell it to.  To evaluate $1/3$ and get the answer to three significant figures you would use the numerical approximation command `n(1/3,digits=3)`.\n\n### <img src=\"sagemathcloud_logo1.png\" width=\"48\"> Get a numerically approximate answer and specify the number of significant figures\n- Use `n()` to get an approximate answer\n    - Place the equation to evaluate inside the parentheses\n    - Include `digits=5` to get a numerical result to five significant figures\n        - Don't forget to put a comma between your equation and `digits=5`"}
︠c2be297a-3511-48bc-9849-44585264b465s︠
#Try changing the number of significant figures for each of the calculations
n(1/3,digits=1) 
n(3/4, digits=1) 
n(7/4,digits=2) 
n(pi,digits=4) 
n(e,digits=4)
︡785c0209-e8a7-4b0b-8501-f269548beea1︡{"stdout":"0.33\n"}︡{"stdout":"0.75\n"}︡{"stdout":"1.8\n"}︡{"stdout":"3.142\n"}︡{"stdout":"2.718\n"}︡{"done":true}
︠c2494e7c-840a-44f2-ac70-68f37f805c28i︠
%md

### <img src="homework.png" width="100"> Try it yourself


Evaluate the following to three significant figures 

1. $\frac{684}{43.0}$

1. $\frac{28.0}{0.0458}$

1. $\frac{2.68}{426.0}$
︡b6fcfac9-9c00-4119-8271-a022b7b9970b︡{"done":true,"md":"\n### <img src=\"homework.png\" width=\"100\"> Try it yourself\n\n\nEvaluate the following to three significant figures \n\n1. $\\frac{684}{43.0}$\n\n1. $\\frac{28.0}{0.0458}$\n\n1. $\\frac{2.68}{426.0}$"}
︠5cbd93cc-e406-4d92-ba3f-02462bf5d156︠
#Insert your work here and then hit Shift+Enter to evaluate
︡de12b33a-a77c-4b85-8650-13fb31d44e0c︡
︠11b0c05a-4dab-4cd0-9102-a7f1addc0790i︠
%md

SageMath comes with units built in.  The units are created by calling the `units` method but I find it is easiest to define units in terms of the standard abbreviations.

The standard SI units are the following:

- Length: meter (abbreviated as **m**)
- Time: second (abbreviated as **s**)
- Mass: kilogram (abbreviated as **kg**)
- Force: Newton (abbreviated as **N**)

The customary U.S. units of measure are:

- Length: foot (**ft**)
- Time: second (**s**)
- Mass: slug (**slug**)
- Force: pound (**lb**)

An easy way to convert units is to define new units in terms of the original units.  For instance, if your results are given in centimeters you could add the code `cm=m/100`.  Then typing in an answer in `cm` it would be converted into `m`.

### <img src="sagemathcloud_logo1.png" width="48"> Defining units
- Some of the units defined in SageMath include:
    - units.length.meter
    - units.length.centimeter
    - units.length.millimeter
    - units.length.micron
    - units.length.kilometer
    - units.length.foot
    - units.length.inch
    - units.length.mile
    - units.length.yard
- A complete list of all units can be found in the [units.py](https://github.com/sagemath/sagelib/blob/master/sage/symbolic/units.py) file.
︡f7c6d6a8-f963-4f87-a2dc-52a9b7a3bf9d︡{"done":true,"md":"\nSageMath comes with units built in.  The units are created by calling the `units` method but I find it is easiest to define units in terms of the standard abbreviations.\n\nThe standard SI units are the following:\n\n- Length: meter (abbreviated as **m**)\n- Time: second (abbreviated as **s**)\n- Mass: kilogram (abbreviated as **kg**)\n- Force: Newton (abbreviated as **N**)\n\nThe customary U.S. units of measure are:\n\n- Length: foot (**ft**)\n- Time: second (**s**)\n- Mass: slug (**slug**)\n- Force: pound (**lb**)\n\nAn easy way to convert units is to define new units in terms of the original units.  For instance, if your results are given in centimeters you could add the code `cm=m/100`.  Then typing in an answer in `cm` it would be converted into `m`.\n\n### <img src=\"sagemathcloud_logo1.png\" width=\"48\"> Defining units\n- Some of the units defined in SageMath include:\n    - units.length.meter\n    - units.length.centimeter\n    - units.length.millimeter\n    - units.length.micron\n    - units.length.kilometer\n    - units.length.foot\n    - units.length.inch\n    - units.length.mile\n    - units.length.yard\n- A complete list of all units can be found in the [units.py](https://github.com/sagemath/sagelib/blob/master/sage/symbolic/units.py) file."}
︠174b205f-96d4-4e9f-9382-940a8b8be145s︠
m=units.length.meter
ft=units.length.foot

13*ft
2.0*m

#To convert results in centimeters or nanometers into meters you could do the following:
dm=m*10^(-1)  #decimeter
nm=m*10^(-9)  #nanometer

distance_1=13*dm
distance_1
distance_2=55*nm
distance_2

#The numerical approximation command n() cannot handle variables so you must divide out variables and then add them back in by hand

#Divide distance_1 by m to get rid of the m symbol, then multiply the m back on
n(distance_1/m,digits=2)*m

#Divide distance_2 by m when using the n() command, then multiply the m back on to the answer
n(distance_2/m,digits=3)*m

︡aafbe124-f804-4bb1-9def-0801efb1cc9d︡{"stdout":"13*foot\n"}︡{"stdout":"2.00000000000000*meter\n"}︡{"stdout":"13/10*meter\n"}︡{"stdout":"11/200000000*meter\n"}︡{"stdout":"1.3*meter\n"}︡{"stdout":"(5.50e-8)*meter\n"}︡{"done":true}︡
︠f7c5ee7f-5dc7-4d30-8198-ae1f59ca7d62i︠
%md

### <img src="homework.png" width="100"> Try It Yourself

Evaluate the following to **four** significant figures and convert all answers to standard SI units (m, s, N, kg)

1. $\frac{684 \mu m}{43 ms}$

1. $\frac{28 ms}{0.0458 Mm}$

1. $\frac{2.68 mm}{426 Mg}$

Remember that:
- $\mu = $ micro $ = 1/1000000= 10^{-6}$
- $m = $ milli $ = 1/1000 = 10^{-3}$
- $M = $ Mega $ = 1000000 = 10^{6}$

︡4b21c23d-c225-43b5-9b63-79b1fb7d5566︡{"done":true,"md":"\n### <img src=\"homework.png\" width=\"100\"> Try It Yourself\n\nEvaluate the following to **four** significant figures and convert all answers to standard SI units (m, s, N, kg)\n\n1. $\\frac{684 \\mu m}{43 ms}$\n\n1. $\\frac{28 ms}{0.0458 Mm}$\n\n1. $\\frac{2.68 mm}{426 Mg}$\n\nRemember that:\n- $\\mu = $ micro $ = 1/1000000= 10^{-6}$\n- $m = $ milli $ = 1/1000 = 10^{-3}$\n- $M = $ Mega $ = 1000000 = 10^{6}$"}
︠615bfcf4-1d95-495d-b4ce-7f847896991e︠
#Insert your work here
︡db0e5c11-564a-4ef8-95e1-04d44145853d︡
︠8ded5b86-2e79-44d8-b125-4a5d33b475d7i︠
%md

Unit conversion can be accomplished using the `.substitute()` command.  You can tell SageMath to substitute one variable in for another.  For example, to convert from meters to feet, substitute in `m=3.28084*ft` and evaluate it.

### <img src="sagemathcloud_logo1.png" width="48"> Substitute one variable for another
- The `.substitute()` command is added to the end of a variable
    - To replace `ft` with `0.3048*m` in the variable called `d`, you would type `d.substitute(ft=0.3048*m)`
- The arguments in the parentheses sets the orignal variable equal to the new value
- You can specify several substitutions at once by separating substitutions with commas
    - To replace `ft` with `0.3048*m` and `ns` with `s*10^(-9)` in the variable `v` you would type `v.substitute(ft=0.3048*m, ns=s*10^(-9))`
- This isn't just for unit conversion, this works for *any* two variables in a function
    - To replace `y` with `3*x-5` in function `f` you would type `f.substitute(y=3*x-5)`
- There is a convert feature built in to SageMath but I find substitution more intuitive

︡46407fb6-43b0-45d0-ae2d-d58238bf18b5︡{"done":true,"md":"\nUnit conversion can be accomplished using the `.substitute()` command.  You can tell SageMath to substitute one variable in for another.  For example, to convert from meters to feet, substitute in `m=3.28084*ft` and evaluate it.\n\n### <img src=\"sagemathcloud_logo1.png\" width=\"48\"> Substitute one variable for another\n- The `.substitute()` command is added to the end of a variable\n    - To replace `ft` with `0.3048*m` in the variable called `d`, you would type `d.substitute(ft=0.3048*m)`\n- The arguments in the parentheses sets the orignal variable equal to the new value\n- You can specify several substitutions at once by separating substitutions with commas\n    - To replace `ft` with `0.3048*m` and `ns` with `s*10^(-9)` in the variable `v` you would type `v.substitute(ft=0.3048*m, ns=s*10^(-9))`\n- This isn't just for unit conversion, this works for *any* two variables in a function\n    - To replace `y` with `3*x-5` in function `f` you would type `f.substitute(y=3*x-5)`\n- There is a convert feature built in to SageMath but I find substitution more intuitive"}
︠2d3e400b-3b97-43ea-8740-9a191f160ad5s︠
#Convert "dist" from meters to feet
dist=71*m  #Define variable "dist"
dist.substitute(m=3.28084*ft)  #Convert "dist" from meter to feet

#One trick you can use to get the correct number of significant figures is to leave off the new unit, use n(), then add the new unit on to the end
n(dist.substitute(m=3.28084),digits=2)*ft   #Notice how the new units are OUTSIDE the n() command


#Convert "vel" from miles/hour to meters/second
var('mi,hr')  #I want to use miles and hours so I need to define these as variables

vel=17.0*mi/hr  #Define the velocity variable called "vel"
new_vel=vel.substitute(mi=1609*m,hr=60*60*s)  #Notice that SageMath doesn't print out a result when you assign an evaluation to a variable...
new_vel    #... but by evaluating the new variable SageMath will print out the results

#To get the correct number of sig. figs.:
n(vel.substitute(mi=1609,hr=60*60),digits=2)*m/s


︡18ccd7ce-9c7d-4cb5-9c02-fc1402704bbb︡{"stdout":"232.939640000000*ft\n"}︡{"stdout":"230.*ft\n"}︡{"stdout":"(mi, hr)\n"}︡{"stdout":"7.59805555555556*m/s\n"}︡{"stdout":"7.6*m/s\n"}︡{"done":true}︡
︠8c53403e-cb7e-4c00-8c7b-9d7798d8a150i︠
%md

### <img src="homework.png" width="48"> Try It Yourself

1) Calculate the following quantities using the correct number of signficant figures:
- $\frac{32.01\ ft}{22.3\ s}$
- $\frac{17\ mi}{27\ min}$
- $\frac{1208\ m}{0.1\ hr}$

Hint: Units of time include:
- units.time.second
- units.time.minute
- units.time.hour
︡cb664de0-5e5b-4b57-8060-61a6ca3adfef︡{"done":true,"md":"\n### <img src=\"homework.png\" width=\"48\"> Try It Yourself\n\n1) Calculate the following quantities using the correct number of signficant figures:\n- $\\frac{32.01\\ ft}{22.3\\ s}$\n- $\\frac{17\\ mi}{27\\ min}$\n- $\\frac{1208\\ m}{0.1\\ hr}$\n\nHint: Units of time include:\n- units.time.second\n- units.time.minute\n- units.time.hour"}
︠20f71285-ac1c-446f-8184-66805ab8ab41︠
#Input your work here
︡a152a520-c986-48af-b623-05b2ba78cbdc︡
︠dfc0b616-6864-452d-a083-1587587e76f7︠
︡5c6845fb-9e97-4558-8ef8-f9171ad54f9f︡
︠3aefadff-97f6-496e-bd29-702cbe082399i︠
%md

You can define functions in SageMath by giving the function a name and specifying the arguments of the function in parentheses after the function name.  For example, to define a function $f(x)$ you might type `f(x)=3*x^2+2*x-1`.  You can also have functions of multiple variables such as `h(x,y,z)=3*x*y-z^3`

### <img src="sagemathcloud_logo1.png" width="48"> Defining Functions
- Function names follow same convention as variables; Must start with a letter, can contain numbers, can't contain spaces (only underscores `_`), and no special characters
- Format is `function_name(variable1,variable2,)= equation` such as `g(a,b)=2*a+3*b`
- Functions can be evaluated at specific points by entering numbers in for the arguments such as `g(1,2)`
︡781dbbc4-dacd-45bd-877f-6a6166004039︡{"done":true,"md":"\nYou can define functions in SageMath by giving the function a name and specifying the arguments of the function in parentheses after the function name.  For example, to define a function $f(x)$ you might type `f(x)=3*x^2+2*x-1`.  You can also have functions of multiple variables such as `h(x,y,z)=3*x*y-z^3`\n\n### <img src=\"sagemathcloud_logo1.png\" width=\"48\"> Defining Functions\n- Function names follow same convention as variables; Must start with a letter, can contain numbers, can't contain spaces (only underscores `_`), and no special characters\n- Format is `function_name(variable1,variable2,)= equation` such as `g(a,b)=2*a+3*b`\n- Functions can be evaluated at specific points by entering numbers in for the arguments such as `g(1,2)`"}
︠9a09404e-db43-479d-8cd4-f2da018763ed︠

f(x)=3*x^2+7*x-17   #Defining a function f of x

#Try evaluating this function at the following points: x=0, x=5, x=7
#For example, type f(0) to evaluate at x=0
︡62498b74-47fc-4064-81ba-317b9a79b4af︡{"done":true}︡
︠dd88cf00-3632-4f31-bc6d-c7246ab24938i︠
︠d166a81e-205c-421e-ae48-20a075dc248a︠










