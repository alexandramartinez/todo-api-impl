%dw 2.0
output application/java
---
{
    id: vars.taskId.taskId default payload.id,
    title: payload.title default null,
    description: payload.description default null,
    dueDate: payload.dueDate default null,
    completed: payload.completed default false
}