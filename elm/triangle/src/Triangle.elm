module Triangle exposing (Triangle(..), triangleKind)


type Triangle
    = Equilateral
    | Isosceles
    | Scalene


triangleKind : number -> number -> number -> Result String Triangle
triangleKind x y z =
    if x <= 0 || y <= 0 || z <= 0 then
        Err "Invalid lengths"

    else if x + y < z || x + z < y || y + z < x then
        Err "Violates inequality"

    else if x == y && y == z then
        Ok Equilateral

    else if x == y || y == z || x == z then
        Ok Isosceles

    else
        Ok Scalene
