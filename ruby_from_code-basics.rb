# Здесь выводятся на экран все методы строк,
# которые содержат знак вопроса в имени
# Фактически — это вывод списка предикатов
# То же самое можно сделать для любого типа

puts 'hexlet'.methods.grep(/\?/)

# Реализуйте функцию double(), которая удваивает любое переданное ей число и возвращает его:

# frozen_string_literal: true

def double(num)
  num * 2
end

# Реализуйте функцию предикат even?, которая проверяет, является ли переданное число чётным. 
# Функция должна возвращать true, если число чётное и false, если не чётное. 
# Не используйте встроенные функции для определения четности

def even?(a)
  (a % 2).zero?
end

# написать функцию compare(), которая ведёт себя так же, как и spaceship-оператор

def compare(a, b)
  if a > b
    1
  elsif b > a
    -1
  else
    0
  end
end

# Реализуйте функцию get_sentence_tone(), которая принимает строку и определяет тон предложения. 
# Если все символы в верхнем регистре, то это вопль — 'scream'. В ином случае — нормальное предложение — 'general'.

def get_sentence_tone(sentence)
  sentence.upcase == sentence ? 'scream' : 'general'
end

# Реализуйте функцию prepare_card_for_display(), которая принимает на вход номер карты (в виде строки) и возвращает строку, 
# в которой шесть символов. Первые два — звездочки, последние четыре соответствуют последним четырём цифрам в номере карты

def prepare_card_for_display(card_number)
  last_part = card_number[-4..]
  "**#{last_part}"
end

# Реализуйте функцию show_me_numbers(), которая выводит на экран числа от нуля до переданного в функцию в обратном порядке:

def show_me_numbers(num)
  num.times do |i|
    puts num - i
  end
end

# Напишите функцию average(), считающую среднее арифметическое для всех чисел в диапазоне. Функция должна возвращать Float

def average(start, finish)
  count = finish - start + 1
  sum = 0
  start.upto finish do |i|
    sum += i
  end
  sum.to_f / count
end

# Реализуйте функцию reverse(), которая переворачивает строку. Не используйте в своем решении метод строки reverse

def reverse(str)
  result = ''
  str.each_char do |c|
    result = "#{c}#{result}"
  end
  result
end

# Реализуйте функцию type_of_type(value), которая определяет, является ли тип данных составным, 
# и возвращает символ :complex, если да, и :simple — если нет. 
# Составным считаются только три типа: Hash, Array и Range. Остальные — простые.

def type_of_type(value)
  if value.is_a?(Range) || value.is_a?(Array) || value.is_a?(Hash)
    :complex
  else
    :simple
  end
end

# Реализуйте функцию next_day(), которая возвращает дату начала следующего дня (12:00 a.m.). 
# Функция должна возвращать объект типа Time.

def next_day
  today = Date.today
  tomorrow = today.next
  Time.new tomorrow.year, tomorrow.month, tomorrow.day
end

# Создайте модуль MyNumber. Реализуйте внутри модуля функцию reverse_int(), 
# которая переворачивает цифры в переданном числе (типа Integer) и возвращает новое число.

module MyNumber
  def self.reverse_int(num)
    reversed_abs = num.abs.to_s.reverse.to_i
    num.positive? ? reversed_abs : -reversed_abs
  end
end

# Реализуйте функцию invert_case(), которая меняет в строке регистр каждой буквы на противоположный.

def invert_case(str)
  result = ''
  str.each_char do |char|
    new_char = if char.upcase == char
                 char.downcase
               else
                 char.upcase
               end
    result = "#{result}#{new_char}"
  end

  result
end


# Считается, что билет счастливый, если сумма цифр, входящих в этот билет с самого начала и до середины, равна сумме цифр после середины этого числа. 
# Например, если номер билета 723428, то нам нужно сложить 7 + 2 + 3 и сравнить это с 4 + 2 + 8. Данный билет счастливым не является.

# Напишите функцию happy?(), которая определяет, счастливый ли перед нами билет. Если билет счастливый, функция должна вернуть true, если нет — false. 
# Функция должна работать только с числом, состоящим из чётного количества цифр

happy?(77) # true
happy?(7881) # false
happy?(732930) # true

# BEGIN
def sum_of_digits(num_as_str)
  sum = 0
  num_as_str.each_char do |char|
    sum += char.to_i
  end
  sum
end

def happy?(number)
  num_as_str = number.to_s
  half_count = num_as_str.length / 2
  left_sum = sum_of_digits num_as_str[0, half_count]
  right_sum = sum_of_digits num_as_str[half_count..]
  left_sum == right_sum
end
# END

# Напишите функцию intersection(), которая находит пересечение двух массивов. 
# Под пересечением понимается новый массив, который состоит из элементов, входящих одновременно в оба исходных массива:

intersection([1, 3, 8], [9, 3, 1]); # [3, 1]
intersection([8], [5, 0]) # []

def intersection(coll1, coll2)
  result = []
  coll1.each do |item|
    result << item if coll2.include? item
  end
  result
end


# Некая организация занимается аналитикой распространения COVID-19. Одна из её задач – считать еждневное количество заболевших. 
# Из исходных данных у неё есть ежедневное количество заболевших по странам:
data = [
  ['11-9-2020', 'russia', 10_000],
  ['11-10-2020', 'usa', 35_000],
  ['13-12-2020', 'india', 55_000],
  ['12-11-2020', 'russia', 13_000],
  ['12-12-2020', 'usa', 22_000],
  ['11-12-2020', 'india', 54_000],
]

# Ваша задача — помочь им написать функцию sort_cases(), которая сортирует записи по 
# дате в обратном порядке и возвращает наружу получившийся массив:
result = sort_cases(data)
# result= [
#   ['13-12-2020', 'india', 55_000],
#   ['12-12-2020', 'usa', 22_000],
#   ['11-12-2020', 'india', 54_000],
#   ['12-11-2020', 'russia', 13_000],
#   ['11-10-2020', 'usa', 35_000],
#   ['11-9-2020', 'russia', 10_000]
# ]

def sort_cases(data)
  data.sort_by do |row|
    # destructuring
    day, month, year = row.first.split('-')
    Time.new(year, month, day)
    # it is possible to chain blocks
  end.reverse
end


# Реализуйте функцию get_words_count_by_lang(), которая считает количество слов в тексте
text = 'php ruby php java javascript go go go'
get_words_count_by_lang text
# {
#   php: 2,
#   ruby: 1,
#   java: 1,
#   javascript: 1,
#   go: 3
# }

def get_words_count_by_lang(data)
  # simple solution: data.split.tally
  words = data.split
  result = {}
  words.each do |word|
    result[word] ||= 0
    result[word] += 1
  end
  result
end
