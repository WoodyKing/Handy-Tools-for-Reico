## This quick script is to process the spool file of DSPHST into a print file.

line_num=0
counter = 2

File.open('spool.txt').each do |line|
  if (line.include?("CPIAD09") &&  
      (line.include?("RESTES") || line.include?("BCOYNE") || line.include?("JMOORE"))) || 
      counter == 0
    print "#{counter} #{line}" 
    counter -= 1
    counter = 2 if counter <= 0
  else
    counter = 2 if counter == 0
  end
end