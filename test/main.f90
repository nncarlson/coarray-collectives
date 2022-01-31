program main

  use coarray_collectives
  implicit none

  integer :: a, b
  a = this_image()
  b = a*(a+1)/2 ! expected sum scan
  call co_sum_scan(a)

  !! Output the the computed sum scan
  if (this_image() == 1) write(*,'(a)') 'image: expected, computed'
  if (this_image() > 1) sync images (this_image()-1)
  write(*,'(i0,": ",i0,1x,i0)') this_image(), b, a
  if (this_image() < num_images()) sync images (this_image()+1)

  sync all
  if (a /= b) error stop 1

end program
