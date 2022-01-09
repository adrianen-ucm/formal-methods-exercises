module ChurchNum where

-- We want to declare lambda terms explicitly
-- as lambda functions in Haskell without
-- type signatures, as this module explores
-- its untyped version.
{-# ANN module "HLint: ignore" #-}

-- | Convert a Haskell 'Num' into its Church
-- encoded term.
numChurch n = \f x -> foldr (const f) x [1..n]

-- | Convert a Church encoded numeral term
-- into a Haskell 'Num'.
numUnchurch n = n succ 0

-- | Addition of two Church encoded numerals.
add = \m n f x -> n f (m f x)

-- | Multiplication of two Church encoded
-- numerals.
mul = \m n f -> m (n f)

-- | Exponentiation of two Church encoded
-- numerals.
pow = \m n -> n m
