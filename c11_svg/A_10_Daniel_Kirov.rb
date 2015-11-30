def circle x,y,r
  '<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'"
  stroke="black" stroke-width="3" fill="red" />'
end

File.open("result.svg", "w") do |f|
  f.write('<svg xmlns="http://www.w3.org/2000/svg">')
  f.write('<circle cx="415" cy="415" r="70" stroke="black" stroke-width="3" fill="yellow" />')
  f.write('<circle cx="500" cy="500" r="50" stroke="black" stroke-width="3" fill="red" />')
  f.write('<circle cx="587" cy="415" r="70" stroke="black" stroke-width="3" fill="yellow" />')
  f.write('<circle cx="415" cy="585" r="70" stroke="black" stroke-width="3" fill="yellow" />')
  f.write('<circle cx="587" cy="585" r="70" stroke="black" stroke-width="3" fill="yellow" />')
  f.write('<text x="500" y="800" fill="black">Daniel Kirov</text>')
  f.write('</svg>')
end
