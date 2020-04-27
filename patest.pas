unit patest;

type MainTestClass = class
end;

procedure main();
begin
  var subClassList := typeof(MainTestClass).Assembly.GetTypes().Where(t -> t.isSubClassof(typeof(MainTestClass)));
            
  foreach var subClass in subClassList do
    begin
    var subClassObj := System.Activator.CreateInstance(subClass);
    
    var objectClassMethods: array of string := ('$Init$', 'Equals', 'GetType', 'GetHashCode', 'ToString');
    var methods := subClass.GetMethods.Where(m -> not objectClassMethods.Contains(m.Name));
    
    foreach var method in methods do
      begin
        method.Invoke(subClassObj, nil);
      end;
    end;
  
end;

begin
end.