import Data.Yaml.Parser
import Data.Yaml.Type
import Data.Text
import Data.Monoid

field1 :: Text
field1 = pack "hello: world"

field2 :: Text
field2 = pack "goodbye: 42"

main :: IO ()
main = do
    let parser = Object <$> many1 fieldP
    let text   = field1 <> pack "\n" <> field2
    let result = parseOnly parser text
    print result
    -- print $ parseOnly fieldP field1
    -- print $ parseOnly fieldP field2
    -- print $ parseOnly (many1 fieldP) (field1 <> pack "\n" <> field2)
