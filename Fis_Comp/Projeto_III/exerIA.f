	program mrua
	
		implicit none 

		real(8) v,dt,p,m,t,n,vi
		integer i
		
		p = 400.d0
		m = 70.d0

		read(*,*)vi
		read(*,*)dt
		read(*,*)t

		v = vi
		n = t/dt		
		
		open(1,file="vel1_out.dat")
			write(1,*)0,v
			do i=1,int(n)
				v = v + p/(m*v)*dt
				write(1,*)dt*dfloat(i),v	
			enddo
		close(1)
	end program 
