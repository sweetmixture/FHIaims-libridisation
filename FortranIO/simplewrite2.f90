program write_to_file
    implicit none
    
    character(80) :: directory = "/work/e05/e05/wkjee/Software/gulpklmc/klmc3_tf_interface.fhiaims.14082023/FortranIO/subdirectory1/"
    character(80) :: filename = "FHIaims.out"
    character(160) :: full_path
    integer :: unit_num, iostat
    
    ! Combine directory path and filename
    full_path = trim(directory) // filename
    
    ! Open the file for writing
    open(unit=unit_num, file=full_path, status='replace', iostat=iostat)
    
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
