	program derivada_numerica

		implicit none
		
		integer i,n
	real(8) ds3,df2,dt2,ds5,dss5,dtt5,x,f1,f2,f3,f4,f5,t			
		real(8)d1,d2,d3
		real(8)h(1000)
		x = dfloat(1/3)
				
		
		open(10,file='tab1_in.dat')
		open(20,file='tab1_out.dat')
			read(10,*)n
			read(10,*)h(:n)
			write(20,*)
			do i=1,n
		f1=dexp(4.d0*(x-2.d0*h(i)))*dcos((x-2.d0*h(i))/2.d0) 
		f2 = dexp(4.0d0*(x-h(i)))*dcos((x-h(i))/2.0d0)
		f3 = dexp(4.0d0*(x))*dcos((x)/2.0d0)
		f4 = dexp(4.0d0*(x+h(i)))*dcos((x+h(i))/2.0d0)
		f5=dexp(4.d0*(x+2.d0*h(i)))*dcos((x+2.d0*h(i))/2.d0)
			
			ds3 = (f4-f2)/(h(i)*2.0d0)
			df2 = (f4-f3)/h(i)
			dt2 = (f3-f2)/h(i)	
			ds5 = (f1-f5+8.0d0*(f4-f2))/(h(i)*12.0d0)
			t = (h(i)**2.0d0)*12.0d0
			dss5 = (16.0d0*(f4+f2)-(f1+f5)-30.0d0*f3)/t
			t = (h(i)**3.0d0)*12.0d0
			dtt5 = (f5-f1+2.0d0*(f2-f4))/t
			
			write(20,*)h(i),ds3,df2,dt2,ds5,dss5,dtt5
		
			enddo
		close(20)	 		
		close(10)	
	end program
