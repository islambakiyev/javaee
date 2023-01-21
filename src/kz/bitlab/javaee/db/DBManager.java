package kz.bitlab.javaee.db;

import java.util.ArrayList;
import java.util.Iterator;

public class DBManager {
    private static ArrayList<Task> tasks = new ArrayList<>();
    private static Long id  = 4L;

    static {
        tasks.add(new Task(1L,"Создать приложение на Java EE",
                "Это будет Task Manager", "2023-01-22","Нет"));

        tasks.add(new Task(2L,"Разработать скрипты для отдела продаж",
                "Нужно сделать скрипты для всех отделов, а также прописать процессы по работе с CRM",
                "2023-01-28","Нет"));

        tasks.add(new Task(3L,"Написать пост для Instagram",
                "Это должен быть продающий пост для запуска таргетированной рекламы",
                "2023-02-27","Нет"));
    }



    public static void addTask(Task task){
        task.setId(id);
        task.setStatus("Нет");
        tasks.add(task);
        id++;
    }

    public static ArrayList<Task> getTasks() {
        return tasks;
    }


    public static Task getTask(Long id){
        return tasks.stream()
                .filter(task->id == task.getId())
                .findFirst()
                .orElse(null);
    }

    public static void updateTask(Long id, String name, String description, String deadline, String status){
        for(int i = 0; i<tasks.size(); i++){
            if(tasks.get(i).id == id){
                tasks.get(i).setName(name);
                tasks.get(i).setDescription(description);
                tasks.get(i).setDeadlineDate(deadline);
                tasks.get(i).setStatus(status);
            }
        }
    }

    public static void deleteTask(Long id){
        tasks.removeIf(nextTask -> nextTask.getId().equals(id));
    }
}
