result = `ruby -I A_24_Petar_Petrov_RRdWxRiRIZ/ A_24_Petar_Petrov_RRdWxRiRIZ.rb ../../../hm_count_words/text.txt`
`rm B_13_Ivaylo_Arnaudov.db`
result.delete!("\n")
if result == 'sentence,1some,1"marks",1'
  1
else 
  0
end
