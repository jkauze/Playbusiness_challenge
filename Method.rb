#Method to verify the two missing number


list = (1..1000)
conditional = true

def find(array)
  # iterate in the array
  array.each do |number|
    # verify if number exist in List
    # Second verification
    if list.include?(number) && !conditional
      second_element = number
    #firts verification, if its true then never can entry again
    elsif list.include?(number) && conditional
      first_element = number
      conditional = false
 
    puts first_element  #Show the firts element
    puts second_element #Show the second element
end