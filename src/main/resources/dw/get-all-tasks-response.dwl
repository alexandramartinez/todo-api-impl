%dw 2.0
output application/json
---
payload map {
    id: $.id as String,
    title: $.title,
    description: $.description,
    dueDate: $.dueDate,
    completed: $.completed
}