unit patest;

type TestCase = class
  procedure assertEqual<T>(a, b: T);
  begin
    if a = b then
      println('Test passed!')
    else
      println('Oops! Something get wrong..');
  end;
    
  procedure assertNotEqual<T>(a, b: T);
  begin
    if a <> b then
      println('Test passed!')
    else
      println('Oops! Something get wrong..');
  end;

  procedure assertTrue(cond: boolean);
  begin
    if cond then
      println('Test passed!')
    else
      println('Oops! Something get wrong..');
  end;

  procedure assertFalse(cond: boolean);
  begin
    if not cond then
      println('Test passed!')
    else
      println('Oops! Something get wrong..');
  end;

end;


procedure main();
begin
  var subClassList := typeof(TestCase).Assembly.GetTypes().Where(t -> t.isSubClassof(typeof(TestCase)));
            
  foreach var subClass in subClassList do
    begin
    var subClassObj := System.Activator.CreateInstance(subClass);
    
    var methods := subClass.GetMethods.Where(m -> m.Name.StartsWith('test'));
    foreach var method in methods do
        method.Invoke(subClassObj, nil);
    end;
  
end;

begin
end.