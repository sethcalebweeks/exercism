(module
  (memory (export "mem") 1)

  (func $equalsChar (param $offset i32) (param $char i32) (result i32)
    (i32.eq (i32.load8_u (local.get $offset)) (local.get $char))
  )

  (func (export "countNucleotides") (param $offset i32) (param $length i32) (result i32 i32 i32 i32)
    (local $A i32)
    (local $C i32)
    (local $G i32)
    (local $T i32)
    (block $return
      (if (i32.eqz (local.get $length)) (br $return))
      (loop $loop
        (if 
          (call $equalsChar (local.get $offset) (i32.const 65))
          (local.set $A (i32.add (local.get $A) (i32.const 1))))
        (if 
          (call $equalsChar (local.get $offset) (i32.const 67))
          (local.set $C (i32.add (local.get $C) (i32.const 1))))
        (if 
          (call $equalsChar (local.get $offset) (i32.const 71))
          (local.set $G (i32.add (local.get $G) (i32.const 1))))
        (if 
          (call $equalsChar (local.get $offset) (i32.const 84))
          (local.set $T (i32.add (local.get $T) (i32.const 1))))
        (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
        (local.set $length (i32.sub (local.get $length) (i32.const 1)))
        (br_if $loop (local.get $length))
      )
    )
    local.get $A
    local.get $C
    local.get $G
    local.get $T
    i32.add
    i32.add
    i32.add
    (i32.sub (local.get $offset) (i32.const 64))
    i32.lt_u 
    (if
      (then
        (local.set $A (i32.const -1))
        (local.set $C (i32.const -1))
        (local.set $G (i32.const -1))
        (local.set $T (i32.const -1))
      ))    
    (return 
      (local.get $A)
      (local.get $C)
      (local.get $G)
      (local.get $T)
    )
  )
)