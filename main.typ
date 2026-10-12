#import "template.typ": *
#import "title.typ": *

#show: project

// Титульник
#title-page(
  institute: "Институт информационных технологий (ИИТ)",
  department: "Кафедра Математического обеспечения и стандартизации информационных технологий (МОСИТ)",
  discipline: "Тестирование и верификация программного обеспечения",
  assignment: "Практическая работа №2",
  theme: "МОДУЛЬНОЕ И МУТАЦИОННОЕ ТЕСТИРОВАНИЕ ПРОГРАММНОГО ПРОДУКТА",
  student: "Сазонов Егор Сергеевич,\nСухоручкенко Андрей Сергеевич,\nЕвлешина Варвара Павловна,\nИльин Глеб Дмитриевич",
  group: "ИКБО-23-24",
  professor: "Петрова Анна Александровна",
  professor-position: "Ассистент",
  date: "12-10-2026"
)

// Оглавление
#outline(title: "Оглавление")
#pagebreak()

#include "content/objective.typ"
#include "content/task.typ"

#pagebreak()

#include "content/work.typ"

#pagebreak()
