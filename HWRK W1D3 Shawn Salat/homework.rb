def sum_to(n)
  return n if n == 1
  n + sum_to(n-1)
end


def add_numbers(arr)
  return nil if arr.empty?
  return arr.first if arr.length == 1
  arr[0] + add_numbers(arr[1..-1])
end

def gamma_fnc(n)
  return nil if n == 0
  return n if n == 1
  return 1 if n == 2
  (n-1) * gamma_fnc(n-1)
end

def ice_cream_shop(flavors, favorite)
  return true if flavors[0] == favorite
  return false if flavors.empty?
  ice_cream_shop(flavors[1..-1], favorite)
end

def reverse(str)
  return str if str.length == 1
  str[-1] + reverse(str[0..-2])
end
