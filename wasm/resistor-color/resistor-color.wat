(module
  (memory (export "mem") 1)

  (data (i32.const 100) "black,brown,red,orange,yellow,green,blue,violet,grey,white")

  ;; Return buffer of comma separated colors
  ;; black,brown,red,orange,yellow,green,blue,violet,grey,white
  (func (export "colors") (result i32 i32)
    (return (i32.const 100) (i32.const 58))
  )

  ;; Called each time a module is initialized
  ;; Can be used to populate globals similar to a constructor
  (func $initialize)
  (start $initialize)

  (func $readString (param $offset i32) (param $len i32) (result i64)
    (local $string i64)
    (loop $loop
      (local.set $len (i32.sub (local.get $len) (i32.const 1)))
      (local.set $string 
        (i64.add
          (local.get $string)
          (i64.shl
            (i64.extend_i32_u (i32.load8_u (local.get $offset)))
            (i64.mul (i64.const 8) (i64.extend_i32_u (local.get $len))))))
      (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
      (br_if $loop (local.get $len))
    )
    (return (local.get $string))
  )

  ;; Given a valid resistor color, returns the associated value 
  (func (export "colorCode") (param $offset i32) (param $len i32) (result i32)
    (local $color i64)
    (local.set $color (call $readString (local.get $offset) (local.get $len)))
    (if 
      (i64.eq (local.get $color) (i64.const 422725116779)) ;; black
      (return (i32.const 0)))
    (if 
      (i64.eq (local.get $color) (i64.const 422826702702)) ;; brown
      (return (i32.const 1)))
    (if 
      (i64.eq (local.get $color) (i64.const 7497060)) ;; red
      (return (i32.const 2)))
    (if 
      (i64.eq (local.get $color) (i64.const 122537051580261)) ;; orange
      (return (i32.const 3)))
    (if 
      (i64.eq (local.get $color) (i64.const 133476517703543)) ;; yellow
      (return (i32.const 4)))
    (if 
      (i64.eq (local.get $color) (i64.const 444300879214)) ;; green
      (return (i32.const 5)))
    (if 
      (i64.eq (local.get $color) (i64.const 1651275109)) ;; blue
      (return (i32.const 6)))
    (if 
      (i64.eq (local.get $color) (i64.const 130195213018484)) ;; violet
      (return (i32.const 7)))
    (if 
      (i64.eq (local.get $color) (i64.const 1735550329)) ;; grey
      (return (i32.const 8)))
    (if 
      (i64.eq (local.get $color) (i64.const 512852849765)) ;; white
      (return (i32.const 9)))
    (return (i32.const -1))
  )
)