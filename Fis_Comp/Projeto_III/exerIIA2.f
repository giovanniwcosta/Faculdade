        program cromer

                implicit none 

                real(8) gravity,th0,th,inte,leng,w,w0,pi,time,dt,mass
                integer i


                read(*,*) mass 
                read(*,*) leng
                read(*,*) dt
                read(*,*) th0
                read(*,*) time

                inte  = time/dt
                gravity = 9.8d0
                w0 = 0.d0
                pi = 4.d0*datan(1.d0)
                th0 = (pi/180.d0)*th0

                th = th0
                w = w0

                open(1,file="exerIIA2_out.dat")
                        write(1,*)0,th0
                        do i=1,int(inte)
                                w = w - gravity/leng*th*dt
                                th = th + w*dt 
                                if(th >= pi) then
                                        th = th - 2.d0*pi
                                else if(th <= -pi) then 
                                        th = th + 2.d0*pi
                                endif

                                write(1,*)dt*dfloat(i),th
                        enddo
                close(1)
        end program 
