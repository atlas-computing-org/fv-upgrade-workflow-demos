method maxArray(a: array<int>) returns (m: int)
  requires a.Length > 0
  ensures forall k :: 0 <= k < a.Length ==> a[k] <= m
  ensures exists k :: 0 <= k < a.Length && a[k] == m
{
  m := a[0];
  var i := 1;
  while (i < a.Length)
    invariant 1 <= i <= a.Length
    invariant forall k :: 0 <= k < i ==> a[k] <= m
    invariant exists k :: 0 <= k < i && a[k] == m
  {
    m := if m > a[i] then m else a[i];
    i := i + 1;
  }
}
