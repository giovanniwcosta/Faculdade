	program integrais

		implicit none 
		real(8) r_t, r_s, f1,f2, r,r_b, h,t
		integer i,n,k
		integer j(1000)

		f1 = 16.0d0/17.0d0*dexp(0.0d0)
		f2 = -4.0d0/17.0d0*dexp(0.25d0)*(4.0d0*dcos(1.0d0)-dsin(1.0d0))
		r = f1 + f2

		open(10,file='tab2_in.dat')
		open(20,file='tab2_out.dat')
			read(10,*)n
			read(10,*)j(:n)
			do i=1,n
				k = j(i)
				t = dfloat(k)
				h = 1.0d0/dfloat(j(i))
				write(20,*)k,h,r_t(k)-r,r_s(k)-r,r_b(k)-r
			enddo
		
		close(20)	 		
		close(10)
		
		
		
	end program
	
	real(8) function r_t(n)
		
		implicit none
		
		real(8) h,derivada, x, s 
		integer n, i
		
		derivada(x) = dexp(x*(0.25d0))*dsin(x)
		h = 1.0d0/dfloat(n)		
		
		r_t = derivada(0.0d0)+derivada(1.0d0)
 
		s = 0

		do i=1,(n-1)
			s = s + derivada(h*dfloat(i))
		enddo
		r_t = h*(r_t + 2.0d0*s)/2.0d0

	end function 

	real(8) function r_s(n)
		
		implicit none
		
		real(8) h,derivada, x, delta, par, imp
		integer n, i
		
		derivada(x) = dexp(x*(0.25d0))*dsin(x)
				
		h = 1.0d0/dfloat(n)		
		
		r_s = (derivada(0.0d0)+derivada(1.0d0))
		par = 0.0d0
		imp = 0.0d0

		do i=1,(n-1)
			if(mod(i,2).eq.0) then
				par = par + derivada(h*dfloat(i))
			else 
				imp = imp + derivada(h*dfloat(i))
			endif 
		enddo
		
		r_s = h*(r_s + 4.0d0*imp+2.0d0*par)/3.0d0
	end function

	real(8) function r_b(n)
		
		implicit none
		
		real(8) h,derivada, x,nt,ini,med,s,f0,f1,f2,f3,f4
		integer n, i
		
		derivada(x) = dexp(x*(0.25d0))*dsin(x)
		h = 1.0d0/dfloat(n)		
		nt = h*1.0d0/4.0d0		

		r_b = 0.0d0
		
		do i=1,n

			f0 = derivada(h*dfloat(i-1))
			f1 = derivada(h*dfloat(i-1)+nt) 		
			f2 = derivada(h*dfloat(i-1)+nt*2.0d0) 
			f3 = derivada(h*dfloat(i-1)+nt*3.0d0)
			f4 = derivada(h*dfloat(i))
			ini = 7.0d0*(f0+f4)
			med = 32.0d0*(f1+f3)
			s = nt*(ini+med+12.0d0*f2)	
			r_b = r_b + s*2.0d0/45.0d0
		enddo

	end function

	
	
