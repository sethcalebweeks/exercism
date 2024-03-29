module Test.Generated.Main exposing (main)

import Tests

import Test.Reporter.Reporter exposing (Report(..))
import Console.Text exposing (UseColor(..))
import Test.Runner.Node
import Test

main : Test.Runner.Node.TestProgram
main =
    Test.Runner.Node.run
        { runs = 100
        , report = ConsoleReport UseColor
        , seed = 125837177001180
        , processes = 4
        , globs =
            []
        , paths =
            [ "/home/caleb/exercism/elm/marios-marvellous-lasagna/tests/Tests.elm"
            ]
        }
        [ ( "Tests"
          , [ Test.Runner.Node.check Tests.tests
            ]
          )
        ]