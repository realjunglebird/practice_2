#import "../template.typ": *

== Разработка программного модуля

Для выполнения практической работы была выбрана тема «Анализатор текста». Участниками команды были разработаны 4 части модуля, каждый участник реализовал по 5 функций. Ниже приводятся фрагменты исходного кода, реализованные каждым из участников (Листинг 1-4).

#code-block(caption:[Фунцкии, которые реализовал Егор Сазонов])[```py
def get_top_words(text: str, top_n: int = 5) -> list[tuple[str, int]]:
    """Подсчёт частоты слов (топ-N)."""
    words = re.findall(r'[a-zA-Z]+', text)
    words = [w.lower() for w in words]
    return Counter(words).most_common(top_n)

def get_sorted_unique_words(text: str) -> list[str]:
    """Сортировка всех уникальных слов в алфавитном порядке."""
    words = re.findall(r'[a-zA-Z]+', text)
    return sorted(set(w.lower() for w in words))

def reverse_words_in_text(text: str) -> str:
    """Разворачивает каждое слово наоборот, сохраняя порядок слов и знаки препинания."""
    # Находим последовательности букв и разворачиваем только их
    return re.sub(r'[a-zA-Z]+', lambda m: m.group(0)[::-1], text)

def remove_substring(text: str, to_remove: str) -> str:
    """Удаляет указанный кусок (подстроку) из текста."""
    return text.replace(to_remove, " ")

def sum_numbers_in_text(text: str) -> int:
    """Сумма всех целых чисел, встречающихся в тексте."""
    numbers = re.findall(r'\d+', text)
    return sum(int(n) for n in numbers)
```]

#code-block(caption:[Фунцкии, которые реализовал Андрей Сухоручкенко])[```py
def count_digits(text: str) -> int:
    """Подсчёт всех цифр"""
    return sum(1 for c in text if c in '123456789')

def count_unique_words(text: str) -> int:
    """Подсчёт уникальных слов"""
    unique_words = set()
    for raw_word in text.split():
        clean = "".join(ch.lower() for ch in raw_word if ch.isalpha())
        if clean:
            unique_words.add(clean)
    return len(unique_words)


def count_sentences(text: str) -> int:
    """Подсчёт предложений"""
    return sum(1 for c in text if c in ".!?")


def count_paragraphs(text: str) -> int:
    """Подсчёт абзацев (разделены пустой строкой или только пробелами)."""
    if not text:
        return 0
    count = 0
    in_paragraph = False
    for c in text:
        if not c.isspace():
            if not in_paragraph:
                count += 1
                in_paragraph = True
        else:
            in_paragraph = False
    return count


def count_capitalized_words(text: str) -> int:
    """Подсчёт слов, начинающихся с заглавной буквы."""
    count = 0
    for word in text.split():
        if word and word[0].isupper() and word[0].isalpha():
            count += 1
    return count
```]

#code-block(caption:[Фунцкии, которые реализовала Варвара Евлешина])[```py
def count_total_words(text: str) -> int:
    """Подсчёт общего количества слов (неуникальных)"""
    return len(text.split())

def count_characters(text: str, include_spaces: bool = True) -> int:
    """Подсчёт символов. Если include_spaces=False, пробелы игнорируются."""
    if include_spaces:
        return len(text)
    return len(text.replace(" ", ""))

def validate_text_structure(text: str) -> bool:
    """
    Проверка структуры текста.
    Возвращает True, если нет двойных пробелов, а также пробелов в начале и конце.
    """
    if not text:
        return True
    if text.startswith(" ") or text.endswith(" "):
        return False
    if "  " in text:
        return False
    return True

def find_longest_word(text: str) -> str:
    """Поиск самого длинного слова."""
    words = re.findall(r'[a-zA-Z]+', text)
    if not words:
        return ""
    return max(words, key=len)

def find_shortest_word(text: str) -> str:
    """Поиск самого короткого слова."""
    words = re.findall(r'[a-zA-Z]+', text)
    if not words:
        return ""
    return min(words, key=len)

