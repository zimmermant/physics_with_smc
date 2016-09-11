︠f7cb620d-c760-491e-a181-03bcf5913d6ei︠
%md

Defining a function in SageMath is quite easy.  Give the function a name, list the arguments in parentheses, then type out the function.

### <img src="sagemathcloud_logo1.png" width="48"> Defining a function
- Function name must start with a letter and can contain numbers and underscores (no spaces)
- List the arguments of the function.  These do not need to be defined as variables
    - For example `y(t)=y_0+v_0*t+1/2*a*t^2`
- Functions can be evaluated by entering values for each argument
    - For example: `y(1)` yields the value of `y` when `t=1`.
︡e2f7e9f7-526b-4d5c-86c9-a2ae2c82b2c9︡{"done":true,"md":"\nDefining a function in SageMath is quite easy.  Give the function a name, list the arguments in parentheses, then type out the function.\n\n### <img src=\"sagemathcloud_logo1.png\" width=\"48\"> Defining a function\n- Function name must start with a letter and can contain numbers and underscores (no spaces)\n- List the arguments of the function.  These do not need to be defined as variables\n    - For example `y(t)=y_0+v_0*t+1/2*a*t^2`\n- Functions can be evaluated by entering values for each argument\n    - For example: `y(1)` yields the value of `y` when `t=1`."}
︠9d53be0a-1cb5-457d-bbb3-f9622815463bs︠
x(x_0,v_0x,t)=x_0+v_0x*t  #Position equation

x(0,2,8)  #Evaluate the position when x_0=0, v_0x=2, and t=8

x(10,-1,4)  #Evaluate the position when x_0=10, v_0x=-1, and t=4
︡e553808e-5ee4-4754-aa6f-d0003b533ec7︡{"stdout":"16\n"}︡{"stdout":"6\n"}︡{"done":true}︡
︠84838de2-0cf8-4c71-b27f-d78fc6eb97ddi︠
%md


### <img src="sagemathcloud_logo1.png" width="48"> Taking Derivatives
- Can either use `diff(f(x),x)` or f(x).diff(x)
- `diff()` or `derivative()` are identical
- Specify variable to differentiate with respect to
- Indicate the order of the derivative
︡b0b55b99-b45d-4362-80ef-112f879f31ac︡{"done":true,"md":"\n\n### <img src=\"sagemathcloud_logo1.png\" width=\"48\"> Taking Derivatives\n- Can either use `diff(f(x),x)` or f(x).diff(x)\n- `diff()` or `derivative()` are identical\n- Specify variable to differentiate with respect to\n- Indicate the order of the derivative"}
︠71563e0c-4a2f-4905-ab2d-bc507ea7058a︠
y_0,v_0y,a_y=var('y_0,v_0y,a_y')   #Define all variables

y(t)=y_0+v_0y*t+1/2*a_y*t^2  #Define y(t)

### A couple of different ways to take the derivative of y with respect to t
y(t).diff(t)
diff(y(t),t)
derivative(y(t),t)

### Second derivative of y with respect to t should return the acceleration
y(t).diff(t,2)
diff(y(t),t,2)


︡61d28527-c126-4f44-98fb-b432e22587ea︡{"stdout":"a_y*t + v_0y\n"}︡{"stdout":"a_y*t + v_0y\n"}︡{"stdout":"a_y*t + v_0y\n"}︡{"stdout":"a_y\n"}︡{"stdout":"a_y\n"}︡{"done":true}︡
︠2b1d2846-6458-4ee7-97f4-09a98cd3cfb2i︠
%md

The SageMath derivative returns a function so you can assign it a name or evaluate it at a point just like with other functions.
︡cb57d973-2380-402c-ac9f-885b8b05f6a2︡{"done":true,"md":"\nThe SageMath derivative returns a function so you can assign it a name or evaluate it at a point just like with other functions."}
︠5dfd5272-e559-4677-a4d2-7bb34a9c4659s︠
diff(y(t),t)(t=1)

