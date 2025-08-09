# Cable Equation Simulation
> Heng Gao  
> Fudan University  
----
The cable equaition is one of the most crucial equations in theoretical neuroscience. In this code repository, we simulate cable equation via forward difference scheme.

## The Cable equation
The Cable equation takes the form as follows,
$$
\begin{equation}
\begin{cases}
    \frac{\partial v}{\partial t}(x,t) + \frac{1}{\tau} v(x,t)-\frac{\lambda^2}{\tau} \frac{\partial^2 v}{\partial x^2}(x,t)=0,& (x, t) \in \Omega\times[0, T], \\
    v = 0 ,& (x, t)\in \partial \Omega \times [0, T], \\
    v(x, 0) = \mu(x), & (x, t)\in \Omega\times \left\{t=0\right\},
\end{cases}
\end{equation}
$$
where $\tau, \lambda, T$ are constants, $\Omega=[0, l]$, $l$ is the length of the cable, $\mu(x)$ is bounded on $\Omega$, $\mu(x)\in C^1(\Omega)$, satisfying $\mu(0)=\mu(l)=0$.