def get_top_characters(text: str, top_n: int = 5) -> list[tuple[str, int]]:
    """Возвращает топ-N самых популярных символов в тексте."""
    if not text:
        return []
    counter = Counter(text)
    return counter.most_common(top_n)
```]

#code-block(caption:[Фунцкии, которые реализовал Глеб Ильин])[```py
def count_vowels_and_consonants(text: str) -> tuple[int, int]:
    """Подсчёт гласных и согласных букв в тексте."""
    vowels = re.findall(r'[aeiouAEIOUаеёиоуыэюяАЕЁИОУЫЭЮЯ]', text)
    consonants = re.findall(r'[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZбвгджзйклмнпрстфхцчшщъьБВГДЖЗЙКЛМНПРСТФХЦЧШЩЪЬ]', text)
    return len(consonants), len(vowels)

def remove_punctuation(text: str) -> str:
    """Удаление всех знаков препинания из текста."""
    return re.sub(r'[^\w\s]', '', text)

def get_average_word_length(text: str) -> float:
    """Вычисление средней длины слова в тексте."""
    words = re.findall(r'[a-zA-Zа-яА-ЯёЁ]+', text)
    if not words:
        return 0.0
    return sum(len(word) for word in words) / len(words)

def find_duplicate_words(text: str) -> list[str]:
    """Поиск слов, которые встречаются в тексте более одного раза."""
    words = re.findall(r'[a-zA-Zа-яА-ЯёЁ]+', text)
    words = [w.lower() for w in words]
    counts = Counter(words)
    return [word for word, count in counts.items() if count > 1]

def find_palindromes(text: str, min_length: int = 3) -> list[str]:
    """Поиск слов-палиндромов в тексте."""
    words = re.findall(r'[a-zA-Zа-яА-ЯёЁ]+', text)
    palindromes = set()
    for word in words:
        if len(word) >= min_length:
            lower_word = word.lower()
            if lower_word == lower_word[::-1]:
                palindromes.add(lower_word)
    return sorted(palindromes)
```]

Помимо функций, участники реализовали наборы тестов для своих функций (Листинг 5-8).

#code-block(caption:[Тесты, которые реализовал Егор Сазонов])[```py
# --- get_top_words ---
def test_top_words_basic():
    # 'apple': 3, 'banana': 2, 'orange': 1
    assert get_top_words("apple banana apple orange banana apple", top_n=2) == [('apple', 3), ('banana', 2)]

def test_top_words_case_insensitive():
    assert get_top_words("Hello hello HELLO") == [('hello', 3)]

def test_top_words_empty():
    assert get_top_words("") == []

# --- get_sorted_unique_words ---
def test_sorted_unique_words_basic():
    assert get_sorted_unique_words("banana Apple apple Banana cherry") == ['apple', 'banana', 'cherry']

def test_sorted_unique_words_empty():
    assert get_sorted_unique_words("123 !@#") == []

# --- reverse_words_in_text ---
def test_reverse_words_basic():
    assert reverse_words_in_text("Hello world") == "olleH dlrow"

def test_reverse_words_with_punctuation():
    # Знаки препинания должны остаться на своих местах
    assert reverse_words_in_text("Hello, world!") == "olleH, dlrow!"

def test_reverse_words_empty():
    assert reverse_words_in_text("") == ""

# --- remove_substring ---
def test_remove_substring_basic():
    assert remove_substring("Hello brave new world", "brave ") == "Hello new world"

def test_remove_substring_multiple():
    # replace удаляет все вхождения
    assert remove_substring("a b a b a", "a ") == "b b a"

def test_remove_substring_not_found():
    assert remove_substring("Hello world", "xyz") == "Hello world"

# --- sum_numbers_in_text ---
def test_sum_numbers_basic():
    assert sum_numbers_in_text("I have 2 apples and 30 oranges") == 32

