# Cable Equation Simulation
> Heng Gao  
> Fudan University  
----
The cable equaition is one of the most crucial equations in theoretical neuroscience. In this code repository, we simulate cable equation via **forward difference scheme**.

## The Cable equation
The Cable equation takes the form as follows,   
$v_t(x,t) + \frac{1}{\tau} v(x,t)-\frac{\lambda^2}{\tau} v_{xx}(x,t)=0, \quad (x, t) \in \Omega\times[0, T],$    
$v = 0 , \quad(x, t)\in \partial \Omega \times [0, T],$  
$v(x, 0) = \mu(x), \quad (x, t)\in \Omega\times \{ t=0 \},$  
where $\tau, \lambda, T$ are constants, $\Omega=[0, l]$, $l$ is the length of the cable, $\mu(x)$ is bounded on $\Omega$, $\mu(x)\in C^1(\Omega)$, satisfying $\mu(0)=\mu(l)=0$.

## Usage
Directly run the `cablesim.m` using Matlab on your own computer.





