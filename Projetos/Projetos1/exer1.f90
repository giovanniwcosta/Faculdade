!Vamos determinar aprecisão do seu computador usando aritmética de ponto
!flutuante em precisão simples e dupla.  Para isso, crie um “loop” que soma
!uma variável ao número 1 e testa se, à medida que a diminui, o resultado da
!soma difere do número 1.  O menor valor que pode ser detectado para essa
!varaavel é a chamada precisão  de máquina. Inicie seu programa com a = 1 e
!vá dividindo o valor por 2 a cada iteração. Faça isso para variável de tipo
!real com precião simples e dupla.
program presicao
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
