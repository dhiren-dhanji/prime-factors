CLS
DIM num AS _INTEGER64
DIM c AS STRING
DO
    INPUT "Please enter a number? ", num
    FACTOR_SET (num)
    PRIME_FACTORS (num)
    INPUT "Do you wish to run again? ", c
    IF UCASE$(c) <> "Y" THEN GOTO END_PROG
LOOP

END_PROG:

FUNCTION IS_PRIME (n AS _INTEGER64)
    n = ABS(n)
    IF n = 0 OR n = 1 THEN
        IS_PRIME = 0
    ELSEIF n = 2 OR n = 3 THEN
        IS_PRIME = 1
    ELSE
        FOR i = 2 TO INT(SQR(n)) + 1
            IF n MOD i = 0 THEN
                IS_PRIME = 0
                GOTO OUT_OF_LOOP
            END IF
        NEXT i
        IS_PRIME = 1
        OUT_OF_LOOP:
    END IF
END FUNCTION

SUB PRIME_FACTORS (num AS _INTEGER64)
    DIM n AS _INTEGER64
    DIM i AS _INTEGER64
    DIM j AS _INTEGER64
    n = ABS(num)
    PRINT "The prime factors of"; n; "are: ";
    IF IS_PRIME(n) THEN
        PRINT n
    ELSE
        'loop through 2 to sqr root of the number
        'you shall find the factors of the number in this range
        'find if the number is divisible by each of the numbers in the range and the number in the range is prime
        'repeat for the same number until it does not divide
        'move to the next number in the range

        IF n = 0 OR n = 1 THEN
            PRINT n; " is neither a prime nor a composite number"
        ELSE
            IF SGN(num) = -1 THEN PRINT SGN(num);
            i = 2
            j = INT(SQR(n)) + 1
            WHILE i <= j
                IF IS_PRIME(i) AND n MOD i = 0 THEN
                    n = n / i
                    PRINT i;
                ELSE
                    i = i + 1
                END IF
            WEND
        END IF
        PRINT:
    END IF
END SUB

SUB FACTOR_SET (num AS _INTEGER64)
    DIM n AS _INTEGER64
    DIM i AS _INTEGER64
    n = ABS(num)
    PRINT "Factor set: ";
    IF n = 0 THEN
        PRINT "Infinite";
    ELSE
        'run a loop from 1 to the number
        'check to see which numbers in the range divide the given number
        PRINT SGN(num);
        FOR i = 1 TO n
            IF n MOD i = 0 AND i <> 1 THEN
                PRINT i;
            END IF
        NEXT i
    END IF
    PRINT:
END SUB
