(module
  ;; squareNum is signed
  ;; Result is unsigned
  (func $square (export "square") (param $squareNum i32) (result i64)
    (if 
      (i32.le_u (local.get $squareNum) (i32.const 0))
      (then (return (i64.const 0))))
    (if
      (i32.gt_u (local.get $squareNum) (i32.const 64))
      (then (return (i64.const 0))))
    (i64.shl
      (i64.const 1)
      (i64.sub (i64.extend_i32_u (local.get $squareNum)) (i64.const 1)))
  )

  ;; Result is unsigned
  (func (export "total") (result i64)
    (i64.const -1)
  )
)
