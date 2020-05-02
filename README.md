# **CS-332 Project #4**

#### Author: Eric Latham

#### Email: eolatham@uab.edu

#### Date: April 10, 2020

---

## **Description**

This program is a simple job scheduler that executes a specified number of non-interactive, background-compatible jobs concurrently, redirecting the output and error streams of each job to `<jobID>.out` and `<jobID>.err`, respectively.

### **Features**

- User input is handled flexibly with respect to whitespace.

- The main program error stream is redirected to `<executable>.err` to avoid interrupting user input.

### **Algorithm**

Divide the main program tasks into threads and execute jobs in new processes.

#### Input Thread (Main Thread)

Handle user input; insert new jobs and respond to commands.

#### Execution Thread

Execute waiting jobs concurrently.

```
- while true:
  - if queue is not empty and number of jobs working < concurrency:
    - take the next job off the queue
    - use a new thread to:
      - increment number of jobs working
      - update job as working
      - use a new process to complete job
      - wait for the process to finish
      - update job as complete
      - decrement number of jobs working
  - wait a second before next iteration
```

## **Instructions**

### **To Compile**

Use any of the following commands:

- `make`
- `gcc -Wall -lpthread -o job_scheduler job_scheduler.c helpers.c`

### **To Run**

Use the following command:

- `./job_scheduler CONCURRENCY`
  - `CONCURRENCY` is an integer clipped to the range `[1, 8]`

### **Commands**

- `submit COMMAND [ARGS]`
  - Add a job with the specified command and arguments to the job queue to be started as soon as possible and print the job's job ID to `stdout`.

- `showjobs`
  - List all jobs that are currently waiting or working by displaying each job's job ID and status.

- `submithistory`
  - List all jobs that were completed during the current session by displaying each job's job ID, thread ID (the ID of the thread the job was completed in), command and arguments, start time, end time, and exit status.
