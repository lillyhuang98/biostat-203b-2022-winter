*Lilly Huang*

### Overall Grade: 105/120

### Quality of report: 10/10

-   Is the homework submitted (git tag time) before deadline? Take 10 pts per day for late submission. 

    Yes. January 21, 5:52 PM PST.

-   Is the final report in a human readable format html? 

    Yes.

-   Is the report prepared as a dynamic document (R markdown) for better reproducibility?

    Yes.

-   Is the report clear (whole sentences, typos, grammar)? Do readers have a clear idea what's going on and how results are produced by just reading the report? Take some points off if the solutions are too succint to grasp, or there are too many typos/grammar. 

    Yes.

### Completeness, correctness and efficiency of solution: 59/70

- Q1 (10/10)

	Is the GitHub.com repository name set up correctly? If using name other than `biostat-203b-2022-winter`, take 5 points off.

- Q2 (20/20)

- Q3 (10/20)

    Question 3.5, Lines 127:132, that is close to the right answer. Why do you use tail-523740? That messes up your answer. `-5`.
    
    Question 3.6 and lines 144:177, tail-523740 should be replaced with sort. The unique values and their numbers should be a small table. `-5`.
  
- Q4 (10/10)

- Q5 (9/10)

    The question said to try. We expect you to `eval = TRUE` each command so you can run them in real-time and make sure of what they do.
	    
### Usage of Git: 10/10

-   Are branches (`main` and `develop`) correctly set up? Is the hw submission put into the `main` branch?

    Yes.

-   Are there enough commits (>=5) in develop branch? Are commit messages clear? The commits should span out not clustered the day before deadline. 
          
-   Is the hw1 submission tagged? 

    Yes.

-   Are the folders (`hw1`, `hw2`, ...) created correctly? 

    Yes.
  
-   Do not put a lot auxiliary files into version control. 

-   If those gz data files or `pg42671` are in Git, take 5 points off.

### Reproducibility: 8/10

-   Are the materials (files and instructions) submitted to the `main` branch sufficient for reproducing all the results? Just click the `knit` button will produce the final `html` on teaching server? 

For most lines of code, please leave `eval = TRUE`. For instance, lines 101:106 now produce live output. There are many instances of this in your code. Please leave eval = TRUE in the next homework. `-2`.

-   If necessary, are there clear instructions, either in report or in a separate file, how to reproduce the results?

### R code style: 18/20

For bash commands, only enforce the 80-character rule. Take 2 pts off for each violation. 

-   [Rule 3.](https://google.github.io/styleguide/Rguide.xml#linelength) The maximum line length is 80 characters. 
    
    Question 3.6, lines 144:176 are 82 characters long. `-2`
    
-   [Rule 4.](https://google.github.io/styleguide/Rguide.xml#indentation) When indenting your code, use two spaces.

-   [Rule 5.](https://google.github.io/styleguide/Rguide.xml#spacing) Place spaces around all binary operators (=, +, -, &lt;-, etc.). 
	
-   [Rule 5.](https://google.github.io/styleguide/Rguide.xml#spacing) Do not place a space before a comma, but always place one after a comma. 

-   [Rule 5.](https://google.github.io/styleguide/Rguide.xml#spacing) Place a space before left parenthesis, except in a function call.

-   [Rule 5.](https://google.github.io/styleguide/Rguide.xml#spacing) Do not place spaces around code in parentheses or square brackets.
