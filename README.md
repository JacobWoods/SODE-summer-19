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
  coupled oscilators to reach one well of a double well potential when the oscilators values are dictated by <a href="https://www.codecogs.com/eqnedit.php?latex=\dot&space;u_i=-(4u_i^3-2u_i)&plus;k\sum_{j\sim&space;i}(u_j-u_i)&plus;\delta&space;N(0,1)" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\dot&space;u_i=-(4u_i^3-2u_i)&plus;k\sum_{j\sim&space;i}(u_j-u_i)&plus;\delta&space;N(0,1)" title="\dot u_i=-(4u_i^3-2u_i)+k\sum_{j\sim i}(u_j-u_i)+\delta N(0,1)" /></a>
  
  
