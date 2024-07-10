// Prompt: Fill in the weakest pre-conditions and strongest post-conditions for the following Dafny code.
// <Code goes here>

// ChatGPT-4 inferred pre- and post-conditions similar to what a professional engineer might do
method GPT4_convert_map_key(inputs: map<nat, bool>, f: nat->nat) returns(r:map<nat, bool>)
  requires forall n1: nat, n2: nat :: n1 != n2 ==> f(n1) != f(n2)
  ensures forall k :: k in inputs <==> f(k) in r
  ensures forall k :: k in inputs ==> r[f(k)] == inputs[k]
{
  r:= map k | k in inputs :: f(k) := inputs[k];
}

// ChatGPT-4o inferred a useful weaker pre-condition. Dafny's verifier gets confused, but this is Dafny's fault
method GPT4o_convert_map_key(inputs: map<nat, bool>, f: nat -> nat) returns (r: map<nat, bool>)
  requires forall k1, k2 :: k1 in inputs && k2 in inputs && k1 != k2 ==> f(k1) != f(k2)
  ensures forall k :: k in inputs ==> r[f(k)] == inputs[k]
  ensures forall k :: k in r <==> (exists k' :: k' in inputs && f(k') == k)
{
  r := map k | k in inputs :: f(k) := inputs[k];
}

// Swapping the two ensures lines in the previous method makes Dafny happy
method GPT4o_swappedLines_convert_map_key(inputs: map<nat, bool>, f: nat -> nat) returns (r: map<nat, bool>)
  requires forall k1, k2 :: k1 in inputs && k2 in inputs && k1 != k2 ==> f(k1) != f(k2)
  ensures forall k :: k in r <==> (exists k' :: k' in inputs && f(k') == k)
  ensures forall k :: k in inputs ==> r[f(k)] == inputs[k]
{
  r := map k | k in inputs :: f(k) := inputs[k];
}