v(t)=diff(y(t),t)
v(1)

︡62a9d43f-6340-4a5a-942a-0d7ebe364ef7︡{"stdout":"a_y + v_0y\n"}︡{"stdout":"a_y + v_0y\n"}︡{"done":true}︡
︠29dff800-b777-4585-be27-e535f6e26aa1i︠
%md

### <img src="sagemathcloud_logo1.png" width="48"> Plotting Functions
- Use the `plot()` command to create a plot
    - Arguments of `plot()` include the function to plot, the variable to plot against, and the variable range
        - `plot(y(t),t,0,10)` plots the function y(t) vs. t from t=0 to t=10
- Plots can be given variable names which is useful for modifying features of the plot
    - For example: `P1=plot(y(t),t,0,10)`
- The `show()` command displays the plot on the screen
    - For example: `P1.show()`
︡225a92e7-3082-4f56-bee0-18b6a4bc21c4︡{"done":true,"md":"\n### <img src=\"sagemathcloud_logo1.png\" width=\"48\"> Plotting Functions\n- Use the `plot()` command to create a plot\n    - Arguments of `plot()` include the function to plot, the variable to plot against, and the variable range\n        - `plot(y(t),t,0,10)` plots the function y(t) vs. t from t=0 to t=10\n- Plots can be given variable names which is useful for modifying features of the plot\n    - For example: `P1=plot(y(t),t,0,10)`\n- The `show()` command displays the plot on the screen\n    - For example: `P1.show()`"}
︠d1fb5024-c45c-4628-ad12-4fe60bdae72cs︠
y_plot(t)=y(t).substitute(a_y=-9.8,v_0y=20,y_0=10)  #Must substitute numerical values for all variables (except t) in order to plot

pos_plot=plot(y_plot(t),t,0,10,title='Position vs. Time')
pos_plot.show()  #Display pos_plot on the screen

︡8943ab2d-91a1-4e5b-aa1e-6cb851ef3511︡{"file":{"filename":"/projects/d18eeda9-38fb-4d20-9a0a-4afa03a182aa/.sage/temp/compute4-us/21272/tmp_Z2lc6Z.svg","show":true,"text":null,"uuid":"8d9a5ff4-d635-4034-8fc2-3d4e3b7c2984"},"once":false}︡{"html":"<div align='center'></div>"}︡{"done":true}︡
︠5be0b38e-5bdb-468f-a557-0ac303a4eccci︠
%md

### Try It Yourself
- Plot the function $F=G \frac{m_1 m_2}{r^2}$ vs. $r$ 
    - Use `.substitute()` to input values for G, $m_1$, and $m_2$
    - Choose a minimum value of $r$ so graph does not blow up near the origin
︡64676e6d-ce95-49b3-8252-7897119fa993︡{"done":true,"md":"\n### Try It Yourself\n- Plot the function $F=G \\frac{m_1 m_2}{r^2}$ vs. $r$ \n    - Use `.substitute()` to input values for G, $m_1$, and $m_2$\n    - Choose a minimum value of $r$ so graph does not blow up near the origin"}
︠5e5a31d3-5325-4258-bf02-88a90c2e058ds︠
#Input your work here
︡e2b5a8a6-d90d-4d35-ada0-56fe38f80d2f︡{"done":true}︡
︠a94ae176-bab1-4119-9ef5-2a9c6948070ai︠
%md

### <img src="sagemathcloud_logo1.png" width="48"> Plotting Multiple Functions
- Plots can be 'added' together for display on the same graph
︡981695c3-7f08-49a2-beb2-3f30387a84ec︡{"done":true,"md":"\n### <img src=\"sagemathcloud_logo1.png\" width=\"48\"> Plotting Multiple Functions\n- Plots can be 'added' together for display on the same graph"}
︠52c64dd6-4069-48da-8d2f-332bf347b616︠









