method convert_map_key(inputs: map<nat, bool>, f: nat -> nat) returns (r: map<nat, bool>)
  requires forall k1, k2 :: k1 in inputs && k2 in inputs && k1 != k2 ==> f(k1) != f(k2)
  ensures forall k :: k in inputs ==> r[f(k)] == inputs[k]
  ensures forall k :: k in r <==> (exists k' :: k' in inputs && f(k') == k)
{
  r := map k | k in inputs :: f(k) := inputs[k];
}

