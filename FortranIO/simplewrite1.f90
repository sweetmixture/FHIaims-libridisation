program write_to_file
    implicit none
    
    character(512) :: filename = "/work/e05/e05/wkjee/Software/gulpklmc/klmc3_tf_interface.fhiaims.14082023/FortranIO/subdirectory1/FHIaims.out"
    integer :: unit_num, iostat
    unit_num = 500
    
    ! Open the file for writing
    open(unit=unit_num, file=filename, status='replace',iostat=iostat)
    
    if (iostat /= 0) then
        write(*, *) "Error opening the file"
        stop
    end if
    
    ! Write "Hello World" to the file
    write(unit_num, *) "Hello World"
    
    ! Close the file
    close(unit_num)
    
    write(*, *) "Data written to file successfully!"
    
end program write_to_file
