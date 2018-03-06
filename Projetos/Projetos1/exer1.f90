program exer1

    implicit none
    real*8 ad,vd,r,a,pi
    real as,vs

    read(*,*)r
    as = 1.0/2.0
    ad = 1.0d0/2.0d0
    vs = 1.0 + as
    vd = 1.0d0 + ad
    write(*,*)"Precisão Simples"
    do while(vs > 1.0)
        write(*,*)as,vs
        as = as/2.0
        vs = 1.0 + as
    enddo
    write(*,*)as,vs

    write(*,*)"Precisão Dupla"
    do while(vd > 1.0d0)
        write(*,*)ad,vd
        ad = ad/2.0d0
        vd = 1.0d0 + ad
    enddo
    write(*,*)ad,vd

    pi = 4*atan(1.0_8)
    a = pi*r**2.0d0
    write(*,*)"Valor da Area:",a

end program
