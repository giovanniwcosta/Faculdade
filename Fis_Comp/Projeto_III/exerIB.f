	program mrua
	
		implicit none 

		real(8) v,dt,p,m,t,n,vi,c,r,a,vt,tpass,s,vf
		integer i
		
		p = 400.d0
		m = 70.d0
		c = 0.5d0
		r = 1.2d0
		s = 0.0d0

		read(*,*)vi
		read(*,*)dt
		read(*,*)t
		read(*,*)a
		
		v = vi
		n = t/dt

		open(1,file="vel2_out.dat")
			write(1,*)0,v
			do i=1,int(n)
				s = s + v*dt
				v = v + (p/(m*v))*dt - c*r*a*(v**2.d0)*dt/m
				write(1,*)dt*dfloat(i),v	
			enddo
		close(1)
		
		vf = v
		v = vi
		vt = vi

		do while((v + p/(m*v)*dt - c*r*a*v**2*dt/m) > vt)
				v = v + p/(m*v)*dt - c*r*a*v**2*dt/m
				vt = v
				tpass = tpass + dt	
		enddo

		print*,"Curvando-se diminui-se a área frontal que contribui"
		print*,"para a resistência que o ar impele sobre o ciclista."
		print*,"Os ciclistas correm em grupo para diminuir a área"
		print*,"frontal total, de todos os ciclistas, pois, desta"
		print*,"forma, os que estão atrás sofrem menos arrasto e"
		print*,"se cansam menos. Por esse motivo é mais vantajoso"
		print*,"a um ciclista ficar atrás ao invés de ultrapassar,"
		print*,"pois assim, quem está á frente cansa mais rápido,"
		print*,"devido ao maior gasto energia para manter a mesma"		
		print*,"velocidade de quem está atrás, que sofre menos os"
		print*,"feitos da força de arrasto. Assim, quando preciso,"
		print*,"o ciclista que está atrás e com mais disposição,"
		print*,"pode ultrapassar quem está a frente de forma mais"
		print*,"fácil."
		print*,"A velocidade final após T:",v
		print*,"No instante:",tpass
		print*,"O espaço percorrido foi de S:",s
		print*,"A velocidade média foi de Vm:",s/t

	end program 