def test_sum_numbers_no_numbers():
    assert sum_numbers_in_text("No numbers here") == 0

def test_sum_numbers_adjacent():
    # "12" и "34" разделены пробелом
    assert sum_numbers_in_text("12 34") == 46
```]

#code-block(caption:[Тесты, которые реализовал Андрей Сухоручкенко])[```py
# --- count_digits ---
def test_digits_mixed():
    assert count_digits("abc123def") == 3

def test_digits_contains_zero():
    assert count_digits("a0b1c") == 2

def test_digits_empty():
    assert count_digits("") == 0

def test_digits_only_digits():
    assert count_digits("0123456789") == 10


# --- count_unique_words ---
def test_unique_words_with_duplicates():
    assert count_unique_words("hello world hello") == 2

def test_unique_words_case_insensitive():
    assert count_unique_words("Apple apple APPLE") == 1

def test_unique_words_empty():
    assert count_unique_words("") == 0


# --- count_sentences ---
def test_sentences_multiple():
    assert count_sentences("Hi. How are you? Fine!") == 3

def test_sentences_none():
    assert count_sentences("no punctuation here") == 0

def test_sentences_only_dots():
    assert count_sentences("a.b.c") == 2


# --- count_paragraphs ---
def test_paragraphs_two():
    assert count_paragraphs("First\nSecond") == 2

def test_paragraphs_empty():
    assert count_paragraphs("") == 0

def test_paragraphs_spaces_only():
    assert count_paragraphs("   \n  \n  ") == 0


# --- count_capitalized_words ---
def test_capitalized_mixed():
    assert count_capitalized_words("Hello world I am Here") == 3

def test_capitalized_all_lower():
    assert count_capitalized_words("hello world") == 0

def test_capitalized_empty():
    assert count_capitalized_words("") == 0
```]

#code-block(caption:[Тесты, которые реализовала Варвара Евлешина])[```py
# --- count_total_words ---
def test_total_words_normal():
    assert count_total_words("hello world") == 2

def test_total_words_multiple_spaces():
    # split() автоматически схлопывает множественные пробелы
    assert count_total_words("hello   world  python") == 3

def test_total_words_empty():
    assert count_total_words("") == 0

# --- count_characters ---
def test_chars_with_spaces():
    assert count_characters("a b c") == 5

def test_chars_without_spaces():
    assert count_characters("a b c", include_spaces=False) == 3

def test_chars_empty():
    assert count_characters("") == 0

# --- validate_text_structure ---
def test_structure_valid():
    assert validate_text_structure("Hello world.") is True

def test_structure_invalid_leading_space():
    assert validate_text_structure(" Hello") is False

def test_structure_invalid_trailing_space():
    assert validate_text_structure("Hello ") is False

def test_structure_invalid_double_space():
    assert validate_text_structure("Hello  world") is False

def test_structure_empty():
    assert validate_text_structure("") is True

# --- find_longest_word / find_shortest_word ---
def test_longest_word():
    assert find_longest_word("I am a student") == "student"

def test_longest_word_tie():
    # Если длина одинаковая, max вернет первое встреченное
    assert find_longest_word("cat dog bat") == "cat"

def test_shortest_word():
    assert find_shortest_word("I am a student") == "I"

def test_shortest_word_tie():
    # min также вернет первое встреченное
    assert find_shortest_word("cat dog bat") == "cat"

def test_longest_shortest_empty():
    assert find_longest_word("") == ""
    assert find_shortest_word("123 !@#") == "" # Нет букв

# --- get_top_characters ---
def test_top_characters_basic():
    # 'a': 2, 'b': 3, 'c': 4
    result = get_top_characters("aabbbcccc", top_n=2)
    assert result == [('c', 4), ('b', 3)]

def test_top_characters_with_spaces():
    # Пробел тоже считается символом
    result = get_top_characters("a a a", top_n=2)
    assert result == [('a', 3), (' ', 2)]

def test_top_characters_empty():
    assert get_top_characters("") == []

