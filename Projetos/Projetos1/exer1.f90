program presicao
    implicit none
    real*8 ad
    real as
    integer 2
    ad = 2.0d0
    as = 2.0
    do j=1,52
        ad = ad*2.0d0
        as = as*2.0
        write(*,*)j,(1.0d0 + (2.0d0/(ad))),(1.0 + (2.0/(as)))
    enddo
end program
