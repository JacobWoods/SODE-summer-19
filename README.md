# SODE-summer-19
General code repository 
  There are Three subfolders each haveing a description explaining what each file in them does and what there dependencies are to be able to run.



# sierpinski triangle




## Triangle.m
  This code does not have any dependencies other then native matlab functions this code describes a function named triangle(m) 
  which takes the input of an integer greater then or equalle to 0 and outputs a adjacency matrix of the mth order sierpinski triangle 
  with triangle(0) outputing the adjacency matrix of the complete graph of order 3.  
    This code has room to be optimized and has a rather complicated algorithm to define the adjacency matrix.
    look at _____.pdf for a description of the algorithm
## Timestep.m

  This is a code with no dependencies and it defines a function named timestep which outputs how many iterates it takes for a graph of 
  coupled oscilators to reach one well of a double well potential when the oscilators values are dictated by 
  
  
  ![equation](https://latex.codecogs.com/gif.latex?%5Cdot%20u_i%3D-%284u_i%5E3-2u_i%29&plus;k%5Csum_%7Bj%5Csim%20i%7D%28u_j-u_i%29&plus;%5Cdelta%20N%280%2C1%29)
  
  
  The function Timestep(D,delta,dt,k) is defined with D being the adjacency matrix of the desired graph delta being the same delta in the equation above defining the magnitude of the random varible well k is the strength of the coupleing between neighbooring nodes and dt is the step size.  This code will continue to run untill all nodes are in one of the wells either positive or negative well and then will output a integer c which is the number of steps it took to reach equilibrium.
  
## Triangle_Graph.m

  Triangle_Graph is a script which is dependent on the Triangle function and will take some inputed initial conditions and plot the graph of the system of coupled oscilators with the nodes being colored representing which equilibrium they are in with red dots being in the positive equlibrium and blue dots in the negative one.  this code will run untill it goes through the number of of iterates specified n with a time step dt.  it uses the same equation as in the above code
  
  
![equation](https://latex.codecogs.com/gif.latex?%5Cdot%20u_i%3D-%284u_i%5E3-2u_i%29&plus;k%5Csum_%7Bj%5Csim%20i%7D%28u_j-u_i%29&plus;%5Cdelta%20N%280%2C1%29)
                                              
                                              
With delta being the magnitude of the random varible and k being the coefficent on the oscilator and m is the number of iterates between when we plot our graph.  lastly the varible N is the inpuit for our triangle function defined in Triangle.m and is the oreder of our sierpinski triangle.

## Triangle_Plot.m

  This code is identical to Triangle_graph.m but instead it will plot a scatterplot of the verticies rather then the 
  graph with colored nodes so it shows a more descriptive plot of the values of the verticiesbut has less of a geometric meaning.
  
  
 # Galton_Watson_Tree
 
 
 ## Kuramoto.m
 
  This is a very simple function with no dependencies which calculates the right hand side of the Kuramoto model from 
  Kuramoto(A,U,k,a) outputs a vector v equalle to 
  
  
  ![equation](https://latex.codecogs.com/gif.latex?%5Cfrac%7Bk%7D%7BN%7D%5Csum_%7Bi%5Csim%20j%7DG%28u_i-u_j%29sin%28u_i-u_j&plus;%5Calpha%20%29)


Here we have A representing the function G between i and j in the ith, jth entry of A,  U represents the current state of the system, k like in the equation represents the coupleing strength and a is the so called phase lag represented by alpha in the equation.

 ## Kuramoto_4s.m
 
 Kuramoto_4s.m applies a runge kutta method of finding the next timestep of our function as such it requires all the inputs and is dependent on the Kuramoto.m fuction with also requireing a dt input so we know the size of the timestep.
 
 ## Galton_Watson_K.m
 
 This script looks at a random galton watson tree and applies the Kuramoto model it with a representing the phase lag in the kuramoto model, n representing the number of time steps, T representing how long the code will run for, k is the strength of the coupleing. g represents the number of generations that our tree will go on for and p is the probability that we put into a geometric random varible to see how many children each member of the past generation has.  This code will out put a scatter plot of the system every m timesteps.
 
 
 # Chimera state
 
 ## Kuramoto.m and Kuramoto_4s.m
  these codes work identivcly as in the last model but instead the function that we are modeling is negative so it resembles
  
  
  ![equation](https://latex.codecogs.com/gif.latex?-%5Cfrac%7Bk%7D%7BN%7D%5Csum_%7Bi%5Csim%20j%7DG%28u_i-u_j%29sin%28u_i-u_j&plus;%5Calpha%20%29)
  
  
## Stochastic.m and Stochasticint.m
  Stochastic.m is a function that takes a vector u as an inpout and outputs a vector of i.i.d random varibles for each element of the vector inside a vector each of them are N(0,1).  stochasticint.m is dependent on stochastic.m and takes a timestep dt and a vector U as an input and will integrate an equation like
  
## chimerawithstoch.m 
  This script will greate a chimera state and is dependent on both Kuramoto_4s.m and stocasticint.m.  to set the initial conditions we can decided on the phase lag a,the number of verticies in our graph N,  the number of timesteps we wish n, the time we wish to elapse T, the weight on the coupleing k and the magnituded of our stocastic term epsilon.  from these intial conditions we generate a matrix which represents the kernel function G in the kuramoto model and then we create a pseudo random vector of initial conditions.  From these we use a function defined in the script chimerastoch(G,n,T,k,a,u_0,epsilon) which will find dt and plot the function as well as save in as a png and a gif with a frame ever 500 iterates.  then this function will output a matrix with all the values of the N vertices for each of the n timesteps.
  
  
## Kwithlocal.m   

This script works exactly as above but the kuramoto model is programed in and is slightly different includeing a 2nd derivative term in it.

## detection_method.m

This has no direct dependencies but requires the data saved when one runs the chimerawithstoch.m script useing the C matrix it outputs this script attempts to plot the boundries between the synchronized and the chaotic regions of the chimera with.  we attempt to detect them by seeing which verteices have values almost identical to there neigboors by takeing the differnce between the nth and nth+1 vertices value and then averageing a feww of it's neighboors together then if it is belowe a certain threshhold dependent on epsilon from chimerawithstoch.mthen we say that it is sychronized.  from here we look for the logest stretch of syncronized points in that timeframe and the two ends of these are saved as the boundries this is done for all time steps and then a plot is made of the boundries.
