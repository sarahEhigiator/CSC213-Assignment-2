.data
Enter1:.asciiz "\n Enter the value of A"
Enter2:.asciiz "\n Enter the value of B"
Enter3:.asciiz " \n Enter the value of C"
complex:.asciiz "\n Unable to compute complex root"
one:.float -1.0
two:.float 2.0
zero:.float 0.0
four:.float 4.0
x1:.asciiz "X1 ="
x2:.asciiz "X2 ="
.text 
   main:
   # Ask the user the user for the input of A
   la $a0,Enter1
   li $v0,4
   syscall
   li $v0,6
   mov.s $f8,$f0
   syscall
   # Ask the user for the input of B
   la $a0,Enter2
   li $v0,4
   syscall
   li $v0,6
   mov.s $f4,$f0
   syscall
   # Ask the user for the input of C
   la $a0,Enter3
   li $v0,4
   syscall
   li $v0,6
   mov.s $f6,$f0
   syscall
   #b^2
   mul.s $f10,$f4,$f4 
   #ac
   mul.s $f16,$f8,$f6
   l.s $f18,four
   #4ac
   mul.s $f20,$f16,$f18
   # (b^2)-4ac
   sub.s $f22,$f10,$f20
   l.s $f24,zero
   c.le.s $f24,$f22
   bc1t Error_msg
   #square root of (b^2)-4ac
   sqrt.s $f26,$f22
   l.s $f30,two
   #2a
   mul.s $f3,$f30,$f8
   l.s $f23,one
   mul.s $f0,$f23,$f4
   add.s $f1,$f0,$f26
   div.s $f2,$f1,$f3
   # Print the value of X1
   la $a0,x1
   li $v0,4
   syscall
   li $v0,2
   mov.s $f12,$f2
   syscall
   sub.s $f1,$f0,$f26
   div.s $f2,$f1,$f3
   # Print the value of X2
   la $a0,x2
   li $v0,4
   syscall
   li $v0,2
   mov.s $f12,$f2
   syscall
   Error_msg:
   la $a0,complex
   li $v0,4
   syscall
   exit:
   li $v0,10
   syscall
     
   
   
   
   
  
   
   
   

