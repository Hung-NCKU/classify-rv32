# Assignment 2: Classify

TODO: Add your own descriptions here.
Part A
Task 1: ReLU
This part was relatively simple, as it only required basic loops, address manipulation, and comparisons to complete. Initially, I thought about using multiplication to handle the logic, but due to the constraints, I used neg to process negative values. There were no major issues, and I managed to pass it smoothly.

Task 2: ArgMax
This part was also straightforward—finding the maximum value in an array. Similar to Task 1, it involved basic loops and comparisons to achieve the result.

Task 3.1: Dot Product
This was the first challenging part. At first, I faced issues because I didn’t use a single function for multiplication, which led to duplicate definitions. The hardest part was replacing mul with bitwise operations to perform multiplication. Initially, I didn’t understand this approach, but with the guidance of a classmate, I successfully implemented it and revisited Booth's Algorithm, which was fascinating. I also used more variables here than in previous tasks, giving me a chance to get comfortable with register allocation in assembly. Unlike high-level languages, which manage variable space automatically, in assembly, you can't declare a large number of variables freely, so I feel that this has improved my coding skills.

Task 3.2: Matrix Multiplication
Here, I reviewed row-major matrix handling. By leveraging the previously implemented dot function and getting familiar with address manipulation for row-major matrix multiplication, I was able to complete this task. This part also took a significant amount of time. My experience was that writing the code in C first and then translating it to RISC-V made things smoother.

Part B
Task 1: Read Matrix
This part went smoothly, as it only required a modification similar to the mul rewrite from earlier tasks.

Task 2: Write Matrix
The same as above.

Task 3: Classification
The same as above.

Overall Reflection:
The main takeaway was the importance of comprehensive testing. Through the teacher's multiple test cases, I discovered several bugs in my code that I hadn’t noticed with my simpler tests. I initially thought the project was complete, but the teacher’s debugging tests revealed minor bugs in the dot product and matrix multiplication parts, which prevented the entire project from running correctly. Consequently, I spent a lot of time debugging these issues. Overall, the difficulty level of this assignment was moderate—it allowed me to learn a lot without being overly challenging!