def test_top_characters_default_n():
    # Проверяем, что по умолчанию возвращается 5 элементов
    text = "aabbccddeeff"
    result = get_top_characters(text)
    assert len(result) == 5
```]

#code-block(caption:[Тесты, которые реализовал Глеб Ильин])[```py
# --- count_vowels_and_consonants ---
def test_vowels_consonants_english():
    assert count_vowels_and_consonants("hello") == (2, 3)

def test_vowels_consonants_russian():
    assert count_vowels_and_consonants("привет") == (2, 4)

def test_vowels_consonants_mixed():
    assert count_vowels_and_consonants("Hello мир") == (3, 5)

def test_vowels_consonants_empty():
    assert count_vowels_and_consonants("") == (0, 0)

def test_vowels_consonants_only_vowels():
    assert count_vowels_and_consonants("aeiou") == (5, 0)

def test_vowels_consonants_only_consonants():
    assert count_vowels_and_consonants("bcdfg") == (0, 5)

def test_vowels_consonants_with_numbers():
    assert count_vowels_and_consonants("abc123") == (1, 2)

# --- remove_punctuation ---
def test_remove_punctuation_basic():
    assert remove_punctuation("Hello, world!") == "Hello world"

def test_remove_punctuation_multiple():
    assert remove_punctuation("Hi! How are you? Fine.") == "Hi How are you Fine"

def test_remove_punctuation_empty():
    assert remove_punctuation("") == ""

def test_remove_punctuation_no_punctuation():
    assert remove_punctuation("Hello world") == "Hello world"

def test_remove_punctuation_preserves_spaces():
    assert remove_punctuation("a, b. c!") == "a b c"

# --- get_average_word_length ---
def test_average_word_length_basic():
    result = get_average_word_length("cat dog bird")
    assert abs(result - 3.333333) < 0.001

def test_average_word_length_single_word():
    assert get_average_word_length("hello") == 5.0

def test_average_word_length_empty():
    assert get_average_word_length("") == 0.0

def test_average_word_length_with_punctuation():
    assert get_average_word_length("Hello, world!") == 5.0

def test_average_word_length_mixed_case():
    result = get_average_word_length("Cat DOG bird")
    assert abs(result - 3.333333) < 0.001

# --- find_duplicate_words ---
def test_duplicate_words_basic():
    assert find_duplicate_words("hello world hello") == ["hello"]

def test_duplicate_words_multiple():
    result = find_duplicate_words("a b a b c")
    assert set(result) == {"a", "b"}

def test_duplicate_words_no_duplicates():
    assert find_duplicate_words("hello world python") == []

def test_duplicate_words_empty():
    assert find_duplicate_words("") == []

def test_duplicate_words_case_insensitive():
    assert find_duplicate_words("Hello hello HELLO") == ["hello"]

def test_duplicate_words_with_punctuation():
    assert find_duplicate_words("Hello, hello! HELLO.") == ["hello"]

# --- find_palindromes ---
def test_palindromes_basic():
    result = find_palindromes("madam level racecar")
    assert result == ["level", "madam", "racecar"]

def test_palindromes_russian():
    result = find_palindromes("казак шалаш")
    assert result == ["казак", "шалаш"]

def test_palindromes_min_length():
    result = find_palindromes("a to madam", min_length=3)
    assert result == ["madam"]

def test_palindromes_no_palindromes():
    assert find_palindromes("hello world python") == []

def test_palindromes_empty():
    assert find_palindromes("") == []

def test_palindromes_case_insensitive():
    result = find_palindromes("Madam LEVEL")
    assert result == ["level", "madam"]

def test_palindromes_with_punctuation():
    result = find_palindromes("Madam, level!")
    assert result == ["level", "madam"]
```]

После реализации указанных функций участники разбились на пары, и, обменявшись своими частями, произвели тестирование. Пары участников: Егор Сазонов ↔ Андрей Сухоручкенко; Варвара Евлешина ↔ Глеб Ильин.
