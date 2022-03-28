pragma solidity ^0.5.0;

contract TodoList {
    uint public taskCount;

    struct Task {
        string taskName;
        bool isCompleted;
    }

    mapping(uint256 => Task) public todos;

    event TaskCreated(string task, uint taskNumber);

    constructor() public {
        taskCount = 0;
    }
    function createTask(string memory _taskName) public {

        todos[taskCount++] = Task(_taskName, false);

        emit TaskCreated(_taskName, taskCount - 1);
    }
}