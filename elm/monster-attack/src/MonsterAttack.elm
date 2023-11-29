module MonsterAttack exposing (..)


type alias MonsterDamage =
    String


attackWith : String -> Int -> String
attackWith weapon strength =
    String.concat [ "Attacked with ", weapon, " of strength ", String.fromInt strength, "." ]


attackWithSword1 : MonsterDamage -> Int -> MonsterDamage
attackWithSword1 monsterDamage strength =
    monsterDamage ++ attackWith "sword" strength


attackWithClaw1 : MonsterDamage -> Int -> MonsterDamage
attackWithClaw1 monsterDamage strength =
    monsterDamage ++ attackWith "claw" strength


attack1 : MonsterDamage -> MonsterDamage
attack1 monsterDamage =
    monsterDamage
        ++ attackWith "sword" 5
        ++ attackWith "claw" 1
        ++ attackWith "claw" 1
        ++ attackWith "sword" 5


attackWithSword2 : Int -> MonsterDamage -> MonsterDamage
attackWithSword2 strength monsterDamage =
    monsterDamage ++ attackWith "sword" strength


attackWithClaw2 : Int -> MonsterDamage -> MonsterDamage
attackWithClaw2 strength monsterDamage =
    monsterDamage ++ attackWith "claw" strength


attack2 : MonsterDamage -> MonsterDamage
attack2 monsterDamage =
    monsterDamage
        |> attackWithSword2 5
        |> attackWithClaw2 1
        |> attackWithClaw2 1
        |> attackWithSword2 5


attack3 : MonsterDamage -> MonsterDamage
attack3 =
    attackWithSword2 5
        >> attackWithClaw2 1
        >> attackWithClaw2 1
        >> attackWithSword2 5
