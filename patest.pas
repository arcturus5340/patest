unit patest;

type TestCase = class
end;


//procedure assertEqual<T>(a, b: T);
//begin
//  println(a, b);
//end;


procedure main();
begin
  var subClassList := typeof(TestCase).Assembly.GetTypes().Where(t -> t.isSubClassof(typeof(TestCase)));
            
  foreach var subClass in subClassList do
    begin
    var subClassObj := System.Activator.CreateInstance(subClass);
    
    var objectClassMethods: array of string := ('$Init$', 'Equals', 'GetType', 'GetHashCode', 'ToString');
    var methods := subClass.GetMethods.Where(m -> m.Name.StartsWith('test'));
    
    foreach var method in methods do
        method.Invoke(subClassObj, nil);

    end;
  
end;

begin
end.