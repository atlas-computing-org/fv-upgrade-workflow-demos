method maxArray (a: array < int >) returns (m : int)
//TOFILL
{
  m := a[0];
  var i := 1;
  while (i < a.Length )
  //TOFILL
  {
    m := if m >a[ i] then m else a[i ];
    i := i + 1;
  }
}
