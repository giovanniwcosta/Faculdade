!Vamos determinar aprecisão do seu computador usando aritmética de ponto
!flutuante em precisão simples e dupla.  Para isso, crie um “loop” que soma
!uma variável ao número 1 e testa se, à medida que a diminui, o resultado da
!soma difere do número 1.  O menor valor que pode ser detectado para essa
!varaavel é a chamada precisão  de máquina. Inicie seu programa com a = 1 e
!vá dividindo o valor por 2 a cada iteração. Faça isso para variável de tipo
!real com precião simples e dupla.
program presicao
    implicit none
    real*8 ad,vd
    real as,vs
    integer j
    ad = 2.0d0
    as = 2.0
    do j=1,60
        ad = ad*2.0d0
        as = as*2.0
        vd = 1.0d0 + 2.0d0/(ad)
        vs = 1.0 + 2.0/(as)
        if(vs == 1.0)vs = 0
        if(vd == 1.0d0) stop
        write(*,*)j,vd,vs
    enddo
end program
