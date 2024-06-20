module MyLibSpec (spec) where

import Control.Exception (evaluate)
import MyLib
import Relude.Unsafe qualified as Unsafe
import Test.Hspec
import Test.Hspec.QuickCheck
import Test.QuickCheck

spec :: Spec
spec = do
  describe "strip" $ do
    it "removes leading and trailing whitespace" $ do
      strip "\t  foo bar\n" `shouldBe` "foo bar"

  describe "pending-example" $ do
    context "when something is pending" $ do
      it "write the normal behaviours" $ do
        -- Or `pending`
        pendingWith "need to wait for something"

  describe "Relude.Unsafe.read" $ do
    context "when used with Int" $ do
      it "is inverse to show" $
        property $
          \x -> (Unsafe.read . show) x `shouldBe` (x :: Int)
  -- `it "..." $ property $ ...` is the same as `prop "..." $ ...` .
  -- `prop` is from Test.Hspec.QuickCheck.

  describe "Relude.Unsafe.head" $ do
    it "returns the first element of a list" $ do
      Unsafe.head [23 ..] `shouldBe` (23 :: Int)

    -- `modifyMaxSuccess` passes arguments to the QuickCheck driver.
    -- It modifies the maximum number of successes before succeeding
    modifyMaxSuccess (const 1000) $
      prop "returns the first element of an *arbitrary* list" $
        \x xs -> Unsafe.head (x : xs) == (x :: Int)

    -- `evaluate` is used for pure function.
    -- `evaluate` forces its argument to WHNF.
    -- use `evaluate . force` if you want NF.
    it "throws an exception if used with an empty list" $ do
      evaluate (Unsafe.head []) `shouldThrow` errorCall "Prelude.head: empty list"

-- Other useful functions
-- `shouldReturn` for IO actions
-- `shouldSatisfy` (a -> Bool)
