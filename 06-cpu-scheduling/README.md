# Ch. 6: CPU Scheduling

What's the _best_ way of scheduling a series of running processes?

## The 'best' way?

Some metrics we can use to gauge how "good" our scheduler is:

- **Turnaround time** — Difference between completion time and arrival time.
- **Fairness** — Was the CPU divided evenly among the processes? Were there processes that use the CPU more than others?

These two metrics are usually at odds with each other; improving turnaround time typically comes at the cost of "fairly" dividing up the processes.

> Throughout all this, we're assuming the OS knows how long each process is going to run for.

## FIFO

FIFO (First-in, first-out) gives the CPU to the first process that arrives.

- Simple to implement and works fine for processes that are approx. equal in length.
- Processes are never really equal in length though. If the first process runs for a long time, there might be a 'convoy effect'; that process blocks the other processes from running.
