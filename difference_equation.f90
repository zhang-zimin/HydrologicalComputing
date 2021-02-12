PROGRAM text
    REAL::LA(16,11),LB(16,11),LC(16,11),LD(16,11),KXX(18,12),KYY(18,12),dx,dy,H(18,12),H0(18,12)
    INTEGER::I,J,NI,NJ,NI01,NJ01,NI02,NJ02
    NI = 18            !  x方向节点个数
    NJ = 12            !  y方向节点个数
    dx=20              !  x 方向空间步长
    dy=15              !  y 方向空间步长
    NI01 = NI - 1
    NJ01 = NJ - 1
    NI02 = NI - 2
    NJ02 = NJ - 2
    DO I = 1 , NI                    
        DO J = 1 , NJ
            KXX(I,J) = 21.6     !  水平方向岩体渗透系数    
        ENDDO
    ENDDO
    DO J = 1 ,  8                 
            KXX(9,J) = 0.216    !  水平方向帷幕渗透系数   
    ENDDO
    DO I = 1 , NI     
        DO J = 1 , NJ          
            KYY(i,J) = 4.32     !  垂直方向岩体渗透系数
        ENDDO
    ENDDO
    DO J = 1 , 8     
            KYY(9,J) = 0.0432   !  垂直方向帷幕渗透系数      
    ENDDO
    DO I = 2 , NI01      
        DO J = 1 , NJ01
    LA(i,j) = SQRT(KXX(I-1,J)*KXX(I,J))/(dx*dx)          !差分方程四个系数    
    LB(i,j) = SQRT(Kyy(I,J-1)*Kyy(I,J))/(dy*dy)
    LC(i,j) = SQRT(KXX(I+1,J)*KXX(I,J))/(dx*dx)
    Ld(i,j) = SQRT(Kyy(I,J+1)*Kyy(I,J))/(dy*dy)
        ENDDO
    ENDDO
    open(1,file='test.dat')
    DO I = 2 , NI01                   
        DO J = 1 , NJ01
            H0(I,J) = 0.0
        ENDDO
    ENDDO
    DO I = 2 , 8                     ! (第一类边界条件)库前水头    
        H0(I,1) = 100.0
        H(I,1) = 100.0
    ENDDO
    DO I = 13 , NI01                 ! (第一类边界条件)库后水头    
        H(I,1) = 20.0
    ENDDO
    do k=1,2000                      ! 迭代次数
        do i=2,NI01                    !   第二类边界条件
            H0(i,NJ)=H0(i,NJ02)
        end do
        do j=1,NJ01                    !   第二类边界条件
            H0(1,j)=H0(3,j)
            H0(NI,j)=H0(NI02,j)
        end do
        do i=2,NI01
            do j=2,NJ01
            H(i,j)=(LA(I,J)*H0(I-1,J)+LB(I,J)*H0(I,J-1)+LC(I,J)*H0(I+1,J)+LD(I,J)*H0(I,J+1))/(LA(I,J)+Lb(I,J)+Lc(I,J)+Ld(I,J))       !   迭代公式
            end do
        end do
        do i=9,12
        H(i,1)=(LA(I,1)*H0(I-1,1)+LB(I,1)*H0(I,2)+LC(I,1)*H0(I+1,1)+LD(I,1)*H0(I,2))/(LA(I,1)+Lb(I,1)+Lc(I,1)+Ld(I,1))               !   迭代公式      
       end do

        do i=2,NI01
            do j=1,NJ01
                H0(i,j)=H(i,j)
            end do
        end do
    end do
            write(1,'(2X,A)')'H(NI,NJ)'             
            write(1,'(1X,16F9.3)')((h(i,j),i=2,NI01),j=1,nj01)          !   输出格式
            close(1)
end program test
