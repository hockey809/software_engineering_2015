a = ARGV[0].to_i()
b = ARGV[1].to_i()
c = ARGV[2].to_i()
d = (b*b) - (4*a*c)
  if d<0 
    puts "Nqma takova"
  elsif d==0;
    x= -b / (2 * a);
    puts "x = #{x}";
  else d!=0
    x1= -b + Math . sqrt(d)/( 2*a)
    x2= -b - Math . sqrt(d)/(2*a)
  puts "koren x1 = #{x1}","koren x2 = #{x2}";
  puts "Po-malak koren = #{[x1,x2].min}"
  puts "Po-golqm koren = #{[x1,x2].max}"        
end