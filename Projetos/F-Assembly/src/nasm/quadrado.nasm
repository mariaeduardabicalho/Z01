; carrega x"FF" em S (todos pxs em '1')
  leaw $0, %A
  movw %A, %S
  notw %S

   
  leaw $16426, %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)


  leaw $16446, %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)

  leaw $16466, %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)

  leaw $16486, %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)

  leaw $16506, %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)

  leaw $16526, %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)

  leaw $16546, %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)




   
  leaw $16566, %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)

   
  leaw $16586, %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)

   
  leaw $16606, %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)

   
  leaw $16626, %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)

   
  leaw $16646, %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)

   
  leaw $16666, %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)

   
  leaw $16686, %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)

   
  leaw $16706, %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)

   
  leaw $16726, %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)

   
  leaw $16746, %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)

   
  leaw $16766, %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)

   
  leaw $16786, %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)

   
  leaw $16806, %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)

   
  leaw $16826, %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)

   
  leaw $16846, %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)


   
  leaw $16866, %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)

     
  leaw $16886, %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)

  leaw $16906, %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)

  leaw $16926, %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)

  leaw $16946, %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)

  leaw $16966, %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)

  leaw $16986, %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)



  ;;LEDs
  ;; endereco 21184
  leaw $5, %A
  movw %A, %S
  leaw %21184, %A
  movw %S, (%A)
