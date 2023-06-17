// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract ToDolist {

  enum TaskStatus {todo, proccess, complete}

    struct listinfo {
        string task;
        string task_desc;
        TaskStatus status;
    }

    mapping (uint => listinfo) todolists;

    function AddTask(uint t_num, string memory t_name, string memory t_desc) public {
        todolists[t_num] = listinfo(t_name, t_desc, TaskStatus.todo);
    }

    function GetTask(uint task_num) public view returns(string memory, string memory, TaskStatus) {
        return (todolists[task_num].task,
                todolists[task_num].task_desc,
                todolists[task_num].status);
    }

    function ProcessTask(uint task_num) public {
        todolists[task_num].status = TaskStatus.proccess;
    }

    function CompleteTask(uint task_num) public {
        todolists[task_num].status = TaskStatus.complete;
    }

}