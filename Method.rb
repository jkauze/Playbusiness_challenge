#Method to verify the two missing number

#List guide
list = (1..1000)

def find(array)
  # iterate in the array
  array.each do |number|
    # verify if number exist in List and delete 
    if list.include?(number)
      list.delete_at(number)
  end
  #after all, the list contains only 2 numbers
  first_element = list.first
  second_element = list.last
end
