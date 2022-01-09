module ChurchBool where

-- We want to declare lambda terms explicitly
-- as lambda functions in Haskell without
-- type signatures, as this module explores
-- its untyped version.
{-# ANN module "HLint: ignore" #-}

-- | Convert a Haskell 'Bool' into its Church
-- encoded term.
boolChurch True  = \x y -> x
boolChurch False = \x y -> y

-- | Convert a Church encoded boolean term
-- into a Haskell 'Bool'.
boolUnchurch b = b True False

-- | Negation of a Church encoded boolean.
neg = \b x y -> b y x

-- | Conjunction of two Church encoded
-- booleans.
conj = \b c x y -> b (c x y) y

-- | Disjunction of two Church encoded
-- booleans.
disj = \b c x y -> b x (c x y)
