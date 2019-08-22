# SODE-summer-19
General code repository 
  There are Three subfolders each haveing a description explaining what each file in them does and what there dependencies are to be able to run.



# sierpinski triangle

## Triangle.m
  This code does not have any dependencies other then native matlab functions this code describes a function named triangle(m) 
  which takes the input of an integer greater then or equalle to 0 and outputs a adjacency matrix of the mth order sierpinski triangle 
  with triangle(0) outputing the adjacency matrix of the complete graph of order 3.  
    This code has room to be optimized and has a rather complicated algorithm to define the adjacency matrix.
    
## Timestep.m

  This is a code with no dependencies and it defines a function named timestep which outputs how many iterates it takes for a graph of 
  coupled oscilators to reach one well of a double well potential when the oscilators values are dictated by https://latex.codecogs.com/gif.latex?%5Cdot%20u_i%3D-%284u_i%5E3-2u_i%29&plus;k%5Csum_%7Bj%5Csim%20i%7D%28u_j-u_i%29&plus;%5Cdelta%20N%280%2C1%29
