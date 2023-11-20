(module
  (memory (export "mem") 1)

  (func $isLowercaseLetter (param $offset i32) (result i32)
    (i32.and
      (i32.ge_u (i32.load8_u (local.get $offset)) (i32.const 97))
      (i32.le_u (i32.load8_u (local.get $offset)) (i32.const 122))
    )
  )

  (func $isUppercaseLetter (param $offset i32) (result i32)
    (i32.and
      (i32.ge_u (i32.load8_u (local.get $offset)) (i32.const 65))
      (i32.le_u (i32.load8_u (local.get $offset)) (i32.const 90))
    )
  )

  (func $shiftWrapped (param $offset i32) (param $shiftKey i32) (param $max i32)
    (i32.store8 
      (local.get $offset)
      (i32.add (i32.load8_u (local.get $offset)) (local.get $shiftKey)))
    (if 
      (i32.gt_u (i32.load8_u (local.get $offset)) (local.get $max))
      (i32.store8 
        (local.get $offset)
        (i32.sub (i32.load8_u (local.get $offset)) (i32.const 26))))
  )

  (func (export "rotate") (param $textOffset i32) (param $textLength i32) (param $shiftKey i32) (result i32 i32)
    (local $offset i32)
    (local $length i32)
    (local $shifted i32)
    (local.set $offset (local.get $textOffset))
    (local.set $length (local.get $textLength))
    (local.set $shiftKey (i32.rem_u (local.get $shiftKey) (i32.const 26)))
    (loop $loop
      (if 
        (call $isLowercaseLetter (local.get $textOffset))
        (call $shiftWrapped (local.get $textOffset) (local.get $shiftKey) (i32.const 122)))
      (if 
        (call $isUppercaseLetter (local.get $textOffset))
        (call $shiftWrapped (local.get $textOffset) (local.get $shiftKey) (i32.const 90)))
      (local.set $textOffset (i32.add (local.get $textOffset) (i32.const 1)))
      (local.set $textLength (i32.sub (local.get $textLength) (i32.const 1)))
      (br_if $loop (local.get $textLength))
    )
    (return (local.get $offset) (local.get $length))
  )
)