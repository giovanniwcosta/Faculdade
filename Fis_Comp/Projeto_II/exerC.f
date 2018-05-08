	program raiz
		implicit none
		integer n,i
		real(8) d1,d2,d3,n1,n2,n3,s1,s2,s3
		read*,n 
 
		open(10,file='tab3_out.dat')
			write(10,*)		
			do i=0,n-1
	write(10,*)i,d1(i),d2(i),d3(i),n1(i),n2(i),n3(i),s1(i),s2(i),s3(i)
			enddo			
		close(10)
	end program
	
	real(8) function d1(n)
		implicit none		
		
		integer n,i
		real(8) a,d,p,x

		p(x)=18.d0*(x**3.d0) - 9.d0*(x**2.d0) - 5.d0*x+2.d0
		
		a = 1.d0
		d = -0.25d0

		do i=0,n
			if(p(a+d)*p(a).lt.0.d0) then
				d = d/2.d0
			else
				a = a+d 
			endif
		enddo
		d1 = a
		
		return 
	end function

	real(8) function d2(n)
		implicit none		
		
		integer n,i
		real(8) a,d,p,x

		p(x)=18.d0*(x**3.d0) - 9.d0*(x**2.d0) - 5.d0*x+2.d0
		
		a = 0.d0
		d = 0.25d0

		do i=0,n
			if(p(a+d)*p(a).lt.0.d0) then
				d = d/2.d0
			else
				a = a+d 
			endif
		enddo
		d2 = a
		
		return 
	end function

	real(8) function d3(n)
		implicit none		
		
		integer n,i
		real(8) a,d,p,x

		p(x)=18.d0*(x**3.d0) - 9.d0*(x**2.d0) - 5.d0*x+2.d0
		
		a = 0.21d0
		d = -0.2d0

		do i=0,n
			if(p(a+d)*p(a).lt.0.d0) then
				d = d/2.d0
			else
				a = a+d 
			endif
		enddo
		d3 = a
		
		return 
	end function
	
	real(8) function n1(n)
		implicit none
		integer n,i
		real(8) xi,xn,p,x,der
		
		p(x)=18.d0*(x**3.d0) - 9.d0*(x**2.d0) - 5.d0*x + 2.d0
		der(x)=54.d0*(x**2.d0)-18.d0*x-5.d0
		xn(x) = x - p(x)/der(x)
		xi = 1.d0
		do i=0,n
			xi = xn(xi)
		enddo
		
		n1 = xi
		
	return 
	end function

	real(8) function n2(n)
		implicit none
		integer n,i
		real(8) xi,xn,p,x,der
		
		p(x)=18.d0*(x**3.d0) - 9.d0*(x**2.d0) - 5.d0*x + 2.d0
		der(x)=54.d0*(x**2.d0)-18.d0*x-5.d0
		xn(x) = x - p(x)/der(x)
		xi = 0.d0
		do i=0,n
			xi = xn(xi)
		enddo
		
		n2 = xi
		
	return 
	end function

	real(8) function n3(n)
		implicit none
		integer n,i
		real(8) xi,xn,p,x,der
		
		p(x)=18.d0*(x**3.d0) - 9.d0*(x**2.d0) - 5.d0*x + 2.d0
		der(x)=54.d0*(x**2.d0)-18.d0*x-5.d0
		xn(x) = x - p(x)/der(x)
		xi = -0.21d0
		do i=0,n
			xi = xn(xi)
		enddo
		
		n3 = xi
		
	return 
	end function
	
	real(8) function s1(n)
		implicit none
		integer n,i
		real(8) xi,xn,xi1,x1,p,x,der,temp
		
		p(x)=18.d0*(x**3.d0) - 9.d0*(x**2.d0) - 5.d0*x + 2.d0
		xn(x,x1) = x - p(x)*(x-x1)/(p(x)-p(x1))
		xi = 1.d0
		xi1 = xi + 0.5d0
		do i=0,n
			temp = xi
			xi = xn(xi,xi1)
			xi1 = temp
		enddo
		
		s1 = xi
	
	return 
	end function

	real(8) function s2(n)
		implicit none
		integer n,i
		real(8) xi,xn,xi1,x1,p,x,der,temp
		
		p(x)=18.d0*(x**3.d0) - 9.d0*(x**2.d0) - 5.d0*x + 2.d0
		xn(x,x1) = x - p(x)*(x-x1)/(p(x)-p(x1))
		xi = 0.d0
		xi1 = xi - 0.1d0
		do i=0,n
			temp = xi
			xi = xn(xi,xi1)
			xi1 = temp
		enddo
		
		s2 = xi
	
	return 
	end function

	real(8) function s3(n)
		implicit none
		integer n,i
		real(8) xi,xn,xi1,x1,p,x,der,temp
		
		p(x)=18.d0*(x**3.d0) - 9.d0*(x**2.d0) - 5.d0*x + 2.d0
		xn(x,x1) = x - p(x)*(x-x1)/(p(x)-p(x1))
		xi = -0.2d0
		xi1 = xi + 0.1d0
		do i=0,n
			temp = xi
			xi = xn(xi,xi1)
			xi1 = temp
		enddo
		
		s3 = xi
	
	return 
	end function
