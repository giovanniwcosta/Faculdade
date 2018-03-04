program exer1

    implicit none
    real*8 ad,vd,r,a,pi
    real as,vs

    read(*,*)r
    ad = 1.0d0
    as = 1.0

    write(*,*)"Precisão Simples"
    do while(1>0)
        as = as/2.0
        vs = 1.0 + as
        write(*,*)as,vs
        if(vs == 1.0)goto 1
    enddo

    1 write(*,*)"Precisão Dupla"
    do while(1>0)
        ad = ad/2.0d0
        vd = 1.0d0 + ad
        write(*,*)ad,vd
        if(vd == 1.0d0)goto 2
    enddo

    2 pi = 4*atan(1.0_8)
    a = pi*r**2.0d0
    write(*,*)"Valor da Area:",a

end program
