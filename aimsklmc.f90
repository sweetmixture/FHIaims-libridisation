!****p* FHI-aims/aims_real
!  NAME
!    aims_real -- Program to call the top-level FHI-aims subroutine
!  SYNOPSIS

    subroutine aimsklmc( MPI_comm_klmc, klmc_task_iopath, klmc_task_id, klmc_worker_id ) bind (C,name="aimsklmc")

!  PURPOSE
!
!    This is FHI-aims code
!
!    In principle, FHI-aims can also be built as a library. In that case, aims
!    is called as a subroutine aims() (see main.f90). The present program embeds
!    this subroutine for the standalone executable.
!  AUTHOR
!    FHI-aims team, Fritz-Haber Institute of the Max-Planck-Society
!  HISTORY
!    Release version, FHI-aims (2008).
!  INPUT
!    none
!  OUTPUT
!    none
!  AUTHOR
!    FHI-aims team, Fritz-Haber Institute of the Max-Planck-Society
!  SEE ALSO
!    Volker Blum, Ralf Gehrke, Felix Hanke, Paula Havu, Ville Havu,
!    Xinguo Ren, Karsten Reuter, and Matthias Scheffler,
!    "Ab initio simulations with Numeric Atom-Centered Orbitals: FHI-aims",
!     Computer Physics Communications (2008), submitted.
!  COPYRIGHT
!   Max-Planck-Gesellschaft zur Foerderung der Wissenschaften
!   e.V. Please note that any use of the "FHI-aims-Software" is subject to
!   the terms and conditions of the respective license agreement.
!  SOURCE

       ! if an MPI-environment exists, initialize it - else, silently
       ! circumvent all MPI functionality using dummy subroutines
       use mpi_utilities

!
!        Author:         Woongkyu Jee / woong.jee.16@ucl.ac.uk
!        Affiliation:    University College London
!        Date:           2023.05.25 - 
!
!        Description:	 Testing Libridised FHIaims22
!
!	05/23 : configuring taskfarm
!   08/23 : call FHIaims on dummy taskfarm
!

       ! wkjee
       use iso_c_binding
       implicit none

! ======== FHIaims default
       ! Add this variables to asses BLACS environment: wkjee FHIaims default
       integer :: me, nprocs
! ======== FHIaims default

       ! wkjee: initilisation is not required: FHIaims default
       ! call initialize_mpi ( )

       ! wkjee: from KLMC3 taskfarm interface variables
       integer*4,                            intent(in) :: MPI_comm_klmc
       integer,                              intent(in) :: klmc_task_id
       integer,                              intent(in) :: klmc_worker_id
       character(kind=c_char), dimension(*), intent(in) :: klmc_task_iopath

       character(len=512)                               :: klmc_task_iopath_full    ! for saving full iopath (working directory, where FHIaims will run)
       character(len=512)                               :: klmc_task_filepath       ! for saving full filepath

       ! wkjee: O setup
       integer iopath_length
       integer out_unit
       integer rank, cpu_count, ierr

       klmc_task_iopath_full = ""
       iopath_length = 0
       do
           if(klmc_task_iopath(iopath_length+1) == C_NULL_CHAR) exit
           iopath_length = iopath_length + 1
           klmc_task_iopath_full(iopath_length:iopath_length) = klmc_task_iopath(iopath_length)
       end do

       klmc_task_filepath = trim(klmc_task_iopath_full) // "/aimsklmc.out"

! wkjee stdout check
       write(*,'(A,A)') "in aimsklmc.f90 : KLMC3 klmc_task_iopath   : ", klmc_task_iopath_full
       write(*,'(A,A)') "in aimsklmc.f90 : KLMC3 klmc_task_filepath : ", klmc_task_filepath
! wkjee stdout check
     
      ! wkjee: file O setup
      out_unit = klmc_worker_id + 112
     
      call MPI_Comm_rank(MPI_comm_klmc,rank,ierr)
      call MPI_Comm_size(MPI_comm_klmc,cpu_count,ierr)

      if(rank.eq.0) then
          open(unit=out_unit,file=klmc_task_filepath,status='replace')
      end if

! ======== FHIaims default
      !call aims ( mpi_comm_global, 6 , use_mpi )    ! use_mpi = .true.
! ======== FHIaims default

      call aims ( MPI_comm_klmc, out_unit , .true. )    ! use_mpi = .true.

! wkjee: do not touch below 08/23: FHIaims default ======================================

      ! wkjee: FHIaims default Section
      ! AJL/Feb2016
      call BLACS_Pinfo(me,nprocs)
      if (nprocs.gt.0) then
          ! Transfered from scalapack_wrapper.f90 as not suitable inside a library setup
          call BLACS_Exit(1)
      end if
      ! wkjee: FHIaims default Section

      ! wkjee: finalization is not required: wkjee FHIaims default
      ! call finalize_mpi ( )

! wkjee: do not touch below 08/23: FHIaims default ======================================

      ! wkjee
      if(rank.eq.0) then
          close(out_unit)
      end if

    end subroutine aimsklmc

!******
