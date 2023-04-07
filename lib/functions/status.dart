bool marketStatus(String changePercent24Hr) {
  var a = changePercent24Hr[0];
  
  if (a == '-') {
    return false;
  }
  return true;
}
