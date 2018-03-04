!Forneça com precisão dupla a área de um círculo de raio r. Você deve se
!certificar de que o valor usado para a constante π possua precisão dupla.
program area
    implicit none
    real*8 r,a,pi

    pi = 4*atan(1.0_8)
    read(*,*)r

    a = pi*r**2.0d0
    write(*,*)r,a,pi
end program
