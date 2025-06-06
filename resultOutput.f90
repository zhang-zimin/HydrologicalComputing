program main
    implicit none
    real,dimension(3,2)::numbers
    integer :: i
    numbers = reshape((/1.5, 3.2,4.5,0.9,7.2,5.5 /),shape(numbers))
    open(10,file = 'data.dat')
    do i=1,size(numbers,dim =1 )
        write(10,*) numbers(i,:)
    end do 
    close(10)
    
end
