# CPU Loop Timing

## Follow Up Question #1  
Approximately how many times does it have to loop before it takes a full second to run?

**Answer:**  
My CPU can operate at 5.5 GHz single-core frequency, meaning it can run 5.5 billion clock cycles per second.  
Given the `loop` instruction is 5 clock cycles according to the Intel64 IA32 manual, in order to run the loop for 1 second, theoretically I need **1.1 billion loop instructions**.

So in my code I have:

```asm
xorq %rcx, %rcx  
movq $1100000000, %rcx 

loop_entry:
    loop loop_entry 
```

## Follow Up Question #2  
Can you estimate how many instructions the CPU executed in that time period?

**Answer:**  
Based on my previous calculations: **1.1 billion instructions**.

## Note  
In practice I need approximately **5 billion instructions**, probably loop instruction on my CPU takes less clock cycles to execute.