# Возведите a в степень b и результат выражения присвойте переменной solution1
# Разделите b на a и результат присвойте переменной solution2. Не забудьте про преобразование к float.
# Сложите модуль числа a с числом b, а результат присвойте переменной solution3.

require 'wrong/assert'
include Wrong::Assert

a = -4
b = 3

solution1 = a ** b

assert { solution1 == -64 }

solution2 = b/a.to_f

assert { solution2 == -0.75 }

solution3 = a.abs + b

assert { solution3 == 7 }

# Переверните строку используя метод reverse. Результат применения функции запишите в переменную solution1.
# Соберите строку i like ruby по словам применяя << к переменной solution2.
# Используя интерполяцию, соберите строку yes, i like ruby. Воспользуйтесь переменной str при интерполяции.

str = 'i like ruby'

solution1 = str.reverse

assert { solution1 == 'ybur ekil i' }

solution2 << 'like '
solution2 << 'ruby'

solution3 = "yes, #{str}"

assert { solution3 == "yes, i like ruby" }

# Присвойте переменной sym символ symbol.

sym = :symbol

assert { sym == :symbol }

# Добавьте в массив ar1 значение 10.
# Присвойте переменной ar4 пересечение массивов ar2 и ar3.
# Присвойте переменной ar6 срез со второго по четвертый индекс массива ar5

ar1 = [3, 2, 'a', :sym]
ar2 = [3, 2, 'a', :sym]
ar3 = [:sym, 2, 'b']
ar5 = [3, 2, 'a', :sym, 10, 11]

ar1 << 10
ar4 = ar2 & ar3
ar6 = ar5[2, 3]

assert { ar1.last == 10 }
assert { ar4 == [2, :sym] }
assert { ar6 == ['a', :sym, 10] }

# Присвойте переменной range диапазон от 1 до 3 включительно.

range = 1..3

raise 'wrong' unless range.include?(2)
raise 'wrong' unless range.include?(1)
raise 'wrong' unless range.include?(3)
raise 'type is not Range' unless range.is_a?(Range)
raise 'wrong' if range.include?(0)

# Добавьте в хеш hash1 элемент :value с ключом :key
# Удалите из хеша hash2 элемент с ключом :one

hash1 = { one: 1, two: 2, three: 3 }
hash2 = { one: 1, two: 2, three: 3 }

hash1[:key] = :value
hash2.delete(:one)

assert { hash1[:key] == :value }
assert { !hash2.has_key? :one }

# Реализуйте функцию cube которая возводит в куб переданное число.

def cube(num)
  num ** 3
end

assert { cube(3) == 27 }

# Реализуйте функцию result, которая принимает на вход результат хоккейного матча и предполагаемый исход. Если счёт был угадан верно, то функция должна вернуть 2, если исход был угадан верно (победа, ничья, поражение), то функция должна вернуть 1, во всех остальных случаях функция возвращает 0.
# 
# Функция result принимает на вход четыре параметра: a, b, c, d. a:b — реальный счёт, а c:d — предполагаемый.
# 
# Примеры:

2 == result(1, 2, 1, 2) // 1:2 - реальный счёт, 1:2 - предполагаемый
1 == result(1, 3, 1, 2) // 1:3 - реальный счёт, 1:2 - предполагаемый
0 == result(4, 3, 0, 0) // 4:3 - реальный счёт, 0:0 - предполагаемый

def result(a, b, c, d)
  if a == c && b == d
    2
  elsif a > b && c > d || a < b && c < d || a == b && c == d
    1
  else
    0
  end
end

assert { 1 == result(1, 2, 1, 3) }
assert { 1 == result(2, 1, 3, 1) }
assert { 1 == result(1, 1, 2, 2) }
assert { 0 == result(2, 2, 1, 2) }
assert { 0 == result(2, 2, 3, 2) }
assert { 0 == result(1, 2, 3, 2) }
assert { 2 == result(0, 0, 0, 0) }
assert { 2 == result(1, 2, 1, 2) }
assert { 2 == result(4, 2, 4, 2) }

# Реализуйте функцию product, которая сворачивает последовательность с помощью переданной функции. 
# То есть вместо жестко заданной операции, например, сложения, нужно рекурсивно применять переданную функцию.
# Примеры:
3 == product(1, 2, -> (first, second) { first + second }) // sum
6 == product(1, 3, -> (first, second) { first * second }) // multi

def product(num1, num2, func)
  return num1 if num1 == num2
  return func.call(product(num1, num2 - 1, func), num2)
end

sum = -> (num1, num2) { return num1 + num2 }
assert { 1 == product(1, 1, sum) }
assert { 3 == product(1, 2, sum) }

multi = -> (num1, num2) { return num1 * num2 }
assert { 6 == product(1, 3, multi) }
assert { 24 == product(2, 4, multi) }

pow = -> (num1, num2) { return num1 ** num2 }
assert { 4096 == product(2, 4, pow) }

# Допишите функцию my_pow. Эта функция принимает на вход два числа, и возводит первый аргумент в степень, представленную вторым аргументом. 
# Используйте рекурсию.

def my_pow(base, exp)
  pow_iter = -> (exp, acc) {
    return acc if exp == 0
    pow_iter.call(exp - 1, acc * base)
  }

  pow_iter.call(exp, 1)
end

assert { my_pow(2, 3) == 8 }
assert { my_pow(3, 3) == 27 }
assert { my_pow(1, 2) == 1 }

# Реализуйте функцию sum_of, которая принимает на вход коллекцию (все что можно итерировать с помощью метода each) чисел и блок. 
# Функция должна вернуть сумму всех значений коллекции после применения блока к каждому из значений.

# Пример с блоком, внутри которого значение умножается на 2:
#   1 * 2 + 2 * 2 + 3 * 2

    result = sum_of(1..3) do |num|
      num * 2
    end
    assert { result == 12 }

# Пример с блоком, внутри которого к значению прибавляется 3:
# (1 + 3) + (100 + 3) + (3 + 3)
    result = sum_of([1, 100, 3]) do |num|
      num + 3
    end
    assert { result == 113 }

def sum_of(range)
  sum = 0
  range.each do |num|
    sum += yield num
  end
  sum
end

result1 = sum_of(1..3) do |num|
  num * 2
end
assert { result1 == 12 }

result2 = sum_of([1, 100, 3]) do |num|
  num + 3
end
assert { result2 == 113 }

# Преобразуйте строчку так, чтобы на выходе получился массив содержащий только числа, которые делятся без остатка на 3.

# Исходная строка: "1 2 3 4 5 6 7 8 9 10" Результирующий массив: [3, 6, 9]

string = "1 2 3 4 5 6 7 8 9 10"

result = string.split(' ').map(&:to_i).select{|el| el % 3 == 0}

assert { result == [3, 6, 9] }